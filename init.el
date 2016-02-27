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

(unless
    (loop for p in initial-packages
	  when (not (package-installed-p p)) do (return nil)
	  finally (return t))
  ;; check for new packages (package versions)
  (message "%s" "Emacs Prelude is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p prelude-packages)
    (when (not (package-installed-p p))
      (package-install p))))

