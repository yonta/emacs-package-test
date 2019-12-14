;;; -*- lexical-binding: t; no-byte-compile: t -*-

;;; leaf bootstrap
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(if (not (file-exists-p "~/.emacs.d/elpa")) (package-refresh-contents))
(package-initialize)
(unless (package-installed-p 'leaf)
  (package-refresh-contents)
  (package-install 'leaf))
(leaf leaf-keywords :ensure t
  :config
  (leaf el-get :ensure t
    :custom ((el-get-git-shallow-clone . t)))
  (leaf-keywords-init))

;;; Install from Emacs Mirror
(leaf hl-line+
  :el-get (hl-line+
           :url "https://github.com/emacsmirror/hl-line-plus.git"))

;;; Install by leaf, dependending company
(leaf company-c-headers :ensure t
  :after company
  :config                               ; can write!
  (add-to-list 'company-backends 'company-c-headers))

;;; Install from Github branch by el-get integration.
;;; Leaf do not install depending packages.
(leaf company-mlton
  :el-get (company-mlton                ; you can
           :url "https://github.com/yonta/company-mlton.git"
           :branch "add-smlsharp")
  :init
  ;; Leaf do not resolve dependency by :el-get keyword.
  ;; You can nest leaf block.
  (leaf dash :ensure t)
  :config
  (company-mlton-basis-autodetect))
