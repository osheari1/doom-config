;;; confs/hledger-mode.el -*- lexical-binding: t; -*-

;; Open files with .journal in hledger
(add-to-list 'auto-mode-alist '("\\.journal\\'" . hledger-mode))

(setq hledger-currency-string "USD")
