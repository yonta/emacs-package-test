;;; -*- lexical-binding: t; no-byte-compile: t -*-

;;; straight bootstrap
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;; package.el
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(if (not (file-exists-p "~/.emacs.d/elpa")) (package-refresh-contents))
(package-initialize)

;;; Install by straight from Emacs Mirror
;;(straight-use-package 'hl-line+)   ; not package name
(straight-use-package 'hl-line-plus) ; repository name
;;  :config                          ; can not write configurations
;;  (toggle-hl-line-when-idle 1)
;;  (hl-line-when-idle-interval 4)
;;  (set-face-background hl-line-face "light cyan"))

;;; Install by straight, dependending company
(straight-use-package 'company-irony)

;;; Install by use-package integration, dependending company
(straight-use-package 'use-package)
(use-package company-c-headers :ensure t ; install company duplicately
   :config                               ; can write!
   (add-to-list 'company-backends 'company-c-headers))

;;; Install from GitHub with fork and branch
(use-package company-mlton
  :straight (company-mlton :type git    ; you can!
                           :host github
                           :repo "MatthewFluet/company-mlton"
                           :fork (:repo "yonta/company-mlton"
                                        :branch "add-smlsharp")))
