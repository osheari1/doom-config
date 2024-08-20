;;; confs/org-roam/capture-templates.el -*- lexical-binding: t; -*-

(defun org-roam-capture-template-filename ()
  "%<%Y%m%d%H%M%S>-${slug}.org")

(defun org-roam-capture-template-%?-path (template)
  (concat  "~/.config/doom/templates/org-roam/" template ".%?.org"))

(defun org-roam-capture-template-head-path (template)
  (concat  "~/.config/doom/templates/org-roam/" template ".head.org"))

(defun org-roam-capture-template-default-target ()
  (file+head
   org-roam-capture-template-filename
   "#+title: ${title}\n#+category: ${title}"))

