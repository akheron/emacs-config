(require 'coffee-mode)
(setq coffee-tab-width 2)

(add-hook 'coffee-mode-hook
  #'(lambda ()
      (define-key coffee-mode-map (kbd "C-c C-;") 'coffee-indent-shift-left)
      (define-key coffee-mode-map (kbd "C-c C-:") 'coffee-indent-shift-right)
      (define-key coffee-mode-map (kbd "C-c C-c") 'comment-region)
      (define-key coffee-mode-map (kbd "C-c C-u") 'uncomment-region)
      (subword-mode)
      (which-function-mode)))
