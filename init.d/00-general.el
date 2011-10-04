;; Muistilappu:
;;
;; set-buffer-file-coding-system
;;

(add-to-list 'load-path "~/.emacs-config/lib/")

;; Preferences
(setq inhibit-startup-message 1)
(setq make-backup-files nil)
(setq confirm-kill-emacs 'y-or-n-p)
(setq default-tab-width 8)

;; Global modes
(global-font-lock-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(and (functionp 'tool-bar-mode) (tool-bar-mode -1))
(and (functionp 'scroll-bar-mode) (scroll-bar-mode -1))
(menu-bar-mode -1)
(transient-mark-mode -1)
(mouse-avoidance-mode 'jump)

;; Disable abbrev-mode
(setq-default abbrev-mode nil)

;; By default, disable flymake for all files
(setq flymake-allowed-file-name-masks '())
