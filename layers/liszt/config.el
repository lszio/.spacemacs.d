(message "|----------------------Load liszt config----------------------|")

(defvar liszt-home ""
  "liszt' home folder")

(if (getenv "LISZT_HOME")
    (setq liszt-home (getenv "LISZT_HOME"))
  (setq liszt-home "~"))


(global-set-key (kbd "s-1") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-2") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-3") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-4") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-5") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-6") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-7") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-8") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-9") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-0") 'awesome-tab-select-visible-tab)


;; (setq url-proxy-services
;;       '(("http" . "127.0.0.1:1087")
;;         ("https" . "127.0.0.1:1087")))
