;;; confs/roam.el -*- lexical-binding: t; -*-

(load! "capture-templates.el")


(setq! org-roam-directory "~/org/"
       org-roam-graph-viewer "/usr/bin/emacs"

       ;; In org files, don't need to type '[[]]' to get completion session
       org-roam-completion-everywhere t

       ;; capture templates
       ;; TODO: Extract head into files
       org-roam-capture-templates
       `(("d" "default" plain
          (file ,(org-roam-capture-template-body-path "default"))
          :target (file+head
                   org-roam-capture-template-filename
                   "#+TITLE: ${title}\n#+CATEGORY: ${title}")
          :unnarrowed t))



       ;; capture templates dailies
       org-roam-dailies-capture-templates
       '(("d" "default" entry "* %?" :target
          (file+head "%<%Y-%m-%d>.org" "#+TITLE: %<%Y-%m-%d>\n"))))





;; org-roam notes map
(map! :leader
      (:prefix-map
       ("n" . "notes")
       (:when (modulep! :lang org +roam2)
         (:prefix ("r" . "roam")
          :desc "Find project" "p" #'my/org-roam-find-project
          (:prefix ("c" . "filter")
           :desc "By tag" "t" #'my/org-roam-find-nodes-by-tag)))))

;; org-mode map
(map! (:when (modulep! :lang org +roam2)
        :map org-mode-map
        :localleader
        :prefix ("m" . "org-roam")
        "G" #'org-id-get-create
        "I" #'my/org-roam-node-insert-immediate))




;; Updates org-agenda-files with current buffer.
;; Used for custom capture workflows
(defun my/org-roam-project-finalize-hook ()
  "Adds the captured project file to `org-agenda-files'
if the capture was not aborted."
  ;; Remove the hook since it was added temporarily
  (remove-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

  ;; Add project file to the agenda list if the capture was confirmed
  (unless org-note-abort
    (with-current-buffer (org-capture-get :buffer)
      (add-to-list 'org-agenda-files (buffer-file-name)))))

;; Predicate for filtering org-roam notes by tag
(defun my/org-roam-filter-by-tag (tag-name)
  (lambda (node)
    (member tag-name (org-roam-node-tags node))))


;; Searching all nodes for those with a filetag == project
(defun my/org-roam-find-project ()
  (interactive)
  ;; Add the project file to the agenda after capture is finished
  (add-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

  ;; Select a project file to open, creating it if necessary
  (org-roam-node-find
   nil
   nil
   (my/org-roam-filter-by-tag "@project")
   nil
   :templates `(("p" "project" plain
                 (file ,(org-roam-capture-template-body-path "project"))
                 :target (file+head
                          org-roam-capture-template-filename
                          "#+TITLE: ${title}\n#+CATEGORY: ${title}\n#+FILETAGS: @project")
                 :unnarrowed t))))

(defun my/org-roam-capture-project-task ()
  (interactive)
  ;; Add the project file to the agenda after capture is finished
  (add-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

  ;; Capture the new task, creating the project file if necessary
  (org-roam-capture- :node
                     (org-roam-node-read
                      nil
                      (my/org-roam-filter-by-tag "@project"))
                     :templates
                     `(("p" "project" plain
                        (file ,(org-roam-capture-template-body-path "project-task"))
                        :target (file+head
                                 org-roam-capture-template-filename
                                 "#+TITLE: ${title}\n#+CATEGORY: ${title}\n#+FILETAGS: @project"
                                 )))))




(defun my/org-ql-get-all-tags ()
  "Get a list of all tags used in Org-mode files."
  (let ((result
         (org-ql-select (org-agenda-files)
           '(tags)
           :action (lambda ()
                     (org-get-tags)))))
    (delete-dups (apply 'append result))))


;; Filters for nodes that contain a particular filter
(defun my/org-roam-find-nodes-by-tag ()
  "Interactively filter org-roam nodes by user-specified tags."
  (interactive)
  (let* ((tag-input (completing-read "Enter tag: " (my/org-ql-get-all-tags)))
         (tag-filter (lambda (node)
                       (org-ql-select (org-roam-node-file node)
                         `(tags ,tag-input)))))
    (org-roam-node-find
     nil               ;; Prompt (nil for default)
     nil               ;; Initial input (nil for default)
     tag-filter        ;; Node filtering lambda
     nil               ;; Other params (nil for default)
     :templates nil))) ;; Optionally, define templates
