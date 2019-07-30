
(configuration-layer/declare-layers '(
                                      ;; -- personal ---
                                      ;; liszt-ide
                                      ))

(cond (linux? (configuration-layer/declare-layers '(
                                                    liszt-linux
                                                    )))
      (windows? (configuration-layer/declare-layers '(
                                                    liszt-windows
                                                    )))
      )
