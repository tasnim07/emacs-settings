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
;;; install package M-x -> package-install -> auto-complete
(ac-config-default)
(global-auto-complete-mode t)

;;; package for flycheck
(package-install 'flycheck)
(global-flycheck-mode)

;;; package for python pyflakes
;;; install package M-x -> package-install -> flymake-python-pyflakes
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
;;; (setq flymake-python-pyflakes-executable "flake8")

;;; package elpy for python
;;; install package. M-x -> package-install -> elpy
(elpy-enable)

;;; configure elpy to use python3
(setq elpy-rpc-python-command "/usr/bin/python3")

(setq completion-ignore-case  t)

(setq shell-command-switch "-ic")

;;; enable column number mode by default
(setq column-number-mode t)

;;; set default font and font size
;;; (set-frame-font "Monaco 16")
;;;(set-frame-font "ProggyClean")
(set-face-attribute 'default nil :height 160)

;;; enabled rebecca theme
;;; install package. M-x -> package-install -> <theme name>
;;; (load-theme #'rebecca t)
;;; (load-theme 'yoshi :no-confirm)
;;; (load-theme 'atom-one-dark t)
;;; (load-theme 'dracula t)
;;; (load-theme 'avk-daylight t)
;;; More awesome themes
;;; (load-theme 'brin t)
;;; (load-theme 'granger t)
;;; (load-theme 'spolsky t)
;;; (load-theme 'graham t)
;;; (load-theme 'odersky t)
;;; (load-theme 'hickey t)
;;; (load-theme 'fogus t)
;;; (load-theme 'dorsey t)
;;; (load-theme 'mcarthy t)
;;; (load-theme 'wilson t)
;;; (load-theme 'junio t)
(load-theme 'spolsky t)

;;; disable scroll bar
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

;;; disable ctrl z
(global-unset-key (kbd "C-z"))

;;; react
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;;; git package
;;; (require 'git)

;;; Golang settings
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

(setenv "GOPATH" "/Users/lxidd/Desktop/work/GO")

(add-to-list 'exec-path "/Users/tleyden/Development/gocode/bin")
;;; (add-hook 'before-save-hook 'gofmt-before-save)

;;; React syntax highlighter
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))

(defun my-go-mode-hook ()
  ;;; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  )
(add-hook 'go-mode-hook 'my-go-mode-hook)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "5cd0afd0ca01648e1fff95a7a7f8abec925bd654915153fb39ee8e72a8b56a1f" "938d8c186c4cb9ec4a8d8bc159285e0d0f07bad46edf20aa469a89d0d2a586ea" "d606ac41cdd7054841941455c0151c54f8bff7e4e050255dbd4ae4d60ab640c1" "eb34ed27768eeea1e423f8987b060e49829aac558fe0669b3de0227da67b661c" "a4c9e536d86666d4494ef7f43c84807162d9bd29b0dfd39bdf2c3d845dcc7b2e" "6c7db7fdf356cf6bde4236248b17b129624d397a8e662cf1264e41dab87a4a9a" "4e4d9f6e1f5b50805478c5630be80cce40bee4e640077e1a6a7c78490765b03f" default)))
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(package-selected-packages (quote (flymake-python-pyflakes flycheck auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
