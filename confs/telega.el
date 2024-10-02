;;; confs/telega.el -*- lexical-binding: t; -*-

(setq telega-server-libs-prefix "/usr"
      telega-accounts (list
                       (list "Riley" 'telega-database-dir telega-database-dir)
                       (list "Riley W" 'telega-database-dir
                             (expand-file-name "w" telega-database-dir))))
