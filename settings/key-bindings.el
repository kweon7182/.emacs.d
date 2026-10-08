(global-set-key [f7] 'previous-error)
(global-set-key [f8] 'next-error)   
(global-set-key [f9] (lambda() (interactive) (compile "make -k")))
(eval-after-load 'lua-mode
  '(define-key lua-mode-map (kbd "C-c C-c") 'lua-send-proc))
(eval-after-load 'lua-mode
  '(define-key lua-mode-map (kbd "C-c C-v") 'lua-send-current-line))


(provide 'key-bindings)

