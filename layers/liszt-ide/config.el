;; slime config
(setq inferior-lisp-program "ros")
(setq slime-lisp-implementations
      '((ros ("ros" "run"))
        (sbcl ("ros" "-L" "sbcl-bin" "run"))
        (ccl ("ros" "-L" "ccl-bin" "run"))))
