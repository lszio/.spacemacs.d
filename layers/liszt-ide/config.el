;; slime config
(setq inferior-lisp-program "ros")
(setq slime-lisp-implementations
      '((ros ("ros" "run"))
        (sbcl ("ros" "-L" "sbcl-bin" "run"))
        (ccl ("ros" "-L" "ccl-bin" "run"))))

;; git-gutter
(setq-default fringes-outside-margins t)
;; thin fringe bitmaps
(define-fringe-bitmap 'git-gutter-fr:added [224]
  nil nil '(center repeated))
(define-fringe-bitmap 'git-gutter-fr:modified [224]
  nil nil '(center repeated))
(define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240]
  nil nil 'bottom)
