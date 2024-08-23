;;; confs/org.el -*- lexical-binding: t; -*-


(setq org-agenda-files (directory-files-recursively org-directory "\\.org$")
      org-log-done 'time) ;; Adds a timestamp and/or note upon task completion



(setq org-tag-alist
      '((:startgrouptag)
        ("@caracal" . ?C)
        (:grouptags)
        ("@caracal%t_s")
        (:endgrouptag)


        (:startgroup)
        ("@biz". ?B)
        (:grouptags)
        ("@biz%dlt" . ?d)
        ("@biz%bala" . ?b)
        (:endgroup)


        (:startgrouptag)
        ("@crypto")
        (:endgrouptag)


        (:startgrouptag)
        ("@ai")
        (:grouptags)
        ("@ai%llm" . ?l)
        ("@ai%audio" . ?a)
        ("@ai%video" . ?v)
        (:endgrouptag)


        (:startgrouptag)
        ("@finance" . ?F)
        (:grouptags)
        ("@realestate")
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

        ;; Tool
        ("@tool")
        ("@terminal")


        ;; People
        (:startgrouptag)
        ("@person")
        (:grouptags)
        ("@person%contact")
        (:endgrouptag)

        ;; Misc
        ("@ref") ;; Reference material
        ("@learn")
        ("@meeting")




        ))
