;;; confs/org-super-agenda.el -*- lexical-binding: t; -*-



;; Update faces for all groups
(custom-set-faces! '(org-super-agenda-header
                     :height 1.2
                     :weight bold
                     :foreground "#1F8DD6"))

(custom-set-faces! '(org-agenda-date
                     :height 1.4
                     :weight bold
                     :foreground "#1662AF"
                     :overline t))

(custom-set-faces! '(org-agenda-date-today
                     :height 1.4
                     :weight bold
                     :foreground "#4F4A3D"
                     :background "#FFFFCC"
                     :overline t))

(custom-set-faces! '(org-agenda-date-weekend
                     :height 1.4
                     :weight bold
                     :foreground "#4E4E4E"
                     :overline t))



(setq
 org-super-agenda-header-map 'evil-org-agenda-mode-map

 org-super-agenda-groups
 '(
   (:name "Next"
    :time-grid t
    :and (:priority "A" :todo t))

   (:name "Caracal"
    :time-grid t
    :tag ("@caracal" "@caracal%omp"))

   (:name "Caracal Tech"
    :time-grid t
    :tag ("@caracal%tech"))

   (:name "Code Alchemists"
    :time-grid t
    :tag ("@biz%dlt" "@code_alch"))

   (:name "Biz - Bala"
    :time-grid t
    :tag ("@biz%bala"))

   (:name "Zenntech"
    :time-grid t
    :tag ("@zenntech"))

   (:name "Finances"
    :time-grid t
    :tag ("@finance" "@bills" "@realestate"))

   (:name "Tools" :tag ("@tool" ""))

   (:name "Emacs"
    :tag ("@emacs"
          "@emacs%gptel"
          "@emacs%roam"
          "@emacs%org"
          "@emacs%agenda"))
   ))


(org-super-agenda-mode)
