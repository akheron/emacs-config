(use-package js2-mode
  :ensure t
  :mode "\\.js$"
  :config
  (setq-default js2-mode-show-parse-errors nil)
  (setq-default js2-mode-show-strict-warnings t)
  (setq-default js2-strict-trailing-comma-warning nil)
  (setq-default js2-strict-missing-semi-warning nil)
  (setq-default js2-strict-inconsistent-return-warning t)
  (setq-default js2-strict-cond-assign-warning t)
  (setq-default js2-strict-var-redeclaration-warning t)
  (setq-default js2-strict-var-hides-function-arg-warning t)

  (add-hook 'js2-mode-hook
    #'(lambda ()
        (define-key js2-mode-map "\C-m" 'newline-and-indent)
        (define-key js2-mode-map (kbd "C-c C-c") 'comment-region)
        (define-key js2-mode-map (kbd "C-c C-u") 'uncomment-region)
        (define-key js2-mode-map (kbd "C-c C-n") 'next-error)
        (define-key js2-mode-map (kbd "C-c C-p") 'previous-error)
        (setq js2-basic-offset 2)
        (subword-mode))))
