;;; auto_header_options.el ---
;;
;; Filename: auto_header_options.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 19:07:33 2016 (-0400)
;; Version:
;; Last-Updated: Sat Jun 11 19:10:27 2016 (-0400)
;;           By: Barath Ramesh
;;     Update #: 3
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;; To have Emacs update file headers automatically whenever you save a
;; file, put this in your init file (~/.emacs):
;;
(autoload 'auto-update-file-header "header2")
(add-hook 'write-file-hooks 'auto-update-file-header)
;;
;; To have Emacs add a file header whenever you create a new file in
;; some mode, put this in your init file (~/.emacs):
;;
(autoload 'auto-make-header "header2")

;;header2
(setq make-header-hook '(
			 header-title
			 header-blank
			 header-file-name
			 header-description
			 ;;header-status
			 header-author
			 header-maintainer
			 ;;header-copyright
			 header-creation-date
			 ;;header-rcs-id
			 header-version
			 ;;header-pkg-requires
			 ;;header-sccs
			 header-modification-date
			 header-modification-author
			 header-update-count
			 ;;header-url
			 ;;header-doc-url
			 ;;header-keywords
			 ;;header-compatibility
			 header-blank
			 ;;header-lib-requires
			 header-end-line
			 ;;header-commentary
			 ;;header-blank
			 ;;header-blank
			 ;;header-blank
			 ;;header-end-line
			 ;;header-history
			 ;;header-blank
			 ;;header-blank
			 ;; header-rcs-log
			 ;;header-end-line
			 ;;header-free-software
			 header-code
			 header-eof
			 ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; auto_header_options.el ends here
