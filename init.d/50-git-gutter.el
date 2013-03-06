(load "git-gutter")

(global-git-gutter-mode t)
(setq git-gutter:always-show-gutter t)

(global-set-key (kbd "C-x v =") 'git-gutter:popup-diff)
