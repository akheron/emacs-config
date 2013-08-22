(require 'whitespace)
(setq whitespace-line-column 78)
(setq whitespace-style '(face lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)
