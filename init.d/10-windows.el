; Always display the result of C-x 4 f (find-file-in-other-window) et
; al. in an existing window
(setq display-buffer-overriding-action '(display-buffer-use-some-window . ()))
