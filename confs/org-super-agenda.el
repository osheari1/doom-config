;;; confs/org-super-agenda.el -*- lexical-binding: t; -*-


(setq
 org-super-agenda-header-map 'evil-org-agenda-mode-map

 org-super-agenda-groups
 '(
   (:name "Caracal"
    :time-grid t
    :tag ("@caracal"))

   (:name "Caracal Tech"
    :time-grid t
    :tag ("@caracal%tech"))

   (:name "Biz - DLT"
    :time-grid t
    :tag ("@biz%dlt"))

   (:name "Biz - Bala"
    :time-grid t
    :tag ("@biz%bala"))

   (:name "Finances"
    :time-grid t
    :tag ("@finance" "@bills" "@realestate"))

   (:name "Tools"
    :tag ("@tool"
          "@emacs"
          "@emacs%gptel"
          "@emacs%roam"
          "@emacs%org"
          "@emacs%agenda"))
   ))
(org-super-agenda-mode)
