(use-package elm-mode
  :ensure t
  :config
  (add-hook 'elm-mode-hook
    #'(lambda ()
        (setq elm-indent-offset 4)
        (setq elm-format-elm-version "0.18")
        (subword-mode))))
