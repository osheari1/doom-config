;;; confs/org-transclusion.el -*- lexical-binding: t; -*-
(use-package! org-transclusion
  :config
  (map!
   :map org-mode-map
   :localleader
   :prefix ("x" . "transclusion")
   :desc "Toggle transclusion" "t" #'org-transclusion-mode
   :desc "Add" "a" #'org-transclusion-add
   :desc "Add all" "A" #'org-transclusion-add-all
   :desc "Make from link" "l" #'org-transclusion-make-from-link
   :desc "Remove" "r" #'org-transclusion-remove
   :desc "Remove all" "R" #'org-transclusion-remove-all
   :desc "Refresh" "g" #'org-transclusion-refresh
   :desc "Detach" "d" #'org-transclusion-detach
   :desc "Open source" "o" #'org-transclusion-open-source
   :desc "Move to source" "m" #'org-transclusion-move-to-source
   (:prefix ("s" . "live sync")
    :desc "Start" "s" #'org-transclusion-live-sync-start
    :desc "Exit" "e" #'org-transclusion-live-sync-exit)))





(custom-set-faces! '(org-transclusion-fringe
                     :forground "MediumPurple1"
                     :background "MediumPurple1"))
(custom-set-faces! '(org-transclusion-source-fringe
                     :forground "#ebf6fa"
                     :background "#ebf6fa"))



(defun org-transclusion-content-insert (keyword-values type content sbuf sbeg send copy)
  "Insert CONTENT at point and put source overlay in SBUF.
Return t when successful.

This function formats CONTENT with using one of the
`org-transclusion-content-format-functions'; e.g. align a table
for Org.

This function is intended to be used within
`org-transclusion-add'.  All the arguments should be
obtained by one of the `org-transclusion-add-functions'.

This function adds text properties required for Org-transclusion
to the inserted content.  It also puts an overlay to an
appropriate region of the source buffer.  They are constructed
based on the following arguments:

- KEYWORD-VALUES :: Property list of the value of transclusion keyword
- TYPE :: Transclusion type; e.g. \"org-link\"
- CONTENT :: Text content of the transclusion source to be inserted
- SBUF :: Buffer of the transclusion source where CONTENT comes from
- SBEG :: Begin point of CONTENT in SBUF
- SEND :: End point of CONTENT in SBUF"
  (let* ((beg (point)) ;; before the text is inserted
         (beg-mkr (set-marker (make-marker) beg))
         (end) ;; at the end of text content after inserting it
         (end-mkr)
         (ov-src (text-clone-make-overlay sbeg send sbuf)) ;; source-buffer overlay
         (tc-pair ov-src)
         (content content))
    (when (org-transclusion-type-is-org type)
      (with-temp-buffer
        ;; This temp buffer needs to be in Org Mode
        ;; Otherwise, subtree won't be recognized as a Org subtree
        (delay-mode-hooks (org-mode))
        (insert content)
        (org-with-point-at 1
          (let* ((to-level (plist-get keyword-values :level))
                 (level (org-transclusion-content-highest-org-headline))
                 (diff (when (and level to-level) (- level to-level))))
            (when diff
              (cond ((< diff 0) ; demote
                     (org-map-entries (lambda ()
                                        (dotimes (_ (abs diff))
                                          (org-do-demote)))))
                    ((> diff 0) ; promote
                     (org-map-entries (lambda ()
                                        (dotimes (_ diff)
                                          (org-do-promote))))))))
          (setq content (buffer-string)))))
    (insert
     (run-hook-with-args-until-success
      'org-transclusion-content-format-functions
      type content (plist-get keyword-values :current-indentation)))
    (setq end (point))
    (setq end-mkr (set-marker (make-marker) end))
    (unless copy
      (add-text-properties beg end
                           `(local-map ,org-transclusion-map
                             read-only t
                             front-sticky t
                             ;; rear-nonticky seems better for
                             ;; src-lines to add "#+result" after C-c
                             ;; C-c
                             rear-nonsticky t
                             org-transclusion-type ,type
                             org-transclusion-beg-mkr
                             ,beg-mkr
                             org-transclusion-end-mkr
                             ,end-mkr
                             org-transclusion-pair
                             ,tc-pair
                             org-transclusion-orig-keyword
                             ,keyword-values
                             ;; TODO Fringe is not supported for terminal
                             line-prefix
                             ,(org-transclusion-propertize-transclusion)
                             wrap-prefix
                             ,(org-transclusion-propertize-transclusion)))
      ;; Put the transclusion overlay
      (let ((ov-tc (text-clone-make-overlay beg end)))
        (overlay-put ov-tc 'evaporate t)
        (overlay-put ov-tc 'face 'org-transclusion)
        (overlay-put ov-tc 'line-prefix (org-transclusion-propertize-transclusion))
        (overlay-put ov-tc 'wrap-prefix (org-transclusion-propertize-transclusion))
        (overlay-put ov-tc 'priority -60))
      ;; Put to the source overlay
      (overlay-put ov-src 'org-transclusion-by beg-mkr)
      (overlay-put ov-src 'evaporate t)
      (overlay-put ov-src 'face 'org-transclusion-source)
      (overlay-put ov-src 'line-prefix (org-transclusion-propertize-source))
      (overlay-put ov-src 'wrap-prefix (org-transclusion-propertize-source))
      (overlay-put ov-src 'priority -60)
      ;; TODO this should not be necessary, but it is at the moment
      ;; live-sync-enclosing-element fails without tc-pair on source overlay
      (overlay-put ov-src 'org-transclusion-pair tc-pair))
    t))
