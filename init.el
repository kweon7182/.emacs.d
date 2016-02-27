(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(inhibit-startup-screen t)
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(global-linum-mode 1)

(global-set-key [f7] 'previous-error)
(global-set-key [f8] 'next-error)   
(global-set-key [f9] 'compile)
(setq compilation-read-command nil)

;; for c-mode
(setq c-default-style "linux" c-basic-offset 4)

;; for sage
(add-to-list 'load-path 
	     (expand-file-name "~/.emacs.d/site-lisp/sage-mode/emacs"))
(require 'sage "sage")
(setq sage-command "/usr/local/bin/sage")
(sage-update-autoloads)
(kill-buffer "sage-load.el")
;; If you want sage-view to typeset all your output and have plot()
;; commands inline, uncomment the following line and configure sage-view:
;; (require 'sage-view "sage-view")
;; (add-hook 'sage-startup-after-prompt-hook 'sage-view)
;; You can use commands like
;; (add-hook 'sage-startup-after-prompt-hook 'sage-view-disable-inline-output)
;; (add-hook 'sage-startup-after-prompt-hook 'sage-view-disable-inline-plots)
;; to enable some combination of features.  Using sage-view requires a
;; working LaTeX installation with the preview package.



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
  ;; check for new packages (package versions)
  (message "%s" "Emacs Prelude is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p initial-packages)
    (when (not (package-installed-p p))
      (package-install p))))



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

(defvar log-file-name "log.txt")

(defun read-log-line (line-num)
  (with-current-buffer (find-file-noselect (locate-user-emacs-file log-file-name))
    (goto-line line-num)
    (let ((start (point)))
      (end-of-line)
      (let ((result (string-to-number (buffer-substring start (point)))))
	(kill-buffer (current-buffer))
	result))))

(defvar run-count (read-log-line 1))
(with-temp-file (locate-user-emacs-file log-file-name) (prin1 (+ run-count 1) (current-buffer)))

