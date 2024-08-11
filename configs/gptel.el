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
      :nv "m" #'gptel-menu)



(setq gptel-directives
      '((default . "")
        (programming . "You are a large language model and a careful programmer. Provide code and only code as output without any additional text, prompt or note.")
        (emacs . "Act as an emacs expert. Respond concisely. Where examples would support the answer, please add them.")
        (elisp . "You are an expert emacs lisp programmer. Provide code and only code as output without any additional text, prompt or note.")
        )
      gptel-prompt-prefix-alist
      '((markdown-mode . "# ")
        (org-mode . "* ")
        (text-mode . "# "))
      )
