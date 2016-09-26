;; Link this file to ~/.emacs

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq default-directory "~/")

(when (file-exists-p "~/.emacs-site.el")
  (load "~/.emacs-site"))

(dolist (file (directory-files "~/.emacs-config/init.d" t ".elc?$"))
  (load (file-name-sans-extension file)))

;; Clear the echo area
(princ "" t)
