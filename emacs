;; Link this file to ~/.emacs

(setq default-directory "~/")

(when (file-exists-p "~/.emacs-site.el")
  (load "~/.emacs-site"))

(dolist (file (directory-files "~/.elisp/init.d" t ".elc?$"))
  (load (file-name-sans-extension file)))

;; Clear the echo area
(princ "" t)
