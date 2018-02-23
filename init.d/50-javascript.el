;; Adapted from https://github.com/lunaryorn/old-emacs-configuration/blob/c854f4dd4555581f36665b844cd7c45034cf36a3/lisp/lunaryorn-flycheck.el#L62-L75

(defun node-modules-executable (parent-dir executable-name)
  (expand-file-name (concat "node_modules/.bin/" executable-name) parent-dir))


(defun node-modules-has-executable (parent-dir executable-name)
  (let ((executable-path (node-modules-executable parent-dir executable-name)))
    (and (file-regular-p executable-path)
         (file-executable-p executable-path))))

(defun find-node-modules-executable (executable-name)
  (-when-let* ((file-name (buffer-file-name))
               (root (locate-dominating-file file-name #'(lambda (dir) (node-modules-has-executable dir executable-name)))))
    (node-modules-executable root executable-name)))

;; Used in 90-flycheck.el
(defun use-js-executables-from-node-modules ()
  "Set executables of JS checkers from local node modules."
  (pcase-dolist (`(,checker . ,module) '((javascript-jshint . "jshint")
                                         (javascript-eslint . "eslint")
                                         (javascript-jscs   . "jscs")))
    (when-let ((lint-executable (find-node-modules-executable module))
               (executable-var (flycheck-checker-executable-variable checker)))
      (set (make-local-variable executable-var) lint-executable))))

;; End of adapted

(use-package prettier-js
  :ensure t)

(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :config
  (setq-default js2-mode-show-parse-errors nil)
  (setq-default js2-mode-show-strict-warnings nil)
  (add-hook 'js2-mode-hook '(lambda ()
    (bind-key "C-m" 'newline-and-indent js2-mode-map)
    (bind-key "C-c C-c" 'comment-region js2-mode-map)
    (bind-key "C-c C-u" 'uncomment-region js2-mode-map)
    (bind-key "C-c C-n" 'flycheck-next-error js2-mode-map)
    (bind-key "C-c C-p" 'flycheck-previous-error js2-mode-map)
    (when-let ((prettier-executable (find-node-modules-executable "prettier")))
      (set (make-local-variable 'prettier-js-command) prettier-executable))
    (prettier-js-mode)
    (setq js2-basic-offset 2)
    (subword-mode))))

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))

; js-mode is used for JSON
(setq-default js-indent-level 2)
