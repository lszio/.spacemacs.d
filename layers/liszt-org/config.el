(message "|--------------------Load liszt-org config--------------------|")

(setq org-journal-dir (concat liszt-home "/Notes/Journal"))
(setq org-brain-path (concat liszt-home "/Notes/Brain"))

(setq deft-directory (concat liszt-home "/Notes")
      deft-extensions '("md" "org"))

(setq org-directory (concat liszt-home "/Notes"))

(setq org-agenda-files (list (concat org-directory "/Inbox.org")
                             (concat org-directory "/Next.org")))
;;set status for TODO.
(setq org-todo-keywords
      '((sequence "INBOX" "NEXT" "LATER" "WAIT" "FUTURE" "|" "CANCEL" "DONE")))

(setq org-todo-keyword-faces
      '(
        ("INBOX" . (:foreground "blue" :weight bold))
        ("NEXT" . org-warning)
        ("LATER" . "yellow")
        ("WAIT" . "blue")
        ("FUTURE" . "purple")
        ("DONE" . "green")
        ("CANCEL" . "grey")
        ))

(setq org-todo-keywords
      '((sequence
         "INBOX"
         "NEXT(n)"
         "LATER(l)"
         "WAIT(w)"
         "FUTURE(f)"
         "|" "CANCEL(C)" "DONE(d)")))

(setq org-log-done 'time)

;;set priority
(setq org-highest-priority ?A)
(setq org-lowest-priority ?D)
(setq org-default-priority ?A)
(setq org-priority-faces '(
                           (?A . org-warning)
                           (?B . (:background "DodgerBlue" :foreground "black" :weight bold)) 
                           (?C . (:foreground "SkyBlue" :weight bold))
                           (?D . (:foreground "DodgerBlue" :weight bold)) 
                           )
)

(setq org-capture-templates
      `(("t" "Todo" entry (file+headline ,(concat liszt-home "/Notes/Gtd.org") "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree ,(concat liszt-home "/Notes/Journal.org"))
         "* %?\nEntered on %U\n  %i\n  %a")))

;;Setting for gtd captures
;;Directory for capture files.
;;Default capture files.
(setq org-default-notes-file (concat org-directory "Inbox.org"))
;;Capture template
(setq org-capture-templates
      `(("t" "Tasks" entry (file+headline ,(concat liszt-home "/Notes/Inbox.org") "Tasks") "* INBOX %?\nTime:%T\nFrom:%F\n")
        ("p" "Projects" entry (file+headline ,(concat liszt-home "/Notes/Inbox.org") "Projects")  "* %?\nTime:%U\nFrom:%F\n")
        ("i" "Item notes" item (file+headline ,(concat liszt-home "/Notes/Inbox.org") "Items")  "+ %?\n  Time:%U\n  From:%F\n")
        ))
 
;;set tags
;;where?(h/o/w),what?(c/l/s),when?(gtd|immeiately,wait,action),who?(my gtd,others),why?how?(delete/archieve/schedule)
(setq org-tag-alist '(
                    (:startgroup . nil)
                         ("home" . ?r) ("office" . ?o) ("way" . ?w)
                    (:endgroup . nil)
                    ("职业" . ?c)
                    ("生活" . ?l) 
                    ("学习" . ?s)
                    ))


(setq spaceline-org-clock-p t)
(setq org-enable-github-support t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (plantuml . t)
   (dot . t)
   (latex . t)))
