;;; confs/lsp.el -*- lexical-binding: t; -*-


(map! :leader
      (:prefix-map
       ("c" . "code")
       (:when (modulep! :tools lsp)
         (:prefix ("u" . "ui")
                  "i" #'lsp-ui-imenu))))
