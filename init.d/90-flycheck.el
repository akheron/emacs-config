(require 'flycheck)

;; Only have flycheck bitching in left-fringe
(setq flycheck-highlighting-mode 'nil)

;; Use grizzl instead of ido for completion
(setq flycheck-completion-system 'grizzl)


;; Disable elisp checker.
(eval-after-load 'flycheck
  '(setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers)))

(setq flycheck-display-errors-delay 0.1)

(add-hook 'after-init-hook #'global-flycheck-mode)
