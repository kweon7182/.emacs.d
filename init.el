;; custom file
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file)

(require 'cl)

(global-linum-mode 1)

(global-set-key [f7] 'previous-error)
(global-set-key [f8] 'next-error)   
(global-set-key [f9] 'compile)
(setq compilation-read-command nil)

;; for c-mode
(setq c-default-style "linux" c-basic-offset 4)

;; for sage
(add-to-list 'load-path 
	     "/opt/sage/7.0/local/share/emacs/site-lisp/sage-mode")
(require 'sage "sage")
(setq sage-command "sage")
;(sage-update-autoloads)
;(kill-buffer "sage-load.el")
;; If you want sage-view to typeset all your output and have plot()
;; commands inline, uncomment the following line and configure sage-view:
;; (require 'sage-view "sage-view")
;; (add-hook 'sage-startup-after-prompt-hook 'sage-view)
;; You can use commands like
;; (add-hook 'sage-startup-after-prompt-hook 'sage-view-disable-inline-output)
;; (add-hook 'sage-startup-after-prompt-hook 'sage-view-disable-inline-plots)
;; to enable some combination of features.  Using sage-view requires a
;; working LaTeX installation with the preview package.

(defvar log-file-path (locate-user-emacs-file "log.txt")
  "The path of the log file.")

(defun read-log-line (line-num)
  "Return the string of (LINE-NUM)-th line of the log file."
  (with-current-buffer (find-file-noselect log-file-path)
    (goto-line line-num)
    (let ((start (point)))
      (end-of-line)
      (let ((result (buffer-substring start (point))))
	(kill-buffer (current-buffer))
	result))))

(defun write-log (str)
  "Write str into the log file."
  (with-temp-file log-file-path "")
  (append-to-file str nil log-file-path))




(defun launch-separate-emacs-in-terminal ()
  (suspend-emacs "fg ; emacs -nw"))

(defun launch-separate-emacs-under-x ()
  (call-process "sh" nil nil nil "-c" "emacs &"))

(defun restart-emacs ()
  (interactive)
  ;; We need the new emacs to be spawned after all kill-emacs-hooks
  ;; have been processed and there is nothing interesting left
  (let ((kill-emacs-hook
	 (append kill-emacs-hook
		 (list (if (display-graphic-p)
			   #'launch-separate-emacs-under-x
			 #'launch-separate-emacs-in-terminal)))))
    (save-buffers-kill-emacs)))








;; Automatic package installation
(require 'package)
;(add-to-list 'package-archives
;         '("marmalade" . "http://marmalade-repo.org/packages/")
;         '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(defvar initial-packages '(auctex)
  "A list of packages to be installed")

(defvar is_first_run 
  (loop for p in initial-packages
     when (not (package-installed-p p)) do (return nil)
	finally (return t)))

(if is_first_run
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p initial-packages)
    (when (not (package-installed-p p))
      (package-install p))))

