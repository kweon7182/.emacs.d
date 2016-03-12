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


;; from emacs
(require 'cl)

;; from site-lisp
(require 'restart-emacs)

;; global variables
(defvar initial-packages
  '(auctex magit organic-green-theme)
  "A list of packages to be installed")

;; from settings
(require 'setup-packages)
(require 'functions)
(require 'setup)
(require 'key-bindings)

;; load theme
(load-theme 'organic-green)

;; for windows
(if (eq system-type 'windows-nt)
    (setq TeX-view-program-list
	  '(("Sumatra PDF" ("\"C:/Program Files/SumatraPDF/SumatraPDF.exe\" -reuse-instance"
			    (mode-io-correlate " -forward-search %b %n -inverse-search \"C:/Program Files/emacs-24.5/bin/emacsclientw --no-wait +%%l \\\"%%f\\\"\" ") " %o")))))

(with-eval-after-load 'tex
  (when (eq system-type 'windows-nt)
    (assq-delete-all 'output-pdf TeX-view-program-selection)
    (add-to-list 'TeX-view-program-selection '(output-pdf "Sumatra PDF"))))
