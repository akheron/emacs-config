; Simpler modeline
(setq-default mode-line-format
      (list " "
            ; Encoding
            'mode-line-mule-info
            ; */% indicators if the file has been modified
            'mode-line-modified
            "  "
            ; line, column, file %
            'mode-line-position
            "  "
            ; the name of the buffer (i.e. filename)
            ; note this gets automatically highlighted
            'mode-line-buffer-identification
            "  "
            ; major and minor modes in effect
            'mode-line-modes
            ; if which-func-mode is in effect, display which
            ; function we are currently in.
            '(which-func-mode ("" which-func-format "--"))
            "-%-"
            )
)
