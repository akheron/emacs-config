(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))

(add-hook 'web-mode-hook
          #'(lambda ()
              (define-key web-mode-map (kbd "M-;") 'beginning-of-buffer)
              (define-key web-mode-map (kbd "C-c /") 'web-mode-element-close)))
