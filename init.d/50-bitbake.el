;; Bitbake recipes

(require 'gentoo-syntax)

(add-to-list 'auto-mode-alist '("\\.bb$" . ebuild-mode))
(add-to-list 'auto-mode-alist '("\\.bbclass$" . ebuild-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . ebuild-mode))
