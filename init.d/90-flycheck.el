(use-package grizzl
  :ensure t

  ; Will be loaded by flycheck
  :defer t)


(use-package flycheck
  :ensure t
  :config

  (let ((virtualenv-dir "~/.virtualenvs/emacs"))
    ;; Only have flycheck bitching in left-fringe
    (setq flycheck-highlighting-mode 'lines)

    ;; Use grizzl instead of ido for completion
    (setq flycheck-completion-system 'grizzl)

    (setq-default flycheck-flake8rc
                  (expand-file-name "~/.emacs-config/conf/flake8rc"))

    ;; Remember to copy ~/.emacs-config/bin/flake8trunc to the
    ;; virtualenv's bin directory.
    (setq-default flycheck-python-flake8-executable
                  (concat (expand-file-name virtualenv-dir) "/bin/flake8trunc"))

    ;; Disable elisp checker.
    (setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers))

    (setq flycheck-display-errors-delay 0.1)

    ;; Defined in 50-javascript.el
    (add-hook 'flycheck-mode-hook #'use-js-executables-from-node-modules)

    (add-hook 'after-init-hook #'global-flycheck-mode)))
