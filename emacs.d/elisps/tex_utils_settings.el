;;; tex_utils_settings.el ---
;;
;; Filename: tex_utils_settings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 19:18:58 2016 (-0400)
;; Version:
;; Last-Updated: Mon Apr 10 14:09:59 2017 (-0400)
;;           By: Barath Ramesh
;;     Update #: 5
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(load "auctex.el" nil t t)

(require 'auctex-latexmk)
(auctex-latexmk-setup)

;; (require 'auto-complete-auctex)

;; (require 'company-auctex)
;; (company-auctex-init)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(setq TeX-PDF-mode t)
(require 'tex)
(TeX-global-PDF-mode t)

;; Latex
(require 'latex-extra)
(add-hook 'LaTeX-mode-hook #'latex-extra-mode)

(require 'latex-math-preview)
(autoload 'latex-math-preview-expression "latex-math-preview" nil t)
(autoload 'latex-math-preview-insert-symbol "latex-math-preview" nil t)
(autoload 'latex-math-preview-save-image-file "latex-math-preview" nil t)
(autoload 'latex-math-preview-beamer-frame "latex-math-preview" nil t)

(require 'latex-pretty-symbols)

(setq latex-preview-pane-enable t)

;;fill paragraph
;; (afp-setup-recommended-hooks)
(add-hook 'tex-mode #'aggressive-fill-paragraph-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; tex_utils_settings.el ends here
