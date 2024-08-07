;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Riley O'Shea"
      user-mail-address "osheari1@gmail.com")


;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Source Code Pro" :size 24 :weight 'regular))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; Dark high contrast
;; (setq doom-theme 'misterioso)
;; (setq doom-theme 'wombat)
;; (setq doom-theme 'tango-dark)
;; (setq doom-theme 'doom-ayu-mirage
;;       doom-ayu-mirage-brighter-comments t)


;; ;; light
(setq doom-theme 'alect-light-alt)
;; (setq doom-theme 'eink-emacs)
;; (setq doom-theme 'mindre)
;; (setq doom-theme 'alect-light)
;; (setq doom-theme 'adwaita)
;; (setq doom-theme 'doom-oksolar-light
;;       doom-oksolar-light-brighter-comments nil
;;       doom-oksolar-light-brighter-modeline nil
;;       )
;; (setq doom-theme 'tango)
;; (setq doom-theme 'doom-acario-light)
;; (setq doom-theme 'doom-ayu-light
;;       doom-ayu-light-comment-bg t
;;       doom-ayu-light-brighter-comments t
;;       doom-ayu-light-brighter-modeline t)
;;
;; (setq doom-theme 'doom-tomorrow-day)

;; ;; Dark
;; (setq doom-theme 'doom-dark+)
;; (setq doom-theme 'doom-ephemeral)
;; (setq doom-theme 'doom-laserwave)
;; (setq doom-theme 'doom-oceanic-next)
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-tomorrow-night)
;; (setq doom-theme 'doom-opera)
;; (setq doom-theme 'doom-Iosvkem)
;; (setq doom-theme 'doom-moonlight)
;; (setq doom-theme 'doom-challenger-deep)
;; (setq doom-theme 'doom-palenight)
;; (setq doom-unicode-font "Noto Color Emoji")



;; ========== EInk ==========
;; eink font
(defvar my/default-font doom-font)
(defvar my/eink-font (font-spec :family "Source Code Pro" :size 28 :weight 'demi-bold))
(defvar my/eink-font-toggle-status t)

(defun my/eink-toggle-font ()
  "Toggle between default and alternate font."
  (interactive)
  (if my/eink-font-toggle-status
      (setq doom-font my/eink-font)
    (setq doom-font my/default-font))
  (setq my/eink-font-toggle-status (not my/eink-font-toggle-status))
  (doom/reload-font))


(map! :leader
      :desc "Toggle font"
      "t e" #'my/eink-toggle-font)


;; ========== Verb ==========
(add-hook! org-mode-hook #'verb-mode)


;; ========== Roam ==========
;; (after! org-roam
;;   (setq org-roam-file-extensions '("org" "md"))
;;   (md-roam-mode 1) ; md-roam-mode needs to be active before org-roam-db-sync
;;   (setq md-roam-file-extension "md") ; Default is "md". Specify an extension such as "markdown"
;;   (org-roam-db-autosync-mode) ; autosync-mode triggers db-sync. md-roam-mode must be already active
;;   )



;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.



;; ========== Global ==========
;; Maximize on startup
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))


;; Font ligatures
(plist-put! +ligatures-extra-symbols
            ;; org
            :name          "»"
            :src_block     "»"
            :src_block_end "«"
            :quote         "“"
            :quote_end     "”"
            ;; Functional
            :lambda        "λ"
            :def           "ƒ"
            :composition   "∘"
            :map           "↦"
            ;; Types
            :null          "∅"
            :true          "₸"
            :false         "₣"
            :int           "ℤ"
            :float         "ℝ"
            :str           "Ꮥ"

            :bool          "฿"
            :list          "[]"
            ;; Flow
            :not           "￢"
            :in            "∈"
            :not-in        "∉"
            :and           "∧"
            :or            "∨"
            :for           "∀"
            :some          "∃"
            :return        "⟼"
            :yield         "⟻"
            ;; Other
            :union         "⋃"
            :intersect     "∩"
            :diff          "∖"
            :tuple         "⨂"
            :dot           "•"
            )  ;; you could also add your own if you want


(setq
 ;; Doom disables auto-save
 auto-save-default t
 ;; Disable quit prompt
 confirm-kill-emacs nil
 ;; Backup files by default
 make-backup-files t
 ;; Set default projective path to Projects dir
 ;; projectile-project-search-path `("~/Code/" "~/Code/Audits/", "~/Code/Tutorials/", "~/Code/Libs/", "~/Code/Libs/cosmwasm", "~/Code/Tests")
 projectile-project-search-path `("~/repos/" "~/study/scala" "~/study/rust" "~/caracal/apps/repos" "~/caracal/repos")

 ;; Rainbow delimiters mode
 rainbow-delimiters-mode t

 ;; Emacs performance
 ;; gc-cons-threshold 500000000
 ;; read-process-output-max (* (* 1024 1024) 4)  ;; 1mb
 ;; lsp-idle-delay 0.500

 ;; Display time
 ;; display-time-mode t

 debug-on-quit t

 pixel-scroll-precision-mode t

 ;; flycheck-solidity-solium-soliumrcfile "/Users/riley/Configs/.soliumrc.json"
 ;; solidity-solc-path "/opt/homebrew/bin/solc"
 ;; solidity-solium-path "/opt/homebrew/bin/solium"
 ;; solidity-flycheck-solc-checker-active nil
 ;; solidity-flycheck-solium-checker-active t
 ;; flycheck-solidity-solc-addstd-contracts t
 ;; solidity-flycheck-chaining-error-level t

 ;; flycheck-checker-error-threshold 600

 ;; This determines the style of line numbers in effect. If set to `nil', line
 ;; numbers are disabled. For relative line numbers, set this to `relative'.
 display-line-numbers-type 'relative

 ;; Auth sources
 auth-sources '("~/.authinfo")

 )


;; ========== World Clock ========
;; (setq
;;  world-clock-list '(("America/Los_Angeles" "Los Angeles")
;;                     ("America/New_York" "New York")
;;                     ("Europe/London" "London")
;;                     ("Europe/Moscow" "Moscow")
;;                     ("Asia/Tbilisi" "Tbilisi")
;;                     ("Asia/Bishkek" "Bishkek")
;;                     ("Asia/Vladivostok" "Vladivostok"))
;;  world-clock-time-format "%A %d %B %R %z"
;;  )

;; ========== sh mode ========

;; ========== TOML ========
;; TODO: Setup toml lsp


;; TODO: create hotkey for vc-net-conflict
;; TODO: create hotkey for evil-multiedit-match-all
;; TODO: Create hotkey for avy-copy-line
;; TODO: Create hotkey for avy-copy-region
;; TODO: Create hotkey for world click
;; (map! :prefix "t" "c" #'world-clock)

;; TODO: Figure out how to create key macros
;; ========== Custom Keys ==========
;; (map!
;;  :mode 'elixir-mode
;;  :i "C-<f16>" "->"
;;  :i "C-<f17>" "=>"
;;  :i "C-<f18>" "<%="
;;  :i "C-<f19>" "|>")

;; (map!
;;  :mode 'web-mode
;;  :i "C-<f18>" "<%=")


;; ========== plantuml ==========
;; /home/r/.emacs.d/.local/etc

(setq plantuml-jar-path "/home/r/.emacs.d/.local/etc/plantuml.jar")
(setq plantuml-default-exec-mode 'jar)

;; ========== graphviz ==========
;; (use-package! company-graphviz-dot)
(after! org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((nil . t) (emacs-lisp . t) (dot . t))))


;; ========== magit ==========
;; (map! :prefix "g" "x" #'smerge-vc-next-conflict)
(add-hook! 'magit-mode-hook #'magit-todos-mode)
;; TODO: fix git-link so it includes the commit hash. It shows up as blank currently
(setq magit-todos-exclude-globs '(".git/" "node_modules/" ".venv/"))

;; ========== Git  ==========
(map! :leader (:prefix "g" "z" #'git-link))
;; (map! :leader
;;       (:prefix ("" . "debug")
;;        :desc "Start" "d" #'+debugger/start
;;        :desc "Start new" "D" (cmd!! #'+debugger/start t)
;;        :desc "Edit temlate" "e" #'dap-debug-edit-template
;;        (:prefix ("b" . "breakpoints")
;;         :desc "Add" "a" #'dap-breakpoint-add
;;         :desc "Delete" "d" #'dap-breakpoint-delete
;;         )))

;; TODO: Set up spell checker
;; ========== ispell ==========
;; (setq ispell-dictionary "/Users/riley/libs/dictionaries/dictionaries/en/index.aff")
;; (setq ispell-local-dictionary-alist
;;       '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))
;; (setq ispell-hunspell-dictionary-alist ispell-local-dictionary-alist)

;; (add-to-list 'ispell-local-dictionary-alist '("english-hunspell"
;;                                               "[[:alpha:]]"
;;                                               "[^[:alpha:]]"
;;                                               "[']"
;;                                               t
;;                                               ("-d" "en_US")
;;                                               nil
;;                                               iso-8859-1))
;; (setq ispell-program-name "hunspell"          ; Use hunspell to correct mistakes
;;       ispell-dictionary   "english-hunspell") ; Default dictionary to use



;; ========== Debugger ==========
;; (map! :leader
;;       (:prefix ("d" . "debug")
;;        :desc "Start" "d" #'+debugger/start
;;        :desc "Start new" "D" (cmd!! #'+debugger/start t)
;;        :desc "Edit temlate" "e" #'dap-debug-edit-template
;;        (:prefix ("b" . "breakpoints")
;;         :desc "Add" "a" #'dap-breakpoint-add
;;         :desc "Delete" "d" #'dap-breakpoint-delete
;;         )))

;; (setq dap-cpptools-extension-version "1.9.8")

;; (use-package! lsp-rust
;;   :config
;;   (require 'dap-cpptools))


;; ========== Rust ==========
(after! lsp-rust
  (setq lsp-rust-analyzer-lru-capacity 200
        lsp-rust-analyzer-server-display-inlay-hints t
        lsp-rust-analyzer-display-chaining-hints t
        lsp-rust-analyzer-display-reborrow-hints t
        lsp-rust-analyzer-display-closure-return-type-hints t
        lsp-rust-analyzer-display-parameter-hints t
        lsp-rust-analyzer-display-lifetime-elision-hints-enable t
        lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names t
        lsp-rust-analyzer-cargo-watch-enable t
        lsp-rust-analyzer-cargo-run-build-scripts t
        lsp-rust-analyzer-proc-macro-enable t
        lsp-rust-analyzer-cargo-watch-command "clippy"
        lsp-rust-analyzer-server-format-inlay-hints t
        lsp-rust-analyzer-server-display-inlay-hints t
        lsp-rust-analyzer-max-inlay-hint-length 80

        )
  )

(setq rustic-default-test-arguments "--benches --tests --all-features -- --nocapture")






;; ========== Tramp ==========
;; (setq tramp-default-method "ssh")


;; ========== Markdown  ==========
;; (setq +format-on-save-enabled-modes (nconc +format-on-save-enabled-modes ( list 'markdown-mode )))
;; (setq-hook! 'gfm-mode-hook +format-with-lsp nil) ;; Uses prettier instead of lsp formatter
;; (setq-hook! 'markdown-mode-hook +format-with-lsp nil) ;; Uses prettier instead of lsp formatter
;; (setq markdown-command "multimarkdown")

;; ========== Elixir ==========
;; (setq-hook! 'elixir-mode-hook
;;   lsp-language-id-configuration
;;   (nconc 'lsp-language-id-configuration (list '(".*\\.html\\.heex$" . "web"))))


;; ========== Python ==========
;; (setq-hook! 'python-mode-hook +format-with-lsp nil) ;; Uses pylint instead of lsp formatter
;; (setq +format-on-save-enabled-modes (nconc +format-on-save-enabled-modes ( list 'python-mode )))
;;

;; (map!
;;  :mode 'python-mode
;;  :leader
;;  (:prefix "m"
;;   (:prefix ("p" . "pyvenv")
;;    :desc "Activate" "a" #'pyvenv-activate )))

;; (setq with-venv-find-venv-dir-functions '(with-venv-find-venv-dir-venv-custom
;;                                           with-venv-find-venv-dir-pipenv
;;                                           with-venv-find-venv-dir-poetry
;;                                           with-venv-find-venv-dir-dot-venv
;;                                           with-venv-find-venv-dir-venv))

;; ========== DAP Mode ==========
;; (use-package! dap-mode
;;   :config
;;   (defun dap-python--pyenv-executable-find (command)
;;     (message (concat "DAP-PYTHON-DEBUG: " (with-venv (executable-find "python"))))
;;     (with-venv (executable-find "python"))))

;;   (use-package-hook! solidity-fl  ; included with solidity-mode
;;     :pre-config
;;     (defun get-solc-version ()
;;       "Query solc executable and return its version.

;;   The result is returned in a list with 3 elements.MAJOR MINOR PATCH.

;;  If the solc output can't be parsed an error is returned."
;;       (let ((output (shell-command-to-string (format "%s --version" solidity-solc-path))))
;;         (if (string-match "\\(\\([[:digit:]]+\\)\.\\([[:digit:]]+\\)\.\\([[:digit:]]+\\)\\(.*\\)\\)" output)
;;         ;; (if (string-match "Version: \\([[:digit:]]+\\)\.\\([[:digit:]]+\\)\.\\([[:digit:]]+\\)" output)
;;             (list (match-string 2 output)
;;                   (match-string 3 output)
;;                   (match-string 4 output))
;;           (error "TEST Could not parse the output of %s --version:\n %s" solidity-solc-path output))))
;;     )




;; ========== nXML ==========
(add-hook 'nxml-mode-hook #'lsp)

;; ========== LSP ==========
(setq
 lsp-headerline-breadcrumb-enable t
 lsp-lens-enable t)
(after! lsp-mode
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.rustup\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.jenv\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.config\\'")
  )


(map! :map lsp-command-map
      "m i" #'lsp-ui-imenu
      "m r" #'lsp-ui-imenu--refresh)







;; ========== Javascript ==========
;; (add-hook 'js-mode-hook
;;           (lambda ()
;;             (define-key js-mode-map (kbd "C-x C-e") 'nodejs-repl-send-last-expression)
;;             (define-key js-mode-map (kbd "C-c C-j") 'nodejs-repl-send-line)
;;             (define-key js-mode-map (kbd "C-c C-r") 'nodejs-repl-send-region)
;;             (define-key js-mode-map (kbd "C-c C-c") 'nodejs-repl-send-buffer)
;;             (define-key js-mode-map (kbd "C-c C-l") 'nodejs-repl-load-file)))


;; (setq-hook! 'js-mode-hook +format-with-lsp nil) ;; Uses prettier instead of lsp formatter
;; (setq-hook! 'vue-mode-hook +format-with-lsp nil) ;; Uses prettier instead of lsp formatter
;; (setq-hook! 'js2-mode-hook +format-with-lsp nil) ;; Uses prettier instead of lsp formatter
;; (setq-hook! 'typescript-mode-hook +format-with-lsp nil) ;; Uses prettier instead of lsp formatter
;; (setq prettier-js-args '("--single-quote" "--parser vue")) ;; js-prettier config
;; (setq +format-on-save-enabled-modes (nconc +format-on-save-enabled-modes ( list 'rjsx-mode )))

;; Vue mode
;; (add-hook 'vue-mode-hook #'lsp!)
;; (define-derived-mode genehack-vue-mode web-mode "ghVue"
;; "A major mode derived from web-mode, for editing .vue files with LSP support.")
;; (add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))
;; (add-hook 'genehack-vue-mode-hook #'eglot-ensure)
;; (add-to-list 'eglot-server-programs '(genehack-vue-mode "vls"))

;; ========== Haskell ==========
;; (setq-hook! 'haskell-mode-hook
;;   +format-with-lsp nil)
;; (setq lsp-haskell-server-path "/Users/riley/.ghcup/bin/haskell-language-server-wrapper")
;; (setq haskell-process-path-ghci "stack ghci")


;; ========== edi-mode ==========
(use-package! edi-mode :load-path "repos/edi-mode")
(add-to-list 'auto-mode-alist '("\\.edi" . edi-mode))

;; ========== x12-mode ==========
;; (autoload x 'x12-mode "x12-mode" "" t)
(use-package! x12-mode)
;; Add more file extensions as required
(add-to-list 'auto-mode-alist '("\\.x12\\'" . x12-mode))



;; ========== authinfo ==========
(defun get-authinfo-entry (machine)
  "Retrieve a particular entry from the .authinfo file."
  (let* ((auth-sources '((:source "~/.authinfo" :host t)))
         (auth-source-result
          (car (auth-source-search :host machine))))
    (if auth-source-result
        (let ((secret (plist-get auth-source-result :secret)))
          (if secret
              (funcall secret)
            (error "No secret found for machine %s" machine)))
      (error "Entry not found for machine %s" machine))))


;; ========== gptel ==========
(use-package! gptel
  :config
  (setq! gptel-api-key (get-authinfo-entry "api.openai.com"))
  (setq! gptel-model "gpt-4o"))

;; Perplexity offers an OpenAI compatible API
(gptel-make-openai "Perplexity"         ;Any name you want
  :host "api.perplexity.ai"
  :key (get-authinfo-entry "api.openai.com")                   ;can be a function that returns the key
  :endpoint "/chat/completions"
  :stream t
  :models '(;; has many more, check perplexity.ai
            "pplx-7b-chat"
            "pplx-70b-chat"
            "pplx-7b-online"
            "pplx-70b-online"
            "llama-3-sonar-small-32k-chat"
            "llama-3-sonar-small-32k-online"
            "llama-3-sonar-large-32k-chat"
            "llama-3-sonar-large-32k-online"
            "llama-3-8b-instruct"
            "llama-3-70b-instruct"
            "mixtral-8x7b-instruct"))



(setq gptel-prompt-prefix-alist '((markdown-mode . "### ") (org-mode . "** ") (text-mode . "### ")))
(setq gptel-directives
      '((default . "You are a large language model living in Emacs and a helpful assistant. Respond concisely.")
        (programming . "You are a large language model and a careful programmer. Provide code and only code as output without any additional text, prompt or note.")
        (writing . "You are a large language model and a writing assistant. Respond concisely.")
        (chat . "You are a large language model and a conversation partner. Respond concisely.")
        (arch . "Act as an Arch Linux expert.")
        (emacs . "Act as an emacs expert. Respond half concisely. Where examples would support the answer, please add them.")
        (stock-trading . "Act as a stock trading expert. Where examples or images would support the answer, please add them.")
        (crypto-trading . "Act as a crypto trading expert. Where examples or images would support the answer, please add them.")
        (forex-trading . "Act as a forex trading expert. Where examples or images would support the answer, please add them.")
        (options-trading . "Act as a options trading expert. Where examples or images would support the answer, please add them.")
        (azure . "Act as an expert on Microsoft Azure and other Microsoft products. Where examples or images would support the answer, please add them.")
        (llm . "You are an expert on Large Language Models and AI. Use bullet points where possible. Provide examples where they'd be valuable. Respond half concisely - not too verbose, but not too concise.")
        (prompt-engineer . "You are an expert on LLM Prompt Engineering. Use bullet points where possible. Provide examples where they'd be valuable. Respond half concisely - not too verbose, but not too concise.")
        (blockchain . "You are an expert on Blockchains and blockchain security. Use bullet points where possible. Provide examples where they'd be valuable. Respond half concisely - not too verbose, but not too concise.")
        ))


(map! :leader
      :desc "gptel"
      :prefix ("l" . "gpt")
      :nv "s" #'gptel-send
      :nv "m" #'gptel-menu)

(setq gptel-default-mode 'org-mode)


;; ========== magit-gptel ==========
;; (add-hook 'magit-mode-hook #'magit-gptcommit-mode)
;; (map! :map magit-mode-map
;;       :n "C-c C-g" #'magit-gptcommit-commit-accept)
;; (after! (gptel-mode magit)
;;   (magit-gptcommit-status-buffer-setup))


;; ========== Org ==========
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq
 org-directory "~/org/"
 org-startup-with-inline-images t
 org-babel-inline-result-wrap "src")

;; org-fancy-priorities
(after! org-fancy-priorities
  (setq
   org-fancy-priorities-list '("🟥" "🟨" "🟩")
   org-priority-faces
   '((?A :foreground "red" :weight bold)
     (?B :foreground "green" :weight bold)
     (?C :foreground "grey" :weight bold))
   ))
(add-hook 'org-agenda-mode-hook 'org-fancy-priorities-mode)

(after! org
  (map! :map org-mode-map
        :n "M-j" #'org-metadown
        :n "M-k" #'org-metaup)

  (setq

   ;; Use ripgrep for searching

   ;; Allow word linking
   org-link-search-must-match-exact-headline nil

   org-todo-keywords '((sequence "BACKLOG(b)"
                        "TODO(t)"
                        "STRT(s!)"
                        "WAIT(w@)"
                        "HOLD(h@)"
                        "KILL(k@)"
                        "BLOCKED(B@)"
                        "DONE(d@)"
                        "PROJ(p)"))

   org-todo-keyword-faces '(
                            ("BACKLOG" . (:foreground "dark gray" :weight bold :underline f))
                            ("TODO" . (:foreground "light blue" :weight bold :underline f))
                            ("STRT" . +org-todo-active)
                            ("WAIT" . +org-todo-onhold)
                            ("BLOCKED" . +org-todo-onhold)
                            ("HOLD" . +org-todo-onhold)
                            ("PROJ" . +org-todo-project)
                            ("KILL" . +org-todo-cancel))  ;; org-todo-keyword-faces

   org-agenda-files '(directory-files-recursively "~/org/" "\\.org$")
   )
  )


;; ========== Treemacs ==========
(setq +treemacs-git-mode 'deferred
      treemacs-show-cursor t)
