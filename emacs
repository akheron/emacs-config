;(package-initialize)

(setq akheron--emacs-org "~/.emacs-config/emacs.org")

(require 'ob-tangle)
(org-babel-load-file akheron--emacs-org)
