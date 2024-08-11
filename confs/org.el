;;; confs/org.el -*- lexical-binding: t; -*-

(use-package! org-fancy-priorities
  :hook (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("\u25A0" "\u25A0" "\u25A0")))



