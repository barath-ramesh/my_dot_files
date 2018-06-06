;;; lang_hooks.el ---
;;
;; Filename: lang_hooks.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 18:59:36 2016 (-0400)
;; Version:
;; Last-Updated: Mon Jun 20 20:10:09 2016 (-0400)
;;           By: Barath Ramesh
;;     Update #: 14
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.gitconfig$" . conf-mode))
(add-hook 'c-mode-hook 'column-enforce-mode)
(add-hook 'c++-mode-hook 'column-enforce-mode)
(add-hook 'cuda-mode-hook 'column-enforce-mode)
(add-hook 'cuda-mode-hook 'auto-complete-mode)
(add-hook 'cuda-mode-hook 'yafolding-mode)
(add-hook 'makefile-mode-hook 'auto-complete-mode)
(add-hook 'prog-mode-hook 'column-enforce-mode)
;; (add-hook 'prog-mode-hook 'auto-complete-mode)
(add-hook 'latex-mode-hook 'column-enforce-mode)
;; (add-hook 'latex-mode-hook 'auto-complete-mode)

;; (add-hook 'c-mode-hook
;;           (lambda () (yafolding-mode)))
;; (add-hook 'c++-mode-hook
;;           (lambda () (yafolding-mode)))
;; (add-hook 'cuda-mode-hook
;;           (lambda () (yafolding-mode)))

(add-hook 'prog-mode-hook
	  (lambda () (yafolding-mode)))
(lambda ()
  (yafolding-show-all)
  (delete-trailing-whitespace))

;; Comment styles
(add-hook 'c++-mode-hook (lambda () (setq comment-start "/*"
					  comment-end   "*/")))
(add-hook 'cuda-mode-hook (lambda () (setq comment-start "/*"
					   comment-end   "*/")))
(add-hook 'c-mode-hook (setq comment-style 'multi-line))
;;(add-hook 'cuda-mode-hook (setq comment-style 'multi-line))

;; (add-hook 'emacs-lisp-mode-hook 'auto-make-header)
;; (add-hook 'cc-mode-common-hook  'auto-make-header)
;; (add-hook 'prog-mode-hook       'auto-make-header)
;; (add-hook 'cuda-mode-hook       'auto-make-header)
;; (add-hook 'matlab-mode-hook     'auto-make-header)

;; electric-case mode
;; (require 'electric-case)
;; (add-hook 'c-mode-hook 'electric-case-mode)
;; (add-hook 'c++-mode-hook 'electric-case-mode)
;; (add-hook 'cuda-mode-hook 'electric-case-mode)
;; (add-hook 'opencl-mode-hook 'electric-case-mode)

(require 'paredit)
(add-hook 'matlab-mode-hook 'paredit-mode)
(add-hook 'matlab-mode-hook 'yafolding-mode)

;; electric-space
;; (require 'electric-spacing)
;; (add-hook 'c-mode-hook 'electric-spacing-mode)
;; (add-hook 'c++-mode-hook 'electric-spacing-mode)
;; (add-hook 'cuda-mode-hook 'electric-spacing-mode)
;; (add-hook 'opencl-mode-hook 'electric-spacing-mode)

;; flyparens
;; (add-hook 'emacs-lisp-mode-hook 'flyparens-mode)
;; (add-hook 'lisp-mode-hook 'flyparens-mode)
;; (add-hook 'scheme-mode-hook 'flyparens-mode)
;; (add-hook 'clojure-mode-hook 'flyparens-mode)
;; (add-hook 'c-mode-hook 'flyparens-mode)
;; (add-hook 'c++-mode-hook 'flyparens-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; lang_hooks.el ends here
