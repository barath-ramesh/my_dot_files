;;; matlab_settings.el ---
;;
;; Filename: matlab_settings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Fri Jun 17 09:23:15 2016 (-0400)
;; Version:
;; Last-Updated: Fri Jun 17 09:27:39 2016 (-0400)
;;           By: Barath Ramesh
;;     Update #: 6
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(load-library "matlab-load")

(add-to-list 'company-backends 'company-anaconda)

(eval-after-load 'flycheck
  '(require 'flycheck-matlab-mlint))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; matlab_settings.el ends here
