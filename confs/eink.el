;;; configs/eink.el -*- lexical-binding: t; -*-


;; Toggle eink font
(defvar my/default-font doom-font)
(defvar my/eink-font (font-spec
                      :family "FiraCode Nerd Font"
                      :size 14
                      :weight 'bold))
(defvar my/eink-font-toggle-status t)

(defun my/eink-toggle-font ()
  "Toggle between default and alternate font."
  (interactive)
  (if my/eink-font-toggle-status
      (setq doom-font my/eink-font)
    (setq doom-font my/default-font))
  (setq my/eink-font-toggle-status (not my/eink-font-toggle-status))
  (doom/reload-font))


(map! :leader
      :desc "Toggle font" "t e" #'my/eink-toggle-font)
