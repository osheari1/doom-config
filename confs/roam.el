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
          :unnarrowed t)))
