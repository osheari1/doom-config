;;; confs/keycast.el -*- lexical-binding: t; -*-

(map!
 :leader
 (:prefix-map ("t" . "toggle")
  :desc "Toggle keycast-header-line-mode" "k" #'keycast-header-line-mode))
