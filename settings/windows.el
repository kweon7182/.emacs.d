;; Settings for Windows
(when (eq system-type 'windows-nt)
  ;;(setq sumatra-path "\"C:/Program Files/SumatraPDF/SumatraPDF.exe\" -reuse-instance")
  (setq TeX-view-program-list
	'(("Sumatra PDF" ("\"C:/Program Files/SumatraPDF/SumatraPDF.exe\" -reuse-instance"
			  (mode-io-correlate " -forward-search %b %n -inverse-search \"C:/Program Files/emacs-24.5/bin/emacsclientw --no-wait +%%l \\\"%%f\\\"\" ") " %o")))))

(with-eval-after-load 'tex
  (when (eq system-type 'windows-nt)
    (assq-delete-all 'output-pdf TeX-view-program-selection)
    (add-to-list 'TeX-view-program-selection '(output-pdf "Sumatra PDF"))))


(provide 'windows)

