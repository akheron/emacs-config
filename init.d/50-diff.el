(add-hook 'diff-mode-hook
   #'(lambda ()
       (define-key diff-mode-map "\M-q" 'fill-paragraph)))
