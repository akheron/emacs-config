;; Based on "Effective emacs"
;; http://steve.yegge.googlepages.com/effective-emacs

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\M-r" 'isearch-backward-regexp)
(global-set-key "\M-s" 'isearch-forward-regexp)
(global-set-key [f5] 'call-last-kbd-macro)

(global-set-key "\M-n" 'forward-paragraph)
(global-set-key "\M-p" 'backward-paragraph)
(global-set-key "\C-\M-n" '(lambda () (interactive) (forward-line 12)))
(global-set-key "\C-\M-p" '(lambda () (interactive) (forward-line -12)))
(global-set-key "\C-x\C-g" 'goto-line)

(global-set-key (kbd "M--") 'dabbrev-expand)
(global-set-key (kbd "C-M-y") 'clipboard-yank)

(if window-system
  ;; Window system present
  (progn
    ;; Disable iconifying with C-x C-z
    (global-unset-key (kbd "C-x C-z")))

  ;; Running in console
  (progn
    ;; Bind backward-delete-char to ^H
    (global-set-key (kbd "C-h") 'backward-delete-char)))

(global-set-key (kbd "C-x n") 'other-window)
(global-set-key (kbd "C-x p") '(lambda () (interactive) (other-window -1)))
(global-set-key (kbd "C-z") nil)
(global-set-key (kbd "C-z n") 'other-window)
(global-set-key (kbd "C-z p") '(lambda () (interactive) (other-window -1)))

; Copy to clipboard
(global-set-key (kbd "C-x M-w") 'clipboard-kill-ring-save)

; Unset harmful keys
(global-unset-key (kbd "M-DEL"))
;(global-unset-key (kbd "<up>"))
;(global-unset-key (kbd "<down>"))
;(global-unset-key (kbd "<left>"))
;(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "C-<up>"))
(global-unset-key (kbd "C-<down>"))
(global-unset-key (kbd "C-<left>"))
(global-unset-key (kbd "C-<right>"))

; Imitate US keyboard layout
(global-set-key (kbd "M-;") 'beginning-of-buffer)
(global-set-key (kbd "M-:") 'end-of-buffer)

; see 50-buffers.el
(global-set-key (kbd "C-x 4 t") 'transpose-buffers)
