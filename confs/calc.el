;;; confs/calc.el -*- lexical-binding: t; -*-

(map! :leader
      (:prefix-map ("o" . "open")
       :desc "Open full calc" "c" #'full-calc))
