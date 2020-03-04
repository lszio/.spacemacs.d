;;; packages.el --- liszt layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author:  <liszt@LISZT-MECHREVO>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `liszt-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `liszt/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `liszt/pre-init-PACKAGE' and/or
;;   `liszt/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst liszt-packages
  '(
    (cnfonts)
    (awesome-tab :location (recipe
                            :fetcher github
                            :repo "manateelazycat/awesome-tab"))
    ;;(aweshell :location (recipe
    ;;                     :fetcher github
    ;;                     :repo "manateelazycat/aweshell"
    ;;                     :toggle linux?))
    ;; (eaf :location (recipe
    ;;                 :fetcher github
    ;;                 :repo "manateelazycat/emacs-application-framework")
    ;;       :toggle linux?)
    posframe
    pyim
    leetcode
    )
  "The list of Lisp packages required by the liszt layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun liszt/init-cnfonts()
  (use-package cnfonts)
  (cnfonts-enable)
  (setq cnfonts-use-system-type t)
  )

(defun liszt/init-awesome-tab()
  (use-package awesome-tab
    :config
    (awesome-tab-mode t)
    )
  (setq awesome-tab-style "box")
  )


(defun liszt/init-eaf()
  (use-package eaf)
  )

(defun liszt/init-aweshell()
  (use-package aweshell)
)
(defun liszt/init-posframe()
  (use-package posframe)
  )

(defun liszt/init-leetcode()
  (use-package leetcode
    :config
    (setq leetcode-prefer-language "python3")
    (setq leetcode-prefer-sql "sqlite")
    ))

(defun liszt/init-pyim()
  ;; (use-package pyim)
  (use-package pyim
    :ensure nil
    :demand t
    :config
    (use-package pyim-basedict
      :ensure nil
      :config (pyim-basedict-enable))

    (setq default-input-method "pyim")

    ;; 我使用全拼
    (setq pyim-default-scheme 'quanpin)

    ;; 设置 pyim 探针设置，这是 pyim 高级功能设置，可以实现 *无痛* 中英文切换 :-)
    ;; 我自己使用的中英文动态切换规则是：
    ;; 1. 光标只有在注释里面时，才可以输入中文。
    ;; 2. 光标前是汉字字符时，才能输入中文。
    ;; 3. 使用 M-j 快捷键，强制将光标前的拼音字符串转换为中文。
    (setq-default pyim-english-input-switch-functions
                  '(pyim-probe-dynamic-english
                    pyim-probe-isearch-mode
                    pyim-probe-program-mode
                    pyim-probe-org-structure-template))

    (setq-default pyim-punctuation-half-width-functions
                  '(pyim-probe-punctuation-line-beginning
                    pyim-probe-punctuation-after-punctuation))

    ;; 开启拼音搜索功能
    (pyim-isearch-mode 1)

    ;; 使用 pupup-el 来绘制选词框, 如果用 emacs26, 建议设置
    ;; 为 'posframe, 速度很快并且菜单不会变形，不过需要用户
    ;; 手动安装 posframe 包。
    (setq pyim-page-tooltip 'posframe)

    ;; 选词框显示5个候选词
    (setq pyim-page-length 5)

    :bind
    (("C-;" . pyim-convert-string-at-point) ;与 pyim-probe-dynamic-english 配合
    ("C-'" . pyim-delete-word-from-personal-buffer))
    )
  )
(message "|----------------------Load liszt layer-----------------------|")
;;; packages.el ends here
