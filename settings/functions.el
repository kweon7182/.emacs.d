
(defvar log-file-path (locate-user-emacs-file "log.txt")
  "The path of the log file.")

(defun read-log-line (line-num)
  "Return the string of (LINE-NUM)-th line of the log file."
  (with-current-buffer (find-file-noselect log-file-path)
    (goto-line line-num)
    (let ((start (point)))
      (end-of-line)
      (let ((result (buffer-substring start (point))))
	(kill-buffer (current-buffer))
	result))))

(defun write-log (str)
  "Write str into the log file."
  (with-temp-file log-file-path "")
  (append-to-file str nil log-file-path))

(provide 'functions)

