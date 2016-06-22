;;; key_bindings.el ---
;;
;; Filename: key_bindings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 18:48:31 2016 (-0400)
;; Version:
;; Last-Updated: Tue Jun 21 19:27:59 2016 (-0400)
;;           By: Barath Ramesh
;;     Update #: 6
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key "\C-xq" 'comment-or-uncomment-region)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-c C-k") 'compile)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y")
(global-set-key "\C-cc" "\C-a\C- \C-n\M-w\C-y")
(global-set-key "\C-cg" 'goto-line)
(global-set-key "\C-cF" 'rgrep)
(global-set-key "\C-cf" 'grep)
(global-set-key [f4] 'rename-buffer)
(global-set-key [f3] 'multi-term)
;;(global-set-key "\C-cm" 'compile)
(global-set-key "\C-cb" 'comment-box)

;;Misc
(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)

;; Spotify emacs client
(global-set-key (kbd "s-p") #'spotify-playpause)
(global-set-key (kbd "s-n") #'spotify-next)

;; Volume control
(global-set-key (kbd "s-,")     'emms-volume-lower)
(global-set-key (kbd "s-.")     'emms-volume-raise)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; key_bindings.el ends here
