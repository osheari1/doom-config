;;; configs/gptel.el -*- lexical-binding: t; -*-

(use-package! gptel
  :config
  (setq! gptel-api-key (get-authinfo-entry "api.openai.com")
         gptel-model "gpt-4o"
         gptel-default-mode 'org-mode
         gptel-org-branching-context t))


(map! :leader
      :desc "gptel"
      :prefix ("l" . "gptel")
      :nv "s" #'gptel-send
      :nv "m" #'gptel-menu
      :nv "l" #'gptel
      :nv "t" #'gptel-org-set-topic
      :nv "p" #'gptel-org-set-properties)


(setq gptel-directives
      '((default . "")
        (code . "Provide only code as output without any description. Provide only code in plain text format without Markdown formatting. Do not include symbols such as ``` or ```python. If there is a lack of details, provide most logical solution. You are not allowed to ask for more details. For example if the prompt is \"Hello world Python\", you should return \"print('Hello world')\".")
        (emacs . "Act as an emacs expert. Respond concisely. Where examples would support the answer, please add them.")
        (elisp . "You are an expert on emacs and emacs lisp. Provide only emacs lisp code as output without any description. Provide only code in plain text format without Markdown formatting. Do not include symbols such as ``` or ```python. If there is a lack of details, provide most logical solution. You are not allowed to ask for more details. For example if the prompt is \"Hello world Python\", you should return \"print('Hello world')\".")
        (org . "You are an expert on emacs and an emacs org-mode writer. Provide org-mode formatted text only without any additional text, prompt or note. Do not wrap in a markdown codeblock (eg ```emacs-lisp ... ```)")
        (dlt . "Act as an expert on Distributed Ledger Technologies (DLT), blockchain, and crypto. Respond concisely. Where examples would support the answer, please add them.")
        )
      gptel-prompt-prefix-alist
      '((markdown-mode . "# ")
        (org-mode . "* ")
        (text-mode . "# ")))

(gptel-make-anthropic "Claude"
  :stream t
  :key (get-authinfo-entry "api.anthropic.com"))
