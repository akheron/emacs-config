(use-package scss-mode
  :ensure t
  :mode "\\.scss$"
  :config
  ; Disable flymake for .scss files
  (delete-if (lambda (elem)
               (string-match-p "scss" (car elem)))
             flymake-allowed-file-name-masks)

  ; Don't compile on save
  (setq scss-compile-at-save nil))
