;;; configs/undo-tree.el -*- lexical-binding: t; -*-

(setq global-undo-tree-mode t)
;; For undo in non-file buffers
(add-hook ’evil-local-mode-hook ’turn-on-undo-tree-mode)
