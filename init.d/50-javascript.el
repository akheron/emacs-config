(use-package rjsx-mode
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

  (bind-key "C-m" 'newline-and-indent js2-mode-map)
  (bind-key "C-c C-c" 'comment-region js2-mode-map)
  (bind-key "C-c C-u" 'uncomment-region js2-mode-map)
  (bind-key "C-c C-n" 'flycheck-next-error js2-mode-map)
  (bind-key "C-c C-p" 'flycheck-previous-error js2-mode-map)

  (add-hook 'js2-mode-hook '(lambda ()
    (setq js2-basic-offset 2)
    (subword-mode))))

; js-mode is used for JSON
(add-hook 'js-mode-hook #'(lambda () (setq js-indent-level 2)))
