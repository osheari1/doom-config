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
          (file ,(org-roam-capture-template-%?-path "default"))
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
          :desc "Find project" "p" #'my/org-roam-find-project))))

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
                 (file ,(org-roam-capture-template-%?-path "project"))
                 :target (file+head
                          org-roam-capture-template-filename
                          "#+TITLE: ${title}\n#+CATEGORY: ${title}\n#+FILETAGS: @project")
                 :unnarrowed t))))
