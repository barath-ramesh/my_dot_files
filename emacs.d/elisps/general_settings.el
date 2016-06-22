;;; general_settings.el ---
;;
;; Filename: general_settings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 18:47:30 2016 (-0400)
;; Version:
;; Last-Updated: Sat Jun 11 18:47:51 2016 (-0400)
;;           By: Barath Ramesh
;;     Update #: 2
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

;;Indentation
(setq tab-width 2
      indent-tabs-mode nil)

;;Backup files
(setq make-backup-files nil)

;;Yes and No
(defalias 'yes-or-no-p 'y-or-n-p)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; general_settings.el ends here
