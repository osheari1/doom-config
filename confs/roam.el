;;; confs/roam.el -*- lexical-binding: t; -*-

(setq! org-roam-directory "~/org/"
       org-roam-graph-viewer "/usr/bin/emacs"

       ;; In org files, don't need to type '[[]]' to get completion session
       org-roam-completion-everywhere t

       ;; capture templates
       org-roam-capture-templates
       '(
         ("d" "default" plain "%?"
          :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
          :unnarrowed t)
         ("e" "example" plain
          (file "~/.config/doom/templates/org-roam/example.org")
          :target (file+head
                   "%<%Y%m%d%H%M%S>-turtles-${slug}.org"
                   "#+title: Turtles-${title}\n#+filetags: TEST_FILE_TAG\n#+date: %U\n"
                   )
          :unnarrowed t))

       ;; capture templates dailies
       org-roam-dailies-capture-templates
       '(("d" "default" entry "* %<%H:%M>: %?" :target
          (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n"))))


;; Like org-roam-node-insert, but won't prompt for content.
;; Use when you want to create a new node from another node without
;; filling in content.
(defun org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (cons arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))


;; org-mode map
(map! (:when (modulep! :lang org +roam2)
        :map org-mode-map
        :localleader
        :prefix ("m" . "org-roam")
        "G" #'org-id-get-create
        "I" #'org-roam-node-insert-immediate))
