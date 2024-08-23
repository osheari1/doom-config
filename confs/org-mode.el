;;; confs/org.el -*- lexical-binding: t; -*-


(setq org-agenda-files (directory-files-recursively org-directory "\\.org$")
      org-log-done 'time    ;; Adds a timestamp and/or note upon task completion
      )



(setq org-tag-alist
      '(
        ;; Work category - mutually exclusive


        (:startgroup)
        ("@caracal" . ?C)
        (:grouptags)
        ("@caracal%it_sln")
        (:endgroup)

        (:startgrouptag)
        ("@biz". ?B)
        (:grouptags)
        ("@biz%dlt" . ?d)
        ("@biz%bala" . ?b)
        (:endgrouptag)


        ;; Topic
        (:startgrouptag)
        ("@crypto")
        ("@ai")
        (:grouptags)
        ("@ai%llm" . ?l)
        ("@ai%audio" . ?a)
        ("@ai%video" . ?v)
        (:endgrouptag)

        (:startgrouptag)
        ("@finance" . ?F)
        (:grouptags)
        ("@finance%realestate")
        (:endgrouptag)


        ;; Projects
        (:startgrouptag)
        ("@project" . ?P)
        (:endgrouptag)

        ;; Emacs
        (:startgrouptag)
        ("@emacs" . ?E)
        (:grouptags)
        ("@emacs%gptel" . ?g)
        ("@emacs%roam" . ?r)
        ("@emacs%org" . ?o)
        (:endgrouptag)


        ;; Terminal
        (:startgrouptag)
        ("@terminal" . ?T)
        (:endgrouptag)



        ;; Misc
        (:startgrouptag)
        ("@ref" . ?R) ;; Reference material
        ("@learn" . ?L)
        ("@meeting")
        (:endgrouptag)

        ;; People
        (:startgrouptag)
        ("@person")
        (:grouptags)
        ("@person%contact")
        (:endgrouptag)))
