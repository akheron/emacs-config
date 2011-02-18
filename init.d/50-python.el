(require 'python)

(add-hook 'python-mode-hook
  #'(lambda ()
      (define-key python-mode-map "\C-m" 'newline-and-indent)
      (define-key python-mode-map (kbd "C-c C-;") 'python-indent-shift-left)
      (define-key python-mode-map (kbd "C-c C-:") 'python-indent-shift-right)
      (define-key python-mode-map (kbd "C-c C-c") 'comment-region)
      (define-key python-mode-map (kbd "C-c C-u") 'uncomment-region)))
