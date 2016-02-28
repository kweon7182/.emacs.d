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
(require 'sage)
(setq sage-command "sage")
;; If you want sage-view to typeset all your output and have plot()
;; commands inline, uncomment the following line and configure sage-view:
;; (require 'sage-view "sage-view")
;; (add-hook 'sage-startup-after-prompt-hook 'sage-view)
;; You can use commands like
;; (add-hook 'sage-startup-after-prompt-hook 'sage-view-disable-inline-output)
;; (add-hook 'sage-startup-after-prompt-hook 'sage-view-disable-inline-plots)
;; to enable some combination of features.  Using sage-view requires a
;; working LaTeX installation with the preview package.

(provide 'init)
