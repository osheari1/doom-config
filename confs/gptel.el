;;; configs/gptel.el -*- lexical-binding: t; -*-

(use-package! gptel
  :config
  (setq! gptel-api-key (get-authinfo-entry "api.openai.com")
         gptel-model "gpt-4o"
         gptel-default-mode 'org-mode))


(map! :leader
      :desc "gptel"
      :prefix ("l" . "gpt")
      :nv "s" #'gptel-send
      :nv "m" #'gptel-menu
      :nv "l" #'gptel)



(setq gptel-directives
      '((default . "")
        (programming . "You are a large language model and a careful programmer. Provide code and only code as output without any additional text, prompt or note.")
        (emacs . "Act as an emacs expert. Respond concisely. Where examples would support the answer, please add them.")
        (emacs-code . "You are an expert on emacs and an expert emacs lisp programmer. Provide code and only code as output without any additional text, prompt or note. Do not wrap in a markdown codeblock (eg ```emacs-lisp ... ```)")
        )
      gptel-prompt-prefix-alist
      '((markdown-mode . "# ")
        (org-mode . "* ")
        (text-mode . "# "))
      )
