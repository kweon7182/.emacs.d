(toggle-frame-maximized)
(global-linum-mode 1)

;; for c-mode
(setq c-default-style "linux" c-basic-offset 4)

;; for sage
(require 'sage)
(setq sage-command "sage")
(if (not (fboundp 'sage-mode))
    (sage-update-autoloads))


(provide 'setup)
