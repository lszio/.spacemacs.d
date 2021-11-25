(setq user-full-name "Liszt21"
      user-mail-address "1832666492@qq.com")

(if windows?
    (setq liszt-home "C:/Liszt")
  (setq liszt-home "~"))

(with-eval-after-load 'org
  (message "org loaded"))

(setq org-directory (concat liszt-home "/Notes")
      org-archive-location (concat org-directory "/Archive/%s::")
      deft-directory org-directory
      org-roam-directory org-directory
      ;; org-roam-tag-sources '(prop last-directory)
      org-superstar-headline-bullets-list '("☰" "☱" "☲" "☳" "☴" "☵" "☶" "☷"))

(setq org-todo-keywords
        '((sequence "NEXT(n)"
                    "TODO(t)"
                    "PEND(p)"
                    "WILL(w@/!)"
                    "|"
                    "DONE(d)"
                    "QUIT(q@)")
          (sequence "[-](N)"
                    "[ ](T)"
                    "[:](P)"
                    "[?](W)"
                    "|"
                    "[X](D)"
                    "[Q](Q)")))

(setq org-log-done 'time)
(setq org-todo-keyword-faces
      '(("TODO" :foreground "orange"       :weight bold)
        ("[ ]"  :foreground "orange"       :weight bold)
        ("NEXT" :foreground "yellow"       :weight bold)
        ("[-]"  :foreground "yellow"       :weight bold)
        ("PEND" :foreground "pink"         :weight bold)
        ("[:]"  :foreground "pink"         :weight bold)
        ("WILL" :foreground "purple"       :weight bold)
        ("[?]"  :foreground "purple"       :weight bold)
        ("DONE" :foreground "forest green" :weight bold)
        ("[X]"  :foreground "forest green" :weight bold)
        ("QUIT" :foreground "grey"         :weight bold)
        ("[Q]"  :foreground "grey"         :weight bold)))

(setq org-capture-templates
      `(("t" "Todo"
         entry (file ,(concat org-directory "/Inbox.org"))
         "* TODO %?\n  %i\n  %a")
        ("r" "Read"
         entry (file ,(concat org-directory "/Inbox.org"))
         "* TODO %? :Read:\n  %i\n  %a")))
