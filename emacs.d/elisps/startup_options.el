;;; startup_options.el ---
;;
;; Filename: startup_options.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 08:45:33 2016 (-0400)
;; Version:
;; Last-Updated: Sat Jun 11 08:46:10 2016 (-0400)
;;           By: Barath Ramesh
;;     Update #: 1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;;Start-up options
;;Splash Screens
(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

;;Scroll bar, Tool bar, Menu bar, Blinking cursor, display time,..
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(blink-cursor-mode -1)
(display-time)
;;(toggle-frame-fullscreen)

;;Marking text
(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; startup_options.el ends here
