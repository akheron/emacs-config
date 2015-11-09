;; Restructured text

(use-package rst-mode
  :mode "\\.rst$"
  :config
  (add-hook 'rst-mode-hook 'turn-on-auto-fill)
  (cond ((equal font-lock-global-modes t)
         (setq font-lock-global-modes '(not rst-mode)))
        ((and (listp font-lock-global-modes)
              (equal (car font-lock-global-modes) 'not))
         (append-to-list font-lock-global-modes 'rst-mode))))
