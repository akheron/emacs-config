;; Whitespace Nagger

(defface ws-nagger-face '((t (:background "DeepPink4")))
  "*Face for highlighting invalid whitespace in Font-Lock mode."
  :group 'Whitespace-Nagger :group 'font-lock :group 'faces)

(defvar ws-nagger-trailing-whitespace-keyword
  '("[ \t]+$" (0 'ws-nagger-face t)))

(defvar ws-nagger-leading-spaces-keyword
  '("^\t*[ ]+" (0 'ws-nagger-face t)))

(defvar ws-nagger-leading-tabs-keyword
  '("^[ ]*\t+" (0 'ws-nagger-face t)))

(defun ws-nagger-add-keywords (&rest keywords)
  (dolist (kw keywords)
    (font-lock-add-keywords nil (list kw))))

(defun ws-nagger-remove-keywords (&rest keywords)
  (dolist (kw keywords)
    (font-lock-remove-keywords nil (list kw))))

(defun ws-nagger-remove-all-keywords ()
  (ws-nagger-remove-keywords ws-nagger-trailing-whitespace-keyword
                             ws-nagger-leading-spaces-keyword
                             ws-nagger-leading-tabs-keyword))

(defun set-indent-tabs-mode (how)
  ;; TODO: Save the original indent-tabs-mode value and restore when
  ;; (eq how 'restore)
  (cond ((eq how 'on) (setq indent-tabs-mode t))
        ((eq how 'off) (setq indent-tabs-mode nil))
        ((eq how 'restore) (setq indent-tabs-mode nil))))

(defun ws-nagger-tabbed-mode ()
  (interactive)
  (set-indent-tabs-mode 'on)
  (ws-nagger-remove-all-keywords)
  (ws-nagger-add-keywords ws-nagger-trailing-whitespace-keyword
                          ws-nagger-leading-spaces-keyword)
  (font-lock-mode -1)
  (font-lock-mode 1))

(defun ws-nagger-untabbed-mode ()
  (interactive)
  (set-indent-tabs-mode 'off)
  (ws-nagger-remove-all-keywords)
  (ws-nagger-add-keywords ws-nagger-trailing-whitespace-keyword
                          ws-nagger-leading-tabs-keyword)
  (font-lock-mode -1)
  (font-lock-mode 1))

(defun ws-nagger-off ()
  (interactive)
  (set-indent-tabs-mode 'restore)
  (ws-nagger-remove-all-keywords)
  (font-lock-mode -1)
  (font-lock-mode 1))
