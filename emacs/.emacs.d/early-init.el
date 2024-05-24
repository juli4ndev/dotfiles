;;; early-init.el --- Personal early init. -*- lexical-binding: t -*-
;;; 

(use-package emacs
  :init
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (setq
   use-dialog-box nil
   use-file-dialog nil
   use-short-answers t
   inhibit-x-resources t
   inhibit-splash-screen t
   frame-resize-pixelwise t
   inhibit-startup-screen t
   inhibit-startup-buffer-menu t
   frame-inhibit-implied-resize t
   frame-inhibit-implied-resize t
   gc-cons-percentage 0.5
   gc-cons-threshold most-positive-fixnum
   inhibit-startup-echo-area-message user-login-name))

(use-package modus-themes
  :init
  (load-theme 'modus-operandi t))
