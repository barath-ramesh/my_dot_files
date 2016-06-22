;;; openwith_settings.el ---
;;
;; Filename: openwith_settings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 19:21:16 2016 (-0400)
;; Version:
;; Last-Updated: Sat Jun 11 19:21:21 2016 (-0400)
;;           By: Barath Ramesh
;;     Update #: 1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(when (require 'openwith nil 'noerror)
  (setq openwith-associations
	(list
	 (list (openwith-make-extension-regexp
		'("mpg" "mpeg" "mp3" "mp4"
		  "avi" "wmv" "wav" "mov" "flv"
		  "ogm" "ogg" "mkv"))
	       "vlc"
	       '(file))
	 (list (openwith-make-extension-regexp
		'("xbm" "pbm" "pgm" "ppm" "pnm"
		  "png" "gif" "bmp" "tif" "jpeg" "jpg"))
	       "eog -f"
	       '(file))
	 (list (openwith-make-extension-regexp
		'("doc" "xls" "ppt" "odt" "ods" "odg" "odp"))
	       "libreoffice"
	       '(file))
	 '("\\.lyx" "lyx" (file))
	 '("\\.chm" "kchmviewer" (file))
	 (list (openwith-make-extension-regexp
		'("pdf" "ps" "ps.gz" "dvi"))
	       "okular"
	       '(file))
	 ))
  (openwith-mode 1))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; openwith_settings.el ends here
