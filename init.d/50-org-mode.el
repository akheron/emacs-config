(add-to-list 'load-path "~/.emacs-config/lib/org-mode/lisp")
(require 'org-install)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-default-notes-file (concat shared-directory "/notes.org"))

(setq org-capture-templates
  '(("pi" "CPython Issue" entry
     (file+headline org-default-notes-file "CPython")
     (file "/tmp/python-note-template"))
    ("p" "CPython todo" entry
     (file+headline org-default-notes-file "CPython")
     "* TODO %?")))

(defun add-cpython-issue-note (issue)
    (interactive "nIssue number: ")
    (call-process "~/.emacs-config/bin/python-issue-template.py"
                  nil nil nil
                  "/tmp/python-note-template" (number-to-string issue))
    (org-capture nil "pi"))

(global-set-key "\C-cp" 'add-cpython-issue-note)

(setq org-timer-default-timer 25)
(add-hook 'org-timer-done-hook
          (lambda () (play-sound-file "~/.emacs-config/data/ring.wav")))
