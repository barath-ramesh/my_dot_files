;;; matlab_load.el ---
;;
;; Filename: matlab_load.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Fri Jun 17 09:35:11 2016 (-0400)
;; Version:
;; Last-Updated: Fri Jun 17 09:36:08 2016 (-0400)
;;           By: Barath Ramesh
;;     Update #: 3
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;; Replace path below to be where your matlab.el file is.
(add-to-list 'load-path "~/.emacs.d/matlab-emacs")
(load-library "matlab-load")

;; Enable CEDET feature support for MATLAB code. (Optional)
;; (matlab-cedet-setup)

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(eval-after-load 'flycheck
  '(require 'flycheck-matlab-mlint))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; matlab_load.el ends here
