;;; flyparens_options.el ---
;;
;; Filename: flyparens_options.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Mon Jun 20 20:00:15 2016 (-0400)
;; Version:
;; Last-Updated:
;;           By:
;;     Update #: 7
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;; additional indication by the color of the text cursor (grey cursor if any mismatched paren)
(defun my-flyparens-function (position)
  (flyparens-default-function position)
  (set-cursor-color (if position "grey" "black")))
(setq flyparens-function
      'my-flyparens-function)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; flyparens_options.el ends here
