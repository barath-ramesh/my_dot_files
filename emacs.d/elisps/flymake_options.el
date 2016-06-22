;;; flymake_options.el ---
;;
;; Filename: flymake_options.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 19:12:59 2016 (-0400)
;; Version:
;; Last-Updated: Sat Jun 11 19:13:03 2016 (-0400)
;;           By: Barath Ramesh
;;     Update #: 1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;; stronger error display
(defface flymake-message-face
  '((((class color) (background light)) (:foreground "#b2dfff"))
    (((class color) (background dark))  (:foreground "#b2dfff")))
  "Flymake message face")

;; show the flymake errors in the minibuffer
(package-require 'flymake-cursor)

;; use allout minor mode to have outlining everywhere.
(allout-mode)

;; syntax highlighting everywhere
(global-font-lock-mode 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; flymake_options.el ends here
