;; Package-manager
(require 'package)
(custom-set-variables
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") 
;			    ("melpa" . "http://melpa.milkbox.net/packages/") 
			    ("melpa-stable" . "http://stable.melpa.org/packages/")))))

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


;; (packages-install 'auto-complete)
;; (require 'auto-complete)
;; (ac-config-default)
;; (defun my:ac-c-header-init ()
;;   (load "auto-complete-c-headers")
;;   (add-to-list 'ac-sources 'ac-source-c-headers)
;;   (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr/include"))
;; (add-hook 'c-mode-hook 'my:ac-c-header-init)
;; (global-set-key  [f1] (lambda () (interactive) (manual-entry (current-word))))

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

;; Multiple cursors
(packages-install 'multiple-cursors)
(require 'multiple-cursors)
(global-set-key (kbd "M-.") 'mc/mark-next-like-this)

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


;;(packages-install 'cider)
;;(packages-install 'ac-cider)
;;(require 'ac-cider)
;;(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
;;(add-hook 'cider-mode-hook 'ac-cider-setup)
;;(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
;; (eval-after-load "auto-complete"
;;   '(progn
;;      (add-to-list 'ac-modes 'cider-mode)
;;      (add-to-list 'ac-modes 'cider-repl-mode)))
;; ;; tab to complete
;; (defun set-auto-complete-as-completion-at-point-function ()
;;   (setq completion-at-point-functions '(auto-complete)))
;; (add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
;; (add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)

;; extempore
(autoload 'extempore-mode "/usr/local/opt/extempore/extras/extempore.el" "" t)
(add-to-list 'auto-mode-alist '("\\.xtm$" . extempore-mode))
(setq user-extempore-directory "/usr/local/opt/extempore/")

(add-hook 'haskell-mode-hook 'haskell-indentation-mode)

(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
