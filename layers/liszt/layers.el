
(configuration-layer/declare-layers '(
                                      ;; -- personal ---
                                      liszt-org
                                      ))
;; Load different layer in different system
(cond (linux? (configuration-layer/declare-layers '(
                                                    liszt-linux
                                                    )))
      (windows? (configuration-layer/declare-layers '(
                                                    liszt-windows
                                                    )))
      )
