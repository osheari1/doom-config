;;; confs/org.el -*- lexical-binding: t; -*-


(setq org-agenda-files (directory-files-recursively org-directory "\\.org$")
      org-log-done 'time    ;; Adds a timestamp and/or note upon task completion
      )



(setq org-tag-alist
      '(

        ;; Topic
        (:startgrouptag)
        ("@crypto". ?C)
        ("@ai" . ?A)
        (:grouptags)
        ("@ai#llm" . ?l)
        ("@ai#audio" . ?a)
        ("@ai#video" . ?v)
        (:endgrouptag)



        ;; Work category - mutually exclusive
        (:startgroup)
        ("@work" . ?W)
        (:grouptags)
        ("@work#caracal" . ?c)
        ("@work#dlt" . ?d)
        ("@work#india" . ?i)
        (:endgroup)

        ;; Projects
        (:startgrouptag)
        ("@project" . ?P)
        (:endgrouptag)

        ;; Emacs
        (:startgrouptag)
        ("@emacs" . ?E)
        (:grouptags)
        ("@emacs#gptel" . ?g)
        ("@emacs#roam" . ?r)
        ("@emacs#org" . ?o)
        (:endgrouptag)


        ;; Terminal
        (:startgrouptag)
        ("@terminal" . ?T)
        (:endgrouptag)



        ;; Misc
        (:startgrouptag)
        ("@ref" . ?R) ;; Reference material
        ("@learn" . ?L)
        (:endgrouptag)

        ;; People
        (:startgrouptag)
        ("@person")
        (:grouptags)
        ("@person#contact")
        ("@person#friend")
        (:endgrouptag)


        ))
