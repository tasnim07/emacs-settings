;;; package --- summary
;;; Commentary:
(require 'package)

;;; code:
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("elpy", "http://jorgenschaefer.github.io/packages/"))

(setq package-enable-at-startup nil)

(package-initialize)

;;; Package for auto-complete
(ac-config-default)
(global-auto-complete-mode t)

;;; package for flycheck
(package-install 'flycheck)
(global-flycheck-mode)

;;; package for python pyflakes
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
;;; (setq flymake-python-pyflakes-executable "flake8")

;;; package elpy for python
(elpy-enable)

(setq completion-ignore-case  t)

(setq shell-command-switch "-ic")

;;; enable column number mode by default
(setq column-number-mode t)

;;; set default font and font size
(set-frame-font "Monaco 16")

;;; enabled rebecca theme
;;; (load-theme #'rebecca t)
(load-theme 'yoshi :no-confirm)

;;; git package
;;; (require 'git)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("6c7db7fdf356cf6bde4236248b17b129624d397a8e662cf1264e41dab87a4a9a" "4e4d9f6e1f5b50805478c5630be80cce40bee4e640077e1a6a7c78490765b03f" default)))
 '(package-selected-packages (quote (flymake-python-pyflakes flycheck auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
