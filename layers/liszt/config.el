(message "|----------------------Load liszt config----------------------|")

(defvar liszt-home ""
  "liszt' home folder")

(if (getenv "LISZT_HOME")
    (setq liszt-home (getenv "LISZT_HOME"))
  (setq liszt-home "~"))
