;;; irony_company_settings.el ---
;;
;; Filename: irony_company_settings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 19:22:21 2016 (-0400)
;; Version:
;; Last-Updated:
;;           By:
;;     Update #: 6
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;; irony mode, needs revisit

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
;; (add-hook 'cuda-mode-hook 'irony-mode)
(add-hook 'opencl-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
;; (defun my-irony-mode-hook ()
;;   (define-key irony-mode-map [remap completion-at-point]
;;     'irony-completion-at-point-async)
;;   (define-key irony-mode-map [remap complete-symbol]
;;     'irony-completion-at-point-async))
;; (add-hook 'irony-mode-hook 'my-irony-mode-hook)
;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)


(defun my-ac-irony-setup ()
  ;; be cautious, if yas is not enabled before (auto-complete-mode 1), overlays
  ;; *may* persist after an expansion.
  (yas-minor-mode 1)
  (auto-complete-mode -1)
  (add-to-list 'ac-sources 'ac-source-irony)
  (define-key irony-mode-map (kbd "M-RET") 'ac-complete-irony-async))

(add-hook 'irony-mode-hook 'my-ac-irony-setup)


;; Company mode
(global-company-mode 1)
(setq company-minimum-prefix-length 1)
(setq company-selection-wrap-around t)
;; (eval-after-load 'company
;;   '(progn
;;      (define-key company-active-map (kbd "<return>") nil)
;;      (define-key company-active-map (kbd "RET") nil)
;;      (define-key company-active-map (kbd "C-SPC") 'company-complete-selection)
;;      (define-key company-active-map (kbd "TAB") 'company-select-next)
;;      (define-key company-active-map [tab] 'company-select-next)))

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; irony_company_settings.el ends here
