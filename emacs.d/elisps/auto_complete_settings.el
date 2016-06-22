;;; auto_complete_settings.el ---
;;
;; Filename: auto_complete_settings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 18:54:59 2016 (-0400)
;; Version:
;; Last-Updated: Sat Jun 11 18:55:08 2016 (-0400)
;;           By: Barath Ramesh
;;     Update #: 2
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(require 'auto-complete-config)
(ac-config-default)
(auto-complete-mode 1)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(global-auto-complete-mode 1)
(setq ac-auto-start 2)
(define-key ac-completing-map (kbd "\C-n") 'ac-next)
(define-key ac-completing-map (kbd "\C-p") 'ac-previous)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; auto_complete_settings.el ends here
