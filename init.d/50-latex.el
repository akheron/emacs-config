(add-hook 'latex-mode-hook
   #'(lambda ()
       (turn-on-auto-fill)
       (setq tex-open-quote "''")
       (setq tex-close-quote "''")))
