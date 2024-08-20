;;; confs/org.el -*- lexical-binding: t; -*-


(setq org-agenda-files (directory-files-recursively org-directory "\\.org$")
      org-log-done 'time    ;; Adds a timestamp and/or note upon task completion
      )



(setq org-tag-alist
      '(
        ;; Category
        (:startgroup)
        ("@work" . ?w)
        (:grouptags)
        ("@caracal" . ?c)
        ("@dlt" . ?d)
        (:endgroup)

        ;; Projects
        (:startgrouptag)
        ("@project" . ?p)
        (:endgrouptag)


        ;; Emacs
        (:startgrouptag)
        ("@emacs" . ?e)
        (:endgrouptag)

        ;; AI
        (:startgrouptag)
        ("@ai" . ?a)
        (:grouptags)
        ("@llm" . ?c)
        (:endgrouptag)

        ;; Misc
        (:startgrouptag)
        ("@ref" . ?r)                   ;; Reference material
        (:endgrouptag)))
