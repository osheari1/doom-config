;;; confs/org.el -*- lexical-binding: t; -*-


(setq org-agenda-files (directory-files-recursively org-directory "\\.org$")
      org-log-done 'time ;; Adds a timestamp and/or note upon task completion
      org-complete-tags-always-offer-all-agenda-tags t)
