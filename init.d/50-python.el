;(load "python.el")
(require 'python)

(add-hook 'python-mode-hook
  #'(lambda ()
      (define-key python-mode-map "\C-m" 'newline-and-indent)
      (define-key python-mode-map (kbd "C-c C-;") 'python-shift-left)
      (define-key python-mode-map (kbd "C-c C-:") 'python-shift-right)
      (define-key python-mode-map (kbd "C-c C-c") 'comment-region)
      (define-key python-mode-map (kbd "C-c C-u") 'uncomment-region)
      (turn-off-auto-fill)))

(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
