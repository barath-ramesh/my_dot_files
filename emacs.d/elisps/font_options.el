;;; font_options.el ---
;;
;; Filename: font_options.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 18:45:11 2016 (-0400)
;; Version:
;; Last-Updated:
;;           By:
;;     Update #: 28
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;;Display Settings
;; (when window-system
;;   (setq frame-title-format '(buffer-file-name "%f" ("%b")))
;;   (set-face-attribute 'default nil
;;        :family "DejaVu Sans Mono"
;;        :height 124
;;        :weight 'normal
;;        :width 'normal)

;; (when (functionp 'set-fontset-font)
;;   (set-fontset-font "fontset-default"
;;		    'unicode
;;		    (font-spec :family "DejaVu Sans Mono"
;;			       :width 'normal
;;			       :size 14.4
;;			       :weight 'normal)))

(set-frame-font "DejaVu Sans Mono" nil t)
(set-face-attribute 'default nil :height 140)

;; (set-frame-font "Source Code Pro" nil t)
;; (set-face-attribute 'default nil :height 168)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; font_options.el ends here
