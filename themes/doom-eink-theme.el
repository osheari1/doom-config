;;; e-ink-light-theme.el -*- no-byte-compile: t; -*-

(require 'doom-themes)

(defgroup e-ink-light-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(def-doom-theme e-ink-light
                "A light theme optimized for e-ink monitors."

                ;; name        default   256       16
                ((bg         '("#ffffff" nil       nil))
                 (bg-alt     '("#f0f0f0" nil       nil))
                 (base0      '("#eeeeee" nil       nil))
                 (base1      '("#cccccc" nil       nil))
                 (base2      '("#aaaaaa" nil       nil))
                 (base3      '("#888888" nil       nil))
                 (base4      '("#666666" nil       nil))
                 (base5      '("#444444" nil       nil))
                 (base6      '("#222222" nil       nil))
                 (base7      '("#101010" nil       nil))
                 (base8      '("#000000" nil       nil))
                 (fg         '("#000000" nil       nil))
                 (fg-alt     '("#101010" nil       nil))

                 (grey       base4)
                 (red        '("#ff0000" nil nil))
                 (orange     '("#ff8800" nil nil))
                 (green      '("#008800" nil nil))
                 (teal       '("#008888" nil nil))
                 (yellow     '("#888800" nil nil))
                 (blue       '("#000088" nil nil))
                 (dark-blue  '("#000044" nil nil))
                 (magenta    '("#880088" nil nil))
                 (violet     '("#440088" nil nil))
                 (cyan       '("#008888" nil nil))
                 (dark-cyan  '("#004444" nil nil))

                 ;; face categories
                 (highlight      yellow)
                 (vertical-bar   base3)
                 (selection      base3)
                 (builtin        blue)
                 (comments       base5)
                 (doc-comments   base6)
                 (constants      violet)
                 (functions      magenta)
                 (keywords       blue)
                 (methods        teal)
                 (operators      violet)
                 (type           cyan)
                 (strings        green)
                 (variables      fg-alt)
                 (numbers        orange)
                 (region         base2)
                 (error          red)
                 (warning        yellow)
                 (success        green)
                 (vc-modified    yellow)
                 (vc-added       green)
                 (vc-deleted     red)

                 ;; custom faces
                 ((line-number &override) :foreground base4 :background bg)
                 ((line-number-current-line &override) :foreground fg :background bg)

                 (magit-section-heading           :foreground blue :weight 'bold)
                 (magit-branch-current            :foreground green :weight 'bold :box t)
                 (magit-branch-local              :foreground green :weight 'bold)
                 (magit-branch-remote             :foreground magenta :weight 'bold)
                 (magit-diff-file-heading         :foreground fg :weight 'bold)
                 (magit-diff-file-heading-highlight :foreground fg :weight 'bold :background base2)
                 (magit-diff-file-heading-selection :foreground fg :weight 'bold :background base2)
                 (magit-diff-hunk-heading         :foreground fg :background base2)
                 (magit-diff-hunk-heading-highlight :foreground fg :background base2)
                 (magit-diff-hunk-heading-selection :foreground fg :background base2)
                 (magit-diff-context-highlight    :foreground fg :background base2)
                 (magit-diff-context              :foreground fg :background base2)

                 ;; Add more face overrides as needed
                 ))

;;; e-ink-light-theme.el ends here
