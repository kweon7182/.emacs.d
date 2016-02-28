;; custom file
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file)

;; load site-lisp
(setq site-lisp-dir (locate-user-emacs-file "site-lisp"))
(let ((default-directory site-lisp-dir))
  (normal-top-level-add-subdirs-to-load-path))

;; load settings
(setq settings-dir (locate-user-emacs-file "settings"))
(add-to-list 'load-path settings-dir)

;; theme files
(setq theme-dir (locate-user-emacs-file "theme"))
(add-to-list 'custom-theme-load-path theme-dir)
(load-theme 'light)


;; from emacs
(require 'cl)

;; from site-lisp
(require 'restart-emacs)

;; global variables
(defvar initial-packages
  '(auctex magit)
  "A list of packages to be installed")

;; from settings
(require 'setup-packages)
(require 'functions)
(require 'setup)
(require 'key-bindings)

