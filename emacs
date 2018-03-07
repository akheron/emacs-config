;; Link this file to ~/.emacs

(setq default-directory "~/")

;; Muistilappu:
;;
;; set-buffer-file-coding-system
;;

(add-to-list 'load-path "~/.emacs-config/lib/")

;; Preferences
(setq inhibit-startup-message 1)
(setq make-backup-files nil)
(setq confirm-kill-emacs 'y-or-n-p)
(setq tab-width 8)

;; Global modes
(global-font-lock-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(and (functionp 'tool-bar-mode) (tool-bar-mode -1))
(and (functionp 'scroll-bar-mode) (scroll-bar-mode -1))
(menu-bar-mode -1)
(transient-mark-mode -1)
(mouse-avoidance-mode 'jump)
(subword-mode)

;; Disable abbrev-mode
(setq-default abbrev-mode nil)

;; Open links in Google Chrome
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program "chromium")

;; Find executables in ~/local/bin
(setq exec-path (cons "~/local/bin" exec-path))

;; Fix dead keys
(require 'iso-transl)

;; Save Customize variables to a separate file
(setq custom-file "~/.emacs-config/custom.el")
(load custom-file :noerror)

(require 'package)

(setq package-archives
      '(("melpa" . "http://melpa.org/packages/")))

(package-initialize)

(eval-when-compile
  (require 'use-package))

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

; Disable compose-mail
(global-set-key (kbd "C-x m") nil)

(if window-system
  ;; Window system present
  (progn
    ;; Disable iconifying with C-x C-z
    (global-unset-key (kbd "C-x C-z")))

  ;; Running in console
  (progn
    ;; Bind backward-delete-char to ^H
    (global-set-key (kbd "C-h") 'backward-delete-char)))

(global-set-key (kbd "C-x p") '(lambda () (interactive) (other-window -1)))
(global-set-key (kbd "C-z") nil)

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

; Always display the result of C-x 4 f (find-file-in-other-window) et
; al. in an existing window
(setq display-buffer-overriding-action '(display-buffer-use-some-window . ()))

(if window-system
  ;; Window system present
  (let ((font "ProggyClean"))
    (set-face-attribute 'default nil
                        :font font
                        :background "black"
                        :foreground "white")
    (set-face-attribute 'fixed-pitch nil
                        :font font
                        :background "black"
                        :foreground "aquamarine")
    (set-face-attribute 'mode-line nil
                        :background "gray30"
                        :foreground "gray80"
                        :box nil)
    (set-face-attribute 'mode-line-inactive nil
                        :background "gray30"
                        :foreground "gray50"
                        :box nil)
    (set-face-attribute 'cursor nil
                        :background "white"
                        :foreground "black")

    (defun toggle-font ()
      (interactive)
      (case (font-get (face-attribute 'default :font) :family)
        ('ProggyCleanTT (set-face-attribute 'default nil
                                             :font "ProggyClean"))
        (t (set-face-attribute 'default nil
                               :font "ProggyCleanTT"
                               :height 150)))))

  ;; Running in console
  (progn
    (set-face-attribute 'default nil
                        :background "black"
                        :foreground "white")
    (set-face-attribute 'mode-line nil
                        :background "white"
                        :foreground "black"
                        :inverse-video nil
                        :box nil)))

;; Don't rant about disabled functions

(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; One space ends sentence
(setq sentence-end-double-space nil)

;; Use the X primary selection for cutting & pasting
(setq x-select-enable-primary t)
(setq x-select-enable-clipboard nil)

(setq-default indent-tabs-mode nil)

(setq-default show-trailing-whitespace t)

;; Start server after initialization
(add-hook 'after-init-hook 'server-start)

(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

;; For buffer list: show the current line's buffer in other window and
;; hide the buffer list
(defun show-buffer-in-other-window-and-close ()
  (interactive)
  (Buffer-menu-switch-other-window)
  (quit-window)
  (other-window 1))

(defun my-buffer-menu-mode-hook ()
  (define-key Buffer-menu-mode-map "c" 'show-buffer-in-other-window-and-close))

(add-hook 'Buffer-menu-mode-hook 'my-buffer-menu-mode-hook)

(defun transpose-buffers (arg)
  "Transpose the buffers shown in two windows."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
    (while (/= arg 0)
      (let ((this-win (window-buffer))
            (next-win (window-buffer (funcall selector))))
        (set-window-buffer (selected-window) next-win)
        (set-window-buffer (funcall selector) this-win)
        (select-window (funcall selector)))
      (setq arg (if (plusp arg) (1- arg) (1+ arg))))))

(setq-default c-basic-offset 4)
(setq c-offsets-alist '((substatement-open . 0)
                        (case-label . +)
                        (brace-list-open . 0)
                        (statement-case-open . 0)))

(use-package cider
  :ensure t)

(use-package coffee-mode
  :ensure t
  :config
  (setq coffee-tab-width 2)
  (add-hook 'coffee-mode-hook
    #'(lambda ()
        (define-key coffee-mode-map (kbd "C-c C-;") 'coffee-indent-shift-left)
        (define-key coffee-mode-map (kbd "C-c C-:") 'coffee-indent-shift-right)
        (define-key coffee-mode-map (kbd "C-c C-c") 'comment-region)
        (define-key coffee-mode-map (kbd "C-c C-u") 'uncomment-region)
        (subword-mode)
        (which-function-mode))))

; Sane indentation mode
(setq cssm-indent-function #'cssm-c-style-indenter)

; Don't auto-insert closing braces
(setq cssm-mirror-mode nil)

(add-hook 'diff-mode-hook
   #'(lambda ()
       (define-key diff-mode-map "\M-q" 'fill-paragraph)))

(use-package django-html-mode
  :commands django-html-mode
  :config
  (add-hook 'django-html-mode-hook
            #'(lambda ()
                (local-set-key (kbd "C-c %") 'django-close-tag))))

(use-package dockerfile-mode
  :ensure t
  :mode "Dockerfile$")

(use-package elm-mode
  :ensure t
  :config
  (add-hook 'elm-mode-hook
    #'(lambda ()
        (setq elm-indent-offset 4)
        (setq elm-format-elm-version "0.18")
        (subword-mode))))

(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode t)
  (setq git-gutter:always-show-gutter t)
  (bind-key "C-x v =" 'git-gutter:popup-diff)
  (bind-key "C-x v n" 'git-gutter:next-hunk)
  (bind-key "C-x v p" 'git-gutter:previous-hunk))

(use-package haskell-mode
  :ensure t
  :mode "\\.hs$"
  :config
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation))

(use-package intero
  :ensure t
  :config
  (add-hook 'haskell-model-hook 'intero-mode))

(use-package smex
  :ensure t
  :demand
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands))
  :config
  (smex-initialize))

(use-package ido
  :ensure t
  :config
  (setq ido-create-new-buffer 'always)
  (setq ido-default-buffer-method 'selected-window)
  (setq ido-use-filename-at-point nil)
  (ido-mode t)
  (ido-everywhere t)
  (setq ido-enable-flex-matching t) ;fuzzy matching
  (setq ido-show-dot-for-dired nil)
  (setq ido-auto-merge-delay-time 1.50)
  (setq ido-max-directory-size 50000)

  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is the old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))

(use-package idomenu
  :ensure t
  :bind ("M-i" . idomenu))

(use-package integers
  :bind (("C-c +" . increment-integer-at-point)
         ("C-c -" . decrement-integer-at-point)))

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

(use-package jinja2-mode
  :ensure t
  :mode "\\.\\(jinja\\|j2\\)$")

(add-hook 'latex-mode-hook
   #'(lambda ()
       (turn-on-auto-fill)
       (setq tex-open-quote "''")
       (setq tex-close-quote "''")))

(use-package magit
  :ensure t
  :defer 2)

(use-package markdown-mode
  :ensure t
  :mode "\\.md$")

; Simpler modeline
(setq-default mode-line-format
      (list " "
            ; Encoding
            'mode-line-mule-info
            ; */% indicators if the file has been modified
            'mode-line-modified
            "  "
            ; line, column, file %
            'mode-line-position
            "  "
            ; the name of the buffer (i.e. filename)
            ; note this gets automatically highlighted
            'mode-line-buffer-identification
            "  "
            ; major and minor modes in effect
            'mode-line-modes
            ; if which-func-mode is in effect, display which
            ; function we are currently in.
            '(which-func-mode ("" which-func-format "--"))
            "-%-"
            )
)

;; E-mail from mutt

(add-to-list 'auto-mode-alist '("/tmp/mutt.*$" . mail-mode))
(add-hook 'mail-mode-hook 'turn-on-auto-fill)

(use-package org
  :mode "\\.org$")

(use-package python
  :mode ("\\.py$" . python-mode)
  :config
  (add-hook 'python-mode-hook
    #'(lambda ()
        (define-key python-mode-map "\C-m" 'newline-and-indent)
        (define-key python-mode-map (kbd "C-c C-;") 'python-indent-shift-left)
        (define-key python-mode-map (kbd "C-c C-:") 'python-indent-shift-right)
        (define-key python-mode-map (kbd "C-c C-c") 'comment-region)
        (define-key python-mode-map (kbd "C-c C-u") 'uncomment-region)
        (define-key python-mode-map (kbd "C-c C-n") 'flycheck-next-error)
        (define-key python-mode-map (kbd "C-c C-p") 'flycheck-previous-error)
        (electric-indent-local-mode -1)
        (subword-mode))))

;; Restructured text

(use-package rst-mode
  :mode "\\.rst$"
  :config
  (add-hook 'rst-mode-hook 'turn-on-auto-fill)
  (cond ((equal font-lock-global-modes t)
         (setq font-lock-global-modes '(not rst-mode)))
        ((and (listp font-lock-global-modes)
              (equal (car font-lock-global-modes) 'not))
         (append-to-list font-lock-global-modes 'rst-mode))))

(use-package rust-mode
  :mode "\\.rs$"
  :ensure t)

(defun my-scss-init ()
  (when (equal (file-name-extension buffer-file-name) "scss")
    (setq-local css-indent-offset 2)))

(use-package scss-mode
  :ensure t
  :mode "\\.scss$"
  :config
  (add-hook 'css-mode-hook #'my-scss-init))

(use-package typescript-mode
  :ensure t
  :mode "\\.ts\\'")

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

(use-package tide
  :ensure t
  :init (add-hook 'typescript-mode-hook #'setup-tide-mode))

(use-package unfill
  :ensure t
  :commands unfill-paragraph
  :bind ("C-M-q" . unfill-paragraph))

;; Use 'foo|bar', 'foo|baz' style buffer naming

(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'post-forward))

(use-package which-func
  :config
  (set-face-attribute 'which-func nil :foreground "white"))

(use-package whitespace
  :config
  (setq whitespace-line-column 78)
  (setq whitespace-style '(face lines-tail))
  (add-hook 'prog-mode-hook 'whitespace-mode))

(use-package yaml-mode
  :ensure t
  :mode "\\.yml$")

(defun sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))


(global-set-key (kbd "C-x C-r") 'sudo-edit)

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

;; Clear the echo area
(princ "" t)
