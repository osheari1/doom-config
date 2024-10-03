;;; confs/telega.el -*- lexical-binding: t; -*-


(use-package! telega
  :config
  (setq telega-server-libs-prefix "/usr"
        telega-accounts (list
                         (list "Riley" 'telega-database-dir telega-database-dir)
                         (list "Riley W" 'telega-database-dir
                               (expand-file-name "w" telega-database-dir))))

  (evil-set-initial-state 'telega-root-mode 'emacs)
  (evil-set-initial-state 'telega-chat-mode 'emacs)
  (evil-set-initial-state 'telega-image-mode 'emacs))
