;;; Personal configuration -*- lexical-binding: t -*-

(require 'notifications)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t
        use-package-hook-name-suffix nil))

(use-package emacs
  :init
  (ido-mode 1)
  (recentf-mode 1)
  (column-number-mode 1)
  (electric-pair-mode 1)
  (electric-indent-mode 1)
  (global-auto-revert-mode 1)
  (auto-compression-mode 1)
  (set-language-environment "UTF-8")
  (set-face-attribute 'default nil :font "Noto Mono 11")
  (setq user-full-name "Julian Acosta"
        user-email-address "me@juli4n.dev"
        auto-revert-use-notify nil
        calendar-week-start-day 1
        mouse-wheel-progressive-speed nil
        scroll-conservatively 101
        make-backup-files nil
        auto-save-default nil
        create-lockfiles nil
        custom-file "~/.emacs.d/custom.el")
  (setq-default tab-width 2
                indent-tabs-mode nil
                indent-line-function 'insert-tab)
  :config
  (defun startup-notify()
    (notifications-notify
     :title "Emacs Daemon Launched"
     :body "Emacs has started in the background."
     :urgency "normal"))
  :hook
  (after-init-hook . startup-notify))

(use-package eglot)

(use-package python-mode
  :config
  (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode)))

(use-package css-mode
  :config
  (add-to-list 'major-mode-remap-alist '(css-mode . css-ts-mode))
  (add-to-list 'treesit-language-source-alist '(css "https://github.com/tree-sitter/tree-sitter-css")))

(use-package sh-script
  :config
  (add-to-list 'major-mode-remap-alist '(bash-mode . bash-ts-mode))
  (add-to-list 'major-mode-remap-alist '(sh-mode . bash-ts-mode))
  (add-to-list 'treesit-language-source-alist '(bash "https://github.com/tree-sitter/tree-sitter-bash")))

(use-package js
  :config
  (add-to-list 'major-mode-remap-alist '(javascript-mode . js-ts-mode))
  (add-to-list 'treesit-language-source-alist '(javascript "https://github.com/tree-sitter/tree-sitter-javascript")))

(use-package json-ts-mode
  :config
  (add-to-list 'major-mode-remap-alist '(js-json-mode . json-ts-mode))
  (add-to-list 'treesit-language-source-alist '(json "https://github.com/tree-sitter/tree-sitter-json")))

(use-package typescript-ts-mode
  :config
  (add-to-list 'treesit-language-source-alist '(typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src"))
  (add-to-list 'treesit-language-source-alist '(tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")))

(use-package rust-ts-mode
  :mode
  ("\\.rs\\'" . rust-ts-mode)
  :config
  (add-to-list 'treesit-language-source-alist '(rust "https://github.com/tree-sitter/tree-sitter-rust"))
  :hook
  (rust-ts-mode-hook . eglot-ensure))

(use-package toml-ts-mode
  :mode
  ("\\.toml\\'" . toml-ts-mode)
  :config
  (add-to-list 'treesit-language-source-alist '(toml "https://github.com/ikatyang/tree-sitter-toml")))

(use-package yaml-ts-mode
  :mode
  ("\\.yaml\\'" . yaml-ts-mode)
  ("\\.yml\\'" . yaml-ts-mode)
  :config
  (add-to-list 'treesit-language-source-alist '(yaml "https://github.com/ikatyang/tree-sitter-yaml")))

(use-package markdown-ts-mode
  :mode ("\\.md\\'" . markdown-ts-mode)
  :config
  (add-to-list 'treesit-language-source-alist '(markdown "https://github.com/tree-sitter-grammars/tree-sitter-markdown" "split_parser" "tree-sitter-markdown/src"))
  (add-to-list 'treesit-language-source-alist '(markdown-inline "https://github.com/tree-sitter-grammars/tree-sitter-markdown" "split_parser" "tree-sitter-markdown-inline/src")))

(use-package phps-mode
  :mode ("\\.php\\'" . phps-mode)
  :config
  (phps-mode-flycheck-setup)
  (setq phps-mode-async-process t)
  (setq phps-mode-async-process-using-async-el nil))

(use-package dockerfile-ts-mode
  :mode ("\\.Dockerfile\\'" . dockerfile-ts-mode)
  :config
  (add-to-list 'treesit-language-source-alist '(dockerfile "https://github.com/camdencheek/tree-sitter-dockerfile")))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package corfu
  :config
  (setq corfu-cycle t
        corfu-auto t)
  :init
  (global-corfu-mode))

(use-package vterm)

(use-package diff-hl
  :init
  (global-diff-hl-mode)
  (diff-hl-flydiff-mode)
  (diff-hl-dir-mode)
  :config
  (setq diff-hl-disable-on-remote t)
  :hook
  (magit-pre-refresh-hook . diff-hl-magit-pre-refresh)
  (magit-post-refresh-hook . diff-hl-magit-post-refresh))
