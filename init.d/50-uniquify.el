;; Use 'foo|bar', 'foo|baz' style buffer naming

(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'post-forward))
