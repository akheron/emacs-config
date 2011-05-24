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
