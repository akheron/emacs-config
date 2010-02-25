(require 'django-html-mode)

(add-hook 'django-html-mode-hook
          #'(lambda ()
              (local-set-key (kbd "C-c %") 'django-close-tag)))
