;;; confs/sxhkd-mode.el -*- lexical-binding: t; -*-


(setq sxhkd-mode-reload-config t)

(add-to-list 'auto-mode-alist `(,(rx "sxhkdrc" string-end) . sxhkd-mode))
