(use-package flycheck
  :ensure t
  :config

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
  (eval-after-load 'flycheck
    '(setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers)))

  ;; JSX checker
  (flycheck-define-checker javascript-jsxhint
    "A JSX syntax and style checker using jsxhint."
    :command ("jsxhint" "--checkstyle-reporter" "--es6module"
             ; (config-file "--config" flycheck-jshintrc)
              source)
    :error-parser flycheck-parse-checkstyle
    :error-filter flycheck-dequalify-error-ids
    :modes (js-mode js2-mode js3-mode))

  ;; Add javascript-jsxhint to the list of available checkers
  (add-to-list 'flycheck-checkers 'javascript-jsxhint)

  (setq flycheck-display-errors-delay 0.1)

  (add-hook 'after-init-hook #'global-flycheck-mode))
