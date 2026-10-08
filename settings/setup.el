;; general setting
;(toggle-frame-maximized)
(global-linum-mode 1)

(defun my-find-file-check-make-large-file-read-only-hook ()
  "If a file is over a given size, make the buffer read only."
  (when (> (buffer-size) (* 1024 1024))
    (linum-mode -1)))
(add-hook 'find-file-hook 'my-find-file-check-make-large-file-read-only-hook)


;; for c-mode
(setq c-default-style "linux" c-basic-offset 4)
(add-to-list 'auto-mode-alist '("\\.cu$" . c++-mode))


;; for python
(add-hook 'python-mode-hook '(lambda () 
			       (setq python-indent 4)))
(setq python-shell-prompt-detect-failure-warning nil)
(setq python-shell-completion-native-enable nil)
(setenv "PYTHONIOENCODING" "utf-8")
(setq inhibit-compacting-font-caches t)

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


;;;; for lua-mode
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))


;; provide
(provide 'setup)
