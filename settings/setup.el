(toggle-frame-maximized)
(global-linum-mode 1)

;; for c-mode
(setq c-default-style "linux" c-basic-offset 4)
(add-to-list 'auto-mode-alist '("\\.cu$" . c++-mode))

;; for sage
(require 'sage)
(setq sage-command "sage")
(if (not (fboundp 'sage-mode))
    (sage-update-autoloads))

(provide 'setup)
