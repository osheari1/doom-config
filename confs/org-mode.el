;;; confs/org.el -*- lexical-binding: t; -*-


(setq org-agenda-files (directory-files-recursively org-directory "\\.org$")
      org-log-done 'note ;; Adds a timestamp and/or note upon task completion
      org-complete-tags-always-offer-all-agenda-tags t

      org-enforce-todo-dependencies t
      org-enforce-todo-checkbox-dependencies t
      org-indent-mode t)


(setq org-babel-load-languages
      '((emacs-lisp . t)
        (python . t)
        (rust . t)
        (org . t)))

(org-babel-do-load-languages
 'org-babel-load-languages
 org-babel-load-languages)
