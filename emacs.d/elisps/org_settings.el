;;; org_settings.el ---
;;
;; Filename: org_settings.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 18:49:25 2016 (-0400)
;; Version:
;; Last-Updated: Sat Jun 11 19:37:43 2016 (-0400)
;;           By: Barath Ramesh
;;     Update #: 4
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(setq org-log-done t
      org-todo-keywords '((sequence "TODO" "INPROGRESS" "DONE"))
      org-todo-keyword-faces '(("INPROGRESS" . (:foreground "blue" :weight bold))))
(add-hook 'org-mode-hook
	  (lambda ()
	    (flyspell-mode)))
(add-hook 'org-mode-hook
	  (lambda ()
	    (writegood-mode)))

;;org-agenda
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-show-log t
      org-agenda-todo-ignore-scheduled t
      org-agenda-todo-ignore-deadlines t)
(setq org-agenda-files (list "~/Dropbox/org/personal.org"
			     "~/Dropbox/org/groupon.org"))

;;org-habit
(require 'org)
(require 'org-install)
(require 'org-habit)
(add-to-list 'org-modules "org-habit")
(setq org-habit-preceding-days 7
      org-habit-following-days 1
      org-habit-graph-column 80
      org-habit-show-habits-only-for-today t
      org-habit-show-all-today t)


;; active Babel languages

(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (org . t)
   (ditaa . t)
   (latex . t)
   (dot . t)
   (emacs-lisp . t)
   (gnuplot . t)
   (screen . nil)
   (sql . nil)
   (sqlite . t)))


(setq org-confirm-babel-evaluate nil)
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)
(add-hook 'org-mode-hook 'org-display-inline-images)

;; add additional languages with '((language . t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; org_settings.el ends here
