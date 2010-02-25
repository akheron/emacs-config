;; Muistilappu:
;;
;; set-buffer-file-coding-system
;;

(add-to-list 'load-path "~/.elisp/lib/")

;; Preferences
(setq inhibit-startup-message 1)
(setq inhibit-startup-echo-area-message "petri")
(setq make-backup-files nil)
(setq confirm-kill-emacs 'y-or-n-p)
(setq default-tab-width 8)
(setq user-mail-address "petri.lehtinen@inoi.fi")

;; Global modes
(global-font-lock-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(mouse-avoidance-mode 'jump)

;; Disable abbrev-mode
(setq-default abbrev-mode nil)

;; Start server after initialization
(add-hook 'after-init-hook 'server-start)
