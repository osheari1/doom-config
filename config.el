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

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)
; (require 'nano-theme)
; (setq doom-theme 'nano-theme)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(add-hook! 'org-mode-hook #'+org-pretty-mode)
(after! org
  (map! :map org-mode-map
        :n "M-j" #'org-metadown
        :n "M-k" #'org-metaup)

  (setq
   ;; Closed timestamp
   org-log-done 'time

   ;; Allow word linking
   org-link-search-must-match-exact-headline nil

   org-priority-faces '((65 . error)
                        (66 . warning)
                        (67 . success))
   ;; org-fancy-priorities
   org-fancy-priorities-list '("■" "■" "■")
   org-agenda-files (directory-files-recursively "~/org/" "\\.org$")
   ;; org-agenda-files '("~/org/caracal/" "~/org/marcopolo/" "~/org/")
   )
  )

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


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
(add-to-list 'default-frame-alist '(fullscreen . maximized))

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
  ;; :true          "𝕋"
  ;; :false         "𝔽"
  :int           "ℤ"
  :float         "ℝ"

  ;; :bool          "𝔹"
  ;; :list          "𝕃"
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
  :dot           "•")  ;; you could also add your own if you want

(plist-delete! +ligatures-extra-symbols :true)
(plist-delete! +ligatures-extra-symbols :false)
(plist-delete! +ligatures-extra-symbols :str)
(plist-delete! +ligatures-extra-symbols :bool)
(plist-delete! +ligatures-extra-symbols :list)

(setq
 ;; remap meta to command key
 mac-command-modifier 'meta
 ;; Doom disables auto-save
 auto-save-default t
 ;; Disable quit prompt
 confirm-kill-emacs nil
 ;; Backup files by default
 make-backup-files t
 ;; Set default projective path to Projects dir
 projectile-project-search-path `("~/Projects/")

 ;; Rainbow delimiters mode
 rainbow-delimiters-mode t

 ;; Emacs performance
 gc-cons-threshold 500000000
 read-process-output-max (* (* 1024 1024) 4)  ;; 1mb
 lsp-idle-delay 0.500
 )


;; ========== LSP ==========
(setq
 lsp-headerline-breadcrumb-enable t
 lsp-lens-enable t)

(map! :map lsp-command-map
      "m i" #'lsp-ui-imenu
      "m r" #'lsp-ui-imenu--refresh)





;; ========== Javascript ==========
(add-hook 'js-mode-hook
          (lambda ()
            (define-key js-mode-map (kbd "C-x C-e") 'nodejs-repl-send-last-expression)
            (define-key js-mode-map (kbd "C-c C-j") 'nodejs-repl-send-line)
            (define-key js-mode-map (kbd "C-c C-r") 'nodejs-repl-send-region)
            (define-key js-mode-map (kbd "C-c C-c") 'nodejs-repl-send-buffer)
            (define-key js-mode-map (kbd "C-c C-l") 'nodejs-repl-load-file)))


(setq-hook! 'js-mode-hook +format-with-lsp nil) ;; Uses prettier instead of lsp formatter
(setq-hook! 'vue-mode-hook +format-with-lsp nil) ;; Uses prettier instead of lsp formatter
(setq-hook! 'js2-mode-hook +format-with-lsp nil) ;; Uses prettier instead of lsp formatter
(setq-hook! 'typescript-mode-hook +format-with-lsp nil) ;; Uses prettier instead of lsp formatter
(setq prettier-js-args '("--single-quote" "--parser vue")) ;; js-prettier config

;; Vue mode
(add-hook 'vue-mode-hook #'lsp!)
;; (define-derived-mode genehack-vue-mode web-mode "ghVue"
  ;; "A major mode derived from web-mode, for editing .vue files with LSP support.")
;; (add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))
;; (add-hook 'genehack-vue-mode-hook #'eglot-ensure)
;; (add-to-list 'eglot-server-programs '(genehack-vue-mode "vls"))

;; ========== Haskell ==========
(setq-hook! 'haskell-mode-hook
  +format-with-lsp nil)
