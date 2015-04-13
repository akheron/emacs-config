(load "js2-mode")
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-hook 'js2-mode-hook
  #'(lambda ()
      (define-key js2-mode-map "\C-m" 'newline-and-indent)
      (define-key js2-mode-map (kbd "C-c C-c") 'comment-region)
      (define-key js2-mode-map (kbd "C-c C-u") 'uncomment-region)
      (define-key js2-mode-map (kbd "C-c C-n") 'next-error)
      (define-key js2-mode-map (kbd "C-c C-p") 'previous-error)
      (setq js2-basic-offset 2)
      (subword-mode)))
