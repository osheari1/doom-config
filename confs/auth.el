;;; confs/auth.el -*- lexical-binding: t; -*-

;; Temporarily removed as not being used
;; (require 'auth-source)
;; (setq auth-sources "~/.authinfo.gpg")
;; (defun get-authinfo-entry (hostname username)
;;   (let ((credentials (auth-source-search :host hostname
;;                                          :user username)))
;;     (if credentials
;;         (let ((secret (plist-get (cl-first credentials) :secret)))
;;           (if (functionp secret)
;;               (funcall secret)
;;             secret))
;;       (error "No credentials found for %s" hostname))))
