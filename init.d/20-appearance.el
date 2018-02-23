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
