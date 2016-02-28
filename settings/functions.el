
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

(defmacro with-advice (adlist &rest body)
  "Execute BODY with temporary advice in ADLIST.

Each element of ADLIST should be a list of the form
  (SYMBOL WHERE FUNCTION [PROPS])
suitable for passing to `advice-add'.  The BODY is wrapped in an
`unwind-protect' form, so the advice will be removed even in the
event of an error or nonlocal exit."
  (declare (debug ((&rest (&rest form)) body))
           (indent 1))
  `(progn
     ,@(mapcar (lambda (adform)
                 (cons 'advice-add adform))
               adlist)
     (unwind-protect (progn ,@body)
       ,@(mapcar (lambda (adform)
                   `(advice-remove ,(car adform) ,(nth 2 adform)))
                 adlist))))

(defun bypass-confirmation (function &rest args)
  "Call FUNCTION with ARGS, bypassing all prompts.
This includes both `y-or-n-p' and `yes-or-no-p'."
  (with-advice
      ((#'y-or-n-p    :override (lambda (prompt) t))
       (#'yes-or-no-p :override (lambda (prompt) t)))
    (apply function args)))


(provide 'functions)
