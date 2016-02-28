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

;; require from emacs
(require 'cl)

;; require from site-lisp
(require 'restart-emacs)

;; require from settings
(require 'functions)
(require 'init)









;; Automatic package installation
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

(defvar initial-packages '(auctex 
     visual-regexp
     markdown-mode
     fill-column-indicator
     flycheck
     flycheck-pos-tip
     flycheck-clojure
     flx
     f
     magit)
  "A list of packages to be installed")

(defvar is_first_run 
  (loop for p in initial-packages
     when (not (package-installed-p p)) do (return nil)
     finally (return t)))

(if is_first_run
  (message "Start refreshing packages.")
  (package-refresh-contents)
  
  (dolist (p initial-packages)
    (when (not (package-installed-p p))
      (package-install p)))
  (bypass-confirmation #'restart-emacs))


