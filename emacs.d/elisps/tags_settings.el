;;; tags_settings.el ---
;;
;; Filename: tags_settings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 19:15:52 2016 (-0400)
;; Version:
;; Last-Updated: Sat Jun 11 19:16:20 2016 (-0400)
;;           By: Barath Ramesh
;;     Update #: 1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(require 'ac-etags)

(eval-after-load "etags"
  '(progn
     (ac-etags-setup)))

(add-hook 'c-mode-common-hook 'ac-etags-ac-setup)
(add-hook 'c++-mode-common-hook 'ac-etags-ac-setup)
(add-hook 'cuda-mode-common-hook 'ac-etags-ac-setup)
(add-hook 'ruby-mode-common-hook 'ac-etags-ac-setup)


(require 'ctags)

(setq tags-revert-without-query t)
(global-set-key (kbd "<f7>") 'ctags-create-or-update-tags-table)
(global-set-key (kbd "M-.")  'ctags-search)

(global-set-key "\M-?" 'etags-select-find-tag-at-point)
(global-set-key "\M-." 'etags-select-find-tag)

(require 'auto-complete-exuberant-ctags)
(ac-exuberant-ctags-setup)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; tags_settings.el ends here
