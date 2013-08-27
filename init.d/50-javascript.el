(load "js2-mode")
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-hook 'js2-mode-hook
  #'(lambda ()
      (define-key js2-mode-map "\C-m" 'newline-and-indent)
      (define-key js2-mode-map (kbd "C-c C-c") 'comment-region)
      (define-key js2-mode-map (kbd "C-c C-u") 'uncomment-region)
      (subword-mode)))
