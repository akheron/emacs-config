(require 'package)

;; Add package archives.
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(coffee-mode
    git-gutter
    js2-mode
    rust-mode
    less-css-mode
    smex))

(let ((packages-updated nil))
  (dolist (pkg my-packages)
    (when (not (package-installed-p pkg))
      (when (not packages-updated)
        ; Refresh package archive the first time
        (package-refresh-contents)
        (setq packages-updated t))
      (package-install pkg))))
