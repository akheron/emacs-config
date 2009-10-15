;; E-mail from mutt

(add-to-list 'auto-mode-alist '("/tmp/mutt.*$" . mail-mode))
(add-hook 'mail-mode-hook 'turn-on-auto-fill)
