;; Automatic package installation

(require 'package)

;; Add pack archives
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)

;; Check whether update is required
(defvar update-required    
  (loop for p in initial-packages
     when (not (package-installed-p p)) do (return nil)
     finally (return t))
  "True if and only if the update is required.")

;; Do update
(if update-required
  (message "Start refreshing packages.")
  (package-refresh-contents)
  ;; Install packages
  (dolist (p initial-packages)
    (when (not (package-installed-p p))
      (package-install p)))
  ;; Restart emacs immediately
  (fset 'save-buffers-kill-emacs 'kill-emacs)
  (restart-emacs))

(provide 'setup-packages)

