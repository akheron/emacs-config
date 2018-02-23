(defun my-scss-init ()
  (when (equal (file-name-extension buffer-file-name) "scss")
    (setq-local css-indent-offset 2)))

(use-package scss-mode
  :ensure t
  :mode "\\.scss$"
  :config
  (add-hook 'css-mode-hook #'my-scss-init))
