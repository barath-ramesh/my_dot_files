;;; pandora_settings.el ---
;;
;; Filename: pandora_settings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 19:09:44 2016 (-0400)
;; Version:
;; Last-Updated: Sat Jun 11 19:09:54 2016 (-0400)
;;           By: Barath Ramesh
;;     Update #: 2
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(autoload 'pianobar "pianobar" nil t)
(setq pianobar-username "")
(setq pianobar-password "")
(setq pianobar-station "5")
(global-set-key (kbd "s-m m") 'pianobar)
(global-set-key (kbd "s-m n") 'pianobar-next-song)
(global-set-key (kbd "s-m c") 'pianobar-change-station)
(global-set-key (kbd "s-m l") 'pianobar-love-current-song)
(global-set-key (kbd "s-m h") 'pianobar-ban-current-song)
(global-set-key (kbd "s-m p") 'pianobar-play-or-pause)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; pandora_settings.el ends here
