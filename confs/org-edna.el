;;; confs/org-edna.el -*- lexical-binding: t; -*-


(after! org
  (org-edna-mode 1))

(map!
 :map org-mode-map
 :localleader
 :prefix ("E" . "org-edna")
 :desc "Edit deps" "e" #'org-edna-edit
 :desc "Set blocker" "b" #'my/create-or-update-org-edna-blocker)


;; PROMPT
;; * Task In doom emacs, write function that creates or updates an org-edna blocker, linking with an existing task heading (query heading), for the current heading under the cursor (target heading)
;; ** SPEC: Split the main function into smaller functions where appropriate
;; ** SPEC: Use the function 'completing-read' to take input from user and select query heading
;; ** SPEC: The total pool of potential query task headings should be all _tasks headings in org-agenda-files_
;; ** SPEC: Prefix all functions with 'my/'
;; ** STEPS:
;; 1. Collect all task headings from org-agenda-files. This collection will be used to as the pool from which the user will select the desired heading
;; 2. Using 'completing-read', ask the user to select the query heading.
;; 3. If the selected query heading is in a buffer or file other than the target heading (under cursor), then open that file in a horizontal split buffer. If there is already a horizontal split buffer, then simply open the file in that existing split.
;; 4. Check if the query AND target headings have existing ID properties, if not, create one for each.
;; 5. Insert the ID of the query heading into the BLOCKER property of the target heading.
(defun my/create-or-update-org-edna-blocker ()
  "Create or update an org-edna blocker for the current heading."
  (interactive)
  (let* ((headings (my/collect-task-headings))
         (query-marker (my/select-query-heading headings))
         (target-marker (point-marker)))
    (when (not (eq (marker-buffer query-marker) (current-buffer)))
      (my/open-query-file query-marker))
    (let ((query-id (my/ensure-id-property query-marker))
          (target-id (my/ensure-id-property target-marker)))
      (with-current-buffer (marker-buffer target-marker)
        (goto-char target-marker)
        (my/update-blocker-property target-id query-id)))))


(defun my/collect-task-headings ()
  "Collect all task headings from org-agenda-files."
  (let ((headings '()))
    (dolist (file (org-agenda-files))
      (with-current-buffer (find-file-noselect file)
        (org-map-entries
         (lambda ()
           (when (org-entry-is-todo-p)
             (push (cons (org-get-heading t t t t) (point-marker)) headings))))))
    headings))

(defun my/select-query-heading (headings)
  "Ask user to select a query heading using completing-read."
  (let* ((candidates (mapcar (lambda (h) (car h)) headings))
         (selection (completing-read "Select query heading: " candidates nil t)))
    (cdr (assoc selection headings))))

(defun my/open-query-file (marker)
  "Open the file containing the query heading in a vertical split."
  (let ((file (marker-buffer marker)))
    (if (get-buffer-window file)
        (select-window (get-buffer-window file))
      (if (> (length (window-list)) 1)
          (other-window 1)
        (split-window-right))
      (switch-to-buffer file))
    (goto-char marker)))

(defun my/ensure-id-property (heading-marker)
  "Ensure the heading at HEADING-MARKER has an ID property."
  (with-current-buffer (marker-buffer heading-marker)
    (goto-char heading-marker)
    (org-id-get-create)))


(defun my/update-blocker-property (target-id query-id)
  "Update the BLOCKER property of the target heading with query-id."
  (org-set-property "BLOCKER" (format "ids(%s)" query-id)))
