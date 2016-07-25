;; custom file

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file)

;; load site-lisp
(setq site-lisp-dir (locate-user-emacs-file "site-lisp"))
(let ((default-directory site-lisp-dir))
  (normal-top-level-add-subdirs-to-load-path))

;; load settings
(setq settings-dir (locate-user-emacs-file "settings"))
(add-to-list 'load-path settings-dir)

(setenv "PATH" "/usr/local/bin:/Library/TeX/texbin/:$PATH" t)

;; from emacs
(require 'cl)

;; from site-lisp
(require 'restart-emacs)

;; global variables
(defvar initial-packages
  '(auctex magit organic-green-theme exec-path-from-shell)
  "A list of packages to be installed")

;; from settings
(require 'setup-packages)
(require 'functions)
(require 'setup)
(require 'key-bindings)
(require 'windows)
(require 'darwin)

;; load theme
;(load-theme 'organic-green)

(set-language-environment "Korean")
(prefer-coding-system 'utf-8)
(global-set-key (kbd "<S-kana>") 'toggle-input-method)
(global-set-key (kbd "<kana>") 'toggle-input-method)
(setq default-korean-keyboard "korean-hangul3f")

