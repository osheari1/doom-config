;;; confs/telega.el -*- lexical-binding: t; -*-


(use-package! telega
  :config
  (setq telega-server-libs-prefix "/usr"
        telega-accounts (list
                         (list "Riley" 'telega-database-dir telega-database-dir)
                         (list "Riley W" 'telega-database-dir
                               (expand-file-name "w" telega-database-dir))))
  ;; (evil-set-initial-state 'telega-chat-mode 'emacs)
  )

(map! :map global-map
      :desc "telega" "C-c t" telega-prefix-map)


;; (after! telega
;;   (map! :leader
;;         (:prefix-map ("m" . "telega") :desc "test" "t" telega-root-mode-map)))
