;; Automatic package installation
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

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

  ;; Restart emacs immediately
  (fset 'save-buffers-kill-emacs 'kill-emacs)
  (restart-emacs))

(provide 'init-packages)

