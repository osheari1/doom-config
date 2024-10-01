;;; confs/sxhkd-mode.el -*- lexical-binding: t; -*-


(add-to-list 'auto-mode-alist `(,(rx "sxhkdrc" string-end) . sxhkd-mode))
