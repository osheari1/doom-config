;;; confs/markdown.el -*- lexical-binding: t; -*-

;; Add support for .prompt files to use markdown-mode
(add-to-list 'auto-mode-alist '("\\.prompt\\'" . markdown-mode))
