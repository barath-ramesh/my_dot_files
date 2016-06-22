;;; emacs_powerline.el ---
;;
;; Filename: emacs_powerline.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 08:42:56 2016 (-0400)
;; Version:
;; Last-Updated: Sat Jun 11 20:11:45 2016 (-0400)
;;           By: Barath Ramesh
;;     Update #: 7
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(add-to-list 'load-path "~/.emacs.d/elisps/emacs-powerline")
(require 'powerline)

(setq powerline-arrow-shape 'arrow)   ;; the default
(setq powerline-arrow-shape 'curve)   ;; give your mode-line curves
(setq powerline-arrow-shape 'arrow14) ;; best for small fonts

(custom-set-faces
 '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))

(setq powerline-color1 "grey22")
(setq powerline-color2 "grey40")

(set-face-attribute 'mode-line nil
		 :foreground "black"
		 :background "sea green"
		 :box nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; emacs_powerline.el ends here
