;; For buffer list: show the current line's buffer in other window and
;; hide the buffer list
(defun show-buffer-in-other-window-and-close ()
  (interactive)
  (Buffer-menu-switch-other-window)
  (quit-window)
  (other-window 1))

(defun my-buffer-menu-mode-hook ()
  (define-key Buffer-menu-mode-map "c" 'show-buffer-in-other-window-and-close))

(add-hook 'Buffer-menu-mode-hook 'my-buffer-menu-mode-hook)

(defun transpose-buffers (arg)
  "Transpose the buffers shown in two windows."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
    (while (/= arg 0)
      (let ((this-win (window-buffer))
            (next-win (window-buffer (funcall selector))))
        (set-window-buffer (selected-window) next-win)
        (set-window-buffer (funcall selector) this-win)
        (select-window (funcall selector)))
      (setq arg (if (plusp arg) (1- arg) (1+ arg))))))
