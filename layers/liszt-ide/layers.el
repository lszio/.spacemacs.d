
(configuration-layer/declare-layers '(
                                      ;; -- languages --
                                      yaml
                                      python
                                      html
                                      markdown
                                      typescript
                                      javascript
                                      (shell :variables
                                             shell-default-height 30
                                             shell-default-position 'bottom)
                                      ;; -- complate --
                                      auto-completion
                                      lsp
                                      ;; ---- tools ----
                                      git
                                      wakatime
                                      plantuml
                                      graphviz
                                      better-defaults
                                      multiple-cursors
                                      treemacs
                                      ;; spell-checking
                                      syntax-checking
                                      ))
