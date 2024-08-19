;;; configs/startup.el -*- lexical-binding: t; -*-


;; Boot in fullscreen mode
(defun my/toggle-frame-fullscreen ()
  "Toggle frame fullscreen only if not already in fullscreen."
  (interactive)
  (unless (frame-parameter nil 'fullscreen)
    (toggle-frame-fullscreen)))



;; Boot in fullscreen mode
(my/toggle-frame-fullscreen)

;; Add directories to project path
(projectile-discover-projects-in-search-path)
