(use-package haskell-mode
  :ensure t
  :mode "\\.hs$"
  :config
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation))

(use-package intero
  :ensure t
  :config
  (add-hook 'haskell-model-hook 'intero-mode))
