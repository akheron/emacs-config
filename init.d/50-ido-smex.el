(require 'ido)

(require 'smex)
(smex-initialize)

(setq ido-create-new-buffer 'always)
(setq ido-default-buffer-method 'selected-window)
(setq ido-use-filename-at-point nil)
(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t) ;fuzzy matching
(setq ido-show-dot-for-dired nil)
(setq ido-auto-merge-delay-time 1.50)
(setq ido-max-directory-size 50000)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is the old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; idomenu
(autoload 'idomenu "idomenu" nil t)
(global-set-key (kbd "M-i") 'idomenu)
