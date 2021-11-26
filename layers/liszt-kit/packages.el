;;; packages.el --- liszt-kit layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2021 Sylvain Benner & Contributors
;;
;; Author: Liszt21 <1832666492@qq.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `liszt-kit-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `liszt-kit/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `liszt-kit/pre-init-PACKAGE' and/or
;;   `liszt-kit/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst liszt-kit-packages
  '(
    rime
    leetcode
    (popweb :location (recipe
                       :fetcher github
                       :repo "manateelazycat/popweb"
                       :files ("*"))))
  "The list of Lisp packages required by the liszt-kit layer.

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

(defun liszt-kit/init-rime ()
  (use-package rime
    :custom
    (default-input-method "rime")))

(defun liszt-kit/init-leetcode ()
  (use-package leetcode
    :custom
    (leetcode-prefer-language "python")
    (leetcode-prefer-sql "sqlite")
    (leetcode-save-solution t)
    (leetcode-directory "~/Notes/Program/LeetCode")))

(defun liszt-kit/init-popweb ()
  (use-package popweb)
  (with-eval-after-load 'popweb
    (message "Popweb loaded, loading extensions")

    (defun get-popweb-extension-paths (&rest extensions)
      (catch 'done
        (dolist (path load-path)
          (when (string-match "popweb" path)
            (throw 'done
                   (mapcar (lambda (p)
                             (concat path "/extension/" p))
                           extensions))))))

    ;; (defmacro load-popweb-extensions ()
    ;;   ;; FIXME 不能加載math-in-point.el
    ;;   (let ((extension-paths (get-popweb-extension-paths "dict" "latex")))
    ;;     `(progn
    ;;            (use-package popweb-dict-youdao :load-path ,(car extension-paths))
    ;;            (use-package popweb-latex :load-path ,(cadr extension-paths)))))

    (let ((extension-paths (get-popweb-extension-paths "dict" "latex")))
      (when (not (member (car extension-paths) load-path))
        (dolist (path extension-paths)
          (add-to-list 'load-path path))))

    (require 'popweb-dict-youdao)
    (require 'popweb-latex)))
