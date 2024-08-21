;;; confs/org.el -*- lexical-binding: t; -*-


(setq org-agenda-files (directory-files-recursively org-directory "\\.org$")
      org-log-done 'time    ;; Adds a timestamp and/or note upon task completion
      )



(setq org-tag-alist
      '(
        ;; Category
        (:startgroup)
        ("@work" . ?W)
        (:grouptags)
        ("@caracal" . ?c)
        ("@dlt" . ?d)
        ("@india" . ?i)
        (:endgroup)

        ;; Projects
        (:startgrouptag)
        ("@project" . ?P)
        (:endgrouptag)


        ;; Emacs
        (:startgrouptag)
        ("@emacs" . ?E)
        (:grouptags)
        ("@gptel" . ?g)
        (:endgrouptag)

        ;; Terminal
        (:startgrouptag)
        ("@terminal" . ?T)
        (:endgrouptag)


        ;; AI
        (:startgrouptag)
        ("@ai" . ?A)
        (:grouptags)
        ("@llm" . ?l)
        ("@audio" . ?a)
        ("@video" . ?v)
        (:endgrouptag)

        ;; Misc
        (:startgrouptag)
        ("@ref" . ?R) ;; Reference material
        ("@learn" . ?L)
        (:endgrouptag)))
