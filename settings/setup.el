;; general setting
(toggle-frame-maximized)
(global-linum-mode 1)


;; for c-mode
(setq c-default-style "linux" c-basic-offset 4)
(add-to-list 'auto-mode-alist '("\\.cu$" . c++-mode))


;; for python
(add-hook 'python-mode-hook '(lambda () 
			       (setq python-indent 4)))

;; for sage
(require 'sage)
(setq sage-command "sage")
(if (not (fboundp 'sage-mode))
    (sage-update-autoloads))


;; for latex
(setq TeX-source-correlate-method (quote synctex))
(setq TeX-source-correlate-mode t)
(setq TeX-source-correlate-start-server t)
(eval-after-load 'latex 
  '(define-key LaTeX-mode-map [f9]
     (lambda ()
       (interactive)
       (save-buffer)
       (TeX-command-run-all ()))))


;; provide
(provide 'setup)
