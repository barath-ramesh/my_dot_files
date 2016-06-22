;;; emms_settings.el ---
;;
;; Filename: emms_settings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 19:00:56 2016 (-0400)
;; Version:
;; Last-Updated: Sat Jun 11 19:01:03 2016 (-0400)
;;           By: Barath Ramesh
;;     Update #: 2
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;;(emms-default-players)
(setq exec-path (append exec-path '("/usr/bin")))
;;(add-to-list 'load-path "~/.emacs.d/site-lisp/emms/lisp")
(require 'emms-setup)
(require 'emms-player-mplayer)
(emms-standard)
(emms-default-players)
(emms-all)
(define-emms-simple-player mplayer '(file url)
  (regexp-opt '(".ogg" ".mp3" ".wav" ".mpg" ".mpeg" ".wmv" ".wma"
		".mov" ".avi" ".divx" ".ogm" ".asf" ".mkv" "http://" "mms://"
		".rm" ".rmvb" ".mp4" ".flac" ".vob" ".m4a" ".flv" ".ogv" ".pls"))
  "mplayer" "-slave" "-quiet" "-really-quiet" "-fullscreen")

(global-set-key (kbd "M-,")     'emms-volume-lower)
(global-set-key (kbd "M-.")     'emms-volume-raise)

(require 'emms-setup)
(emms-all)
(emms-default-players)
(setq emms-lastfm-client-username "")
(setq emms-lastfm-client-api-key "")
(setq emms-lastfm-client-api-secret-key "")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; emms_settings.el ends here
