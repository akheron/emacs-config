(require 'package)

;; Add package archives.
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(coffee-mode
    git-gutter
    ;js2-mode
    less-css-mode
    smex))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
