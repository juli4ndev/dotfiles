;;; Personal configuration -*- lexical-binding: t -*-

(require 'package)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(use-package emacs
  :init
  (recentf-mode 1)
  (column-number-mode 1)
  (electric-pair-mode 1)
  (global-display-line-numbers-mode 1)
  (setq user-full-name "Julian Acosta"
        user-email-address "me@juli4n.dev"
        mouse-wheel-progressive-speed nil
        scroll-conservatively 101
        make-backup-files nil
        auto-save-default nil
        create-lockfiles nil)
  (setq-default tab-width 2
                indent-tabs-mode nil
                indent-line-function 'insert-tab))

;; (use-package ron-mode
;;   :mode
;;   ("\\.ron?\\'" . ron-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(docker-compose-mode magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
