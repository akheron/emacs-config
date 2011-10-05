(if window-system
  ;; Window system present
  (progn
    (set-face-attribute 'default nil
                        :font "ProggyClean"
                        :background "black"
                        :foreground "white")
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
                        :foreground "black"))

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
