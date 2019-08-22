(message "|--------------------Load liszt-org config--------------------|")

(setq org-journal-dir (concat liszt-home "/Notes/Journal"))
(setq org-brain-path (concat liszt-home "/Notes/Brain"))

(setq deft-directory (concat liszt-home "/Notes")
      deft-extensions '("md" "org"))

(setq org-capture-templates
      `(("t" "Todo" entry (file+headline ,(concat liszt-home "/Notes/Gtd.org") "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree ,(concat liszt-home "/Notes/Journal.org"))
         "* %?\nEntered on %U\n  %i\n  %a")))

(setq spaceline-org-clock-p t)
(setq org-enable-github-support t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (plantuml . t)
   (dot . t)
   (latex . t)))
