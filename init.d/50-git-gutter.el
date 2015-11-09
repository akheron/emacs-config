(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode t)
  (setq git-gutter:always-show-gutter t)
  (bind-key "C-x v =" 'git-gutter:popup-diff)
  (bind-key "C-x v n" 'git-gutter:next-hunk)
  (bind-key "C-x v p" 'git-gutter:previous-hunk))
