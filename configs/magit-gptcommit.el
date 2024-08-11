;;; configs/magit-gptcommit.el -*- lexical-binding: t; -*-


(after! magit
  (use-package! llm-openai
    :config
    (setq magit-gptcommit-llm-provider (make-llm-openai
                                        :chat-model "gpt-4o-mini"
                                        :key (get-authinfo-entry "api.openai.com"))
          llm-warn-on-nonfree nil))

  ;; Enable magit-gptcommit-mode to watch staged changes
  ;; and generate commit message automatically in magit status buffer
  ;; This mode is optional, you can also use `magit-gptcommit-generate'
  ;; to generate commit message manually `magit-gptcommit-generate'
  ;; should only execute on magit status buffer currently
  (magit-gptcommit-mode)

  ;; Add gptcommit transient commands to `magit-commit'
  ;; Eval (transient-remove-suffix 'magit-commit '(1 -1)) to remove gptcommit transient commands
  (magit-gptcommit-status-buffer-setup))
