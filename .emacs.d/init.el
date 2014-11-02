;; Package-manager
(require 'package)
(add-to-list 'package-archives 
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa")
  (package-refresh-contents))
(add-to-list 'load-path user-emacs-directory)

(defun packages-install (package)
  (when (not (package-installed-p package))
    (package-install package))
  (delete-other-windows))

;; disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)


;; Feature-toggling
(menu-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(pending-delete-mode 1)
(setq inhibit-splash-screen t)
(show-paren-mode 1)
(setq show-paren-style 'parenthesis)
(setq show-paren-delay 0)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)


;; Paredit
(packages-install 'paredit)
(require 'paredit)
(autoload 'enable-paredit-mode "paredit" "" t)
(add-hook 'emacs-lisp-mode-hook       'enable-paredit-mode)
(add-hook 'lisp-mode-hook             'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'scheme-mode-hook           'enable-paredit-mode)
(add-hook 'clojure-mode-hook          'enable-paredit-mode)

;; Tagedit
(packages-install 'tagedit)
(eval-after-load "sgml-mode"
  '(progn
     (require 'tagedit)
     (tagedit-add-paredit-like-keybindings)
     (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))))

;; expand-region
(packages-install 'expand-region)
(require 'expand-region)
(global-set-key (kbd "M-,") 'er/expand-region)

;; keybinds
(global-set-key (kbd "C-u") 'undo)


