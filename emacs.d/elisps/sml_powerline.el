;;; sml_powerline.el ---
;;
;; Filename: sml_powerline.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sun Jun 12 01:30:50 2016 (-0400)
;; Version:
;; Last-Updated:
;;           By:
;;     Update #: 1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;; Powerline theme
;; These two lines are just examples
(setq powerline-arrow-shape 'curve)
(setq powerline-default-separator-dir '(right . left))
;; These two lines you really need.
(setq sml/theme 'powerline)
(sml/setup)
;; (custom-set-faces
;;  '(sml/prefix ((t (:inherit sml/global :background "#282a2e" :foreground "white"))))
;;  '(sml/process ((t (:inherit sml/prefix :background "dim gray")))))

;; (require 'smart-mode-line)
;; (setq powerline-arrow-shape 'curve)
;; (setq powerline-default-separator-dir '(right . left))
;; (setq sml/theme 'powerline)
;; (setq sml/mode-width 0)
;; (setq sml/name-width 20)
;; (rich-minority-mode 1)
;; (setf rm-blacklist "")
;; (sml/setup)

;; emacs-powerline
;; (load "~/.emacs.d/elisps/emacs_powerline")

;; telephone line
;; (require 'telephone-line)
;; (telephone-line-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; sml_powerline.el ends here
