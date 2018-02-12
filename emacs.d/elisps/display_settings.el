;;; display_settings.el ---
;;
;; Filename: display_settings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 18:52:50 2016 (-0400)
;; Version:
;; Last-Updated: Sat Jan 20 19:50:17 2018 (-0500)
;;           By: Barath Ramesh
;;     Update #: 15
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;;Column number mode, column rule
(setq column-number-mode t)
(setq column-enforce-mode t)
(setq column-enforce-column 80)

;; line number mode
(global-linum-mode 1)
(add-hook 'nlinum-mode-hook
	  (lambda ()
	    (setq nlinum--width
		  (length (number-to-string
			   (count-lines (point-min) (point-max)))))))


;;Themes
;; (load-theme 'tangotango t)
;; (set-foreground-color "#dcdccc")
;; (set-background-color "#2e3436")

;; (add-hook 'after-init-hook
;;    (lambda () (load-theme 'cyberpunk t)))


;; (load-theme 'zen-and-art t)
(load-theme 'sanityinc-tomorrow-night t)

;; Add proper word wrapping
(global-visual-line-mode t)

(set-cursor-color "#eeeee0")

(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

;; Paranthesis matching
(require 'paren)
(show-paren-mode t)
(defun lispy-parens ()
  "Setup parens display for lisp modes"
  (setq show-paren-delay 0)
  (setq show-paren-style 'parenthesis)
  (make-variable-buffer-local 'show-paren-mode)
  (show-paren-mode 1)
  (set-face-background 'show-paren-match-face (face-background 'default))
  (if (boundp 'font-lock-comment-face)
      (set-face-foreground 'show-paren-match-face
			   (face-foreground 'font-lock-comment-face))
    (set-face-foreground 'show-paren-match-face
			 (face-foreground 'default)))
  (set-face-attribute 'show-paren-match-face nil :weight 'extra-bold))
(set-face-background 'show-paren-match (face-background 'default))
(set-face-foreground 'show-paren-match "#def")
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)

(defadvice show-paren-function
    (after show-matching-paren-offscreen activate)
  "If the matching paren is offscreen, show the matching line in the
	echo area. Has no effect if the character before point is not of
	the syntax class ')'."
  (interactive)
  (let* ((cb (char-before (point)))
	 (matching-text (and cb
			     (char-equal (char-syntax cb) ?\) )
			     (blink-matching-open))))
    (when matching-text (message matching-text))))


;; text wrap
(add-hook 'text-mode-hook 'auto-fill-mode)
(setq-default fill-column 64)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; display_settings.el ends here
