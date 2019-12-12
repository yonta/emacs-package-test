;;; -*- lexical-binding: t; no-byte-compile: t -*-

;;; package.el
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(if (not (file-exists-p "~/.emacs.d/elpa")) (package-refresh-contents))
(package-initialize)

;;; quelpa bootstrap
(unless (require 'quelpa nil t)
  (with-temp-buffer
    (url-insert-file-contents "https://framagit.org/steckerhalter/quelpa/raw/master/bootstrap.el")
    (eval-buffer)))
(quelpa
 '(quelpa-use-package
   :fetcher git
   :url "https://framagit.org/steckerhalter/quelpa-use-package.git"))
(require 'quelpa-use-package)

;; or, after installing use-package.el, install quelpa by use-package.el
;; (use-package quelpa :eunsre t)
;; (use-package quelpa :ensure t)

;;; Do and say nothing while tring to install from Emacs Mirror
(quelpa 'hl-line+)                   ; no error, but do nothing!!
(quelpa 'hl-line-plus)
;;  :config                          ; can not write configurations
;;  (toggle-hl-line-when-idle 1)
;;  (hl-line-when-idle-interval 4)
;;  (set-face-background hl-line-face "light cyan"))

;;; Install by quelpa, dependending company
(quelpa 'company-irony)

;;; Install by use-package, dependending company
(use-package company-c-headers :ensure t ; install company duplicately
   :config                               ; can write!
   (add-to-list 'company-backends 'company-c-headers))

;;; Install by use-package integration from Github branch, dependending company
(use-package company-mlton
  :quelpa (company-mlton :fetcher github    ; you can!
                         :repo "yonta/company-mlton"
                         :branch "add-smlsharp")
  :config
  (company-mlton-basis-autodetect))
