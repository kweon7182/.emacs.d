(global-set-key [f7] 'previous-error)
(global-set-key [f8] 'next-error)   
(global-set-key [f9] (lambda() (interactive) (compile "make -k")))


(provide 'key-bindings)

