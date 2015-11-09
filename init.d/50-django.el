(use-package django-html-mode
  :commands django-html-mode
  :config
  (add-hook 'django-html-mode-hook
            #'(lambda ()
                (local-set-key (kbd "C-c %") 'django-close-tag))))
