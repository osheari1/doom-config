;;; profiles.el -*- lexical-binding: t; -*-

((min
  ;; The permitted formats of each entry:
  ;;
  ;; (var . value)
  ;; ("envvar" . value)
  ;; (var :directive values...)

  ;; `user-emacs-directory' is often the first variable you want to set, so
  ;; Emacs knows where this profile lives. If you don't, it'll use the config
  ;; living in the default locations (~/.config/emacs or ~/.emacs.d).
  (user-emacs-directory . "~/.config/emacs.profiles/min")
  ;; If this is a Doom config, you'll also want to set `doom-user-dir', which
  ;; defaults to ~/.config/doom or ~/.doom.d:
  (doom-user-dir . "~/.config/doom/profiles/min")
  ;; If a CAR is a string, it is assumed you want to set an environment
  ;; variable. (Side-note: setting DOOMDIR will be unnecessary if you're setting
  ;; `doom-user-dir' above).
  ;; ("DOOMDIR" . "~/another/doom/config/")
  ;; ("DOOMDIR" . "~/.config/doom/profiles/test/")

  ;; Doom profiles support a number of special directives. They are:
  ;;
  ;; (VAR :path SEGMENTS...) -- set VAR to an exapnded path built from SEGMENTS,
  ;; relative to `user-emacs-directory', unless an absolute path is in SEGMENTS.
  ;;
  ;; (doom-cache-dir :path doom-user-dir ".local/cache")
  ;; (doom-data-dir  :path doom-user-dir ".local/data")
  ;; (doom-state-dir :path doom-user-dir ".local/state")
  ;;
  ;; (VAR :plist VALUE) -- use VALUE as a literal plist; ignoring any profile
  ;; directives that may be in it.
  ;; (some-plist :plist (:foo bar :baz womp))
  ;;
  ;; (VAR :eval FORMS...) -- use to evaluate arbitrary elisp forms. Note that
  ;; his runs early in early-init.el. It's wise to assume no APIs are available
  ;; or loaded, only the previous bindings in this profile.
  ;; (doom-theme :eval (if (equal (system-name) "foo") 'doom-one 'doom-dracula))
  ;; Though discouraged, you may evaluate forms without a binding by using `_'.
  ;; You really should be doing this in the profile though...
  ;; (_ :eval (message "Hello world!"))
  ;; (_ :eval (with-eval-after-load 'company (setq-default company-idle-delay 2.0)))
  ;; (VAR :prepend FORMS...) or (VAR :append FORMS...) -- prepend or append the
  ;; evaluated result of each form in FORMS to VAR (a list). If VAR is undefined
  ;; at startup, it will be deferred until the variable is available.

  ))
