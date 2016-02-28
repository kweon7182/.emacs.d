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


;; global variables
(defvar initial-packages
  '(auctex magit)
  "A list of packages to be installed")


;; from emacs
(require 'cl)

;; from site-lisp
(require 'restart-emacs)

;; from settings
(require 'functions)
(require 'init)
(require 'key-bindings)
(require 'init-packages)

