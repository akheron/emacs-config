;; See ~/.elisp/init.d/00-general.el

(setq default-directory "~/")

(dolist (file (directory-files "~/.elisp/init.d" t ".elc?$"))
  (load (file-name-sans-extension file)))

;; Clear the echo area
(princ "" t)
