;;; configs/functions.el -*- lexical-binding: t; -*-


(defun get-authinfo-entry (machine)
  "Retrieve a particular entry from the .authinfo file."
  (let* ((auth-sources '((:source "~/.authinfo" :host t)))
         (auth-source-result
          (car (auth-source-search :host machine))))
    (if auth-source-result
        (let ((secret (plist-get auth-source-result :secret)))
          (if secret
              (funcall secret)
            (error "No secret found for machine %s" machine)))
      (error "Entry not found for machine %s" machine))))
