;; .emacs ---
;;
;; Filename: .emacs
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Fri Jul 17 15:33:56 2015 (-0400)
;; Version:
;; Last-Updated: Sat Jun 11 07:41:03 2016 (-0400)
;;           By: Barath Ramesh
;;     Update #: 521
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;; written based of http://www.aaronbedra.com/emacs.d/
package-enable-at-startup
;;User details
(setq user-full-name "")
(setq user-mail-address "")

;; DO not close emacs accidentaly
(setq kill-emacs-query-functions
      (list (function (lambda ()
			(ding)
			(y-or-n-p "Really quit? ")))))


;;Environment
(setenv "PATH" (concat "/usr/local/bin:/opt/local/bin:/usr/bin:/bin" (getenv "PATH")))
(require 'cl)

;;Package Management
(load "package")
(package-initialize)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; and the old elpa repo
(add-to-list 'package-archives '("elpa-old" . "http://tromey.com/elpa/"))

;; (setq package-archive-enable-alist '(("melpa" deft magit)))

;;Define default packages
(defvar ~/.emacs.d/packages '(ac-c-headers
			      ac-math
			      aggressive-fill-paragraph
			      aggressive-indent
			      auto-complete-auctex
			      auto-complete-c-headers
			      auto-package-update
			      ac-slime
			      ac-etags
			      auctex-latexmk
			      auto-complete-auctex
			      auto-complete
			      auto-complete-exuberant-ctags
			      autopair
			      base16-theme
			      c-eldoc
			      clojure-mode
			      cmake-mode
			      cmake-ide
			      cmake-font-lock
			      cmake-project
			      ;;cpputils-cmake
			      ;;clojure-test-mode
			      coffee-mode
			      column-enforce-mode
			      color-theme-sanityinc-tomorrow
			      company
			      company-auctex
			      company-irony
			      crux
			      csharp-mode
			      ctags
			      cuda-mode
			      cyberpunk-theme
			      ;;doxymacs
			      deft
			      eldoc-eval
			      eldoc-extension
			      electric-case
			      electric-spacing
			      emms
			      enclose
			      erlang
			      ess
			      etags
			      etags-select
			      etags-table
			      feature-mode
			      flycheck
			      flymake-cursor
			      gist
			      gnuplot
			      gnuplot-mode
			      go-mode
			      goto-chg
			      graphviz-dot-mode
			      haml-mode
			      haskell-mode
			      header2
			      helm-spotify
			      htmlize
			      irony
			      latex-extra
			      latex-math-preview
			      latex-pretty-symbols
			      latex-preview-pane
			      lice
			      magit
			      matlab-mode
			      markdown-mode
			      marmalade
			      monokai-theme
			      multi-term
			      nlinum
			      nodejs-repl
			      ;;nrepl
			      o-blog
			      opencl-mode
			      openwith
			      org
			      org-journal
			      paredit
			      pianobar
			      php-mode
			      powerline
			      smart-mode-line
			      puppet-mode
			      restclient
			      ;;rtags
			      rvm
			      scala-mode
			      smex
			      sml-mode
			      solarized-theme
			      spotify
			      srefactor
			      tangotango-theme
			      telephone-line
			      twilight-theme
			      web-mode
			      whitespace-cleanup-mode
			      writegood-mode
			      xcscope
			      yafolding
			      yaml-mode
			      yasnippet
			      zen-and-art-theme
			      )
  "Default packages")

;;Install default packages
(defun ~/.emacs.d/packages-installed-p ()
  (loop for pkg in ~/.emacs.d/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (~/.emacs.d/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg ~/.emacs.d/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; From http://draketo.de/light/english/emacs/babcore
;; Make sure a package is installed
(defun package-require (package)
  "Install a PACKAGE unless it is already installed
or a feature with the same name is already active.

Usage: (package-require 'package)"
					; try to activate the package with at least version 0.
  (package-activate package '(0))
					; try to just require the package. Maybe the user has it in his local config
  (condition-case nil
      (require package)
					; if we cannot require it, it does not exist, yet. So install it.
    (error (package-install package))))

;; Initialize installed packages
;; (package-initialize)
;; package init not needed, since it is done anyway in emacs 24 after reading the init
;; but we have to load the list of available packages
(package-refresh-contents)


;;cuda-mode
;; (add-to-list 'load-path "~/.emacs.d/lisps/")
;; (require 'cuda-mode)

;; opencl-mode
;; (add-to-list 'load-path "/home/ramesh/.emacs.d/lisps/")

;;(require 'opencl-mode)
;; (add-to-list 'auto-mode-alist '("\\.cl\\'" . opencl-mode))

;;Start-up options

;;Splash Screens
(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

;;Scroll bar, Tool bar, Menu bar, Blinking cursor, display time,..
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(blink-cursor-mode -1)
(display-time)
;;(toggle-frame-fullscreen)

;;Marking text
(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

;;Display Settings
;; (when window-system
;;   (setq frame-title-format '(buffer-file-name "%f" ("%b")))
;;   (set-face-attribute 'default nil
;;        :family "DejaVu Sans Mono"
;;        :height 124
;;        :weight 'normal
;;        :width 'normal)

;;   (when (functionp 'set-fontset-font)
;;     (set-fontset-font "fontset-default"
;;        'unicode
;;        (font-spec :family "DejaVu Sans Mono"
;;       :width 'normal
;;       :size 12.4
;;       :weight 'normal))))

(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

;;Indentation
(setq tab-width 2
      indent-tabs-mode nil)

;;Backup files
(setq make-backup-files nil)

;;Yes and No
(defalias 'yes-or-no-p 'y-or-n-p)

;;Key bindings
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
(show-paren-mode t)

;;Settings, enable logging when tasks are complete
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

;;Smex
(setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;;Ido mode
;;Ido mode settings
;; do not confirm a new file or buffer
(setq confirm-nonexistent-file-or-buffer nil)
(require 'ido)
(ido-mode 1)
(ido-everywhere 1)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
(setq ido-enable-tramp-completion nil)
(setq ido-enable-last-directory-history nil)
(setq ido-confirm-unique-completion nil) ;; wait for RET, even for unique?
(setq ido-show-dot-for-dired t) ;; put . as the first item
(setq ido-use-filename-at-point t) ;; prefer file names near point

(ido-mode t)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)

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

;;Temporary file management
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;;autopair-mode
(require 'autopair)
(autopair-global-mode)

;;Power lisp
(setq lisp-modes '(lisp-mode
		   emacs-lisp-mode
		   common-lisp-mode
		   scheme-mode
		   clojure-mode))

(defvar lisp-power-map (make-keymap))
(define-minor-mode lisp-power-mode "Fix keybindings; add power."
  :lighter " (power)"
  :keymap lisp-power-map
  (paredit-mode t))
(define-key lisp-power-map [delete] 'paredit-forward-delete)
(define-key lisp-power-map [backspace] 'paredit-backward-delete)

(defun abedra/engage-lisp-power ()
  (lisp-power-mode t))

(dolist (mode lisp-modes)
  (add-hook (intern (format "%s-hook" mode))
	    #'abedra/engage-lisp-power))

(setq inferior-lisp-program "clisp")
(setq scheme-program-name "racket")

;;auto-complete
;; (require 'auto-complete-config)
;; (ac-config-default)
;; (auto-complete-mode 1)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
;; (global-auto-complete-mode 1)
;; (setq ac-auto-start 2)
;; (define-key ac-completing-map (kbd "\C-n") 'ac-next)
;; (define-key ac-completing-map (kbd "\C-p") 'ac-previous)


(require 'ac-math)
(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `latex-mode`

(defun ac-LaTeX-mode-setup () ; add ac-sources to default ac-sources
  (setq ac-sources
	(append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
		ac-sources))
  )
(add-hook 'LaTeX-mode-hook 'ac-LaTeX-mode-setup)
;; (global-auto-complete-mode t)

(setq ac-math-unicode-in-math-p t)
;; dirty fix for having AC everywhere

;;Indentation and buffer cleanup
(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))

(defun cleanup-region (beg end)
  "Remove tmux artifacts from region."
  (interactive "r")
  (dolist (re '("\\\\│\·*\n" "\W*│\·*"))
    (replace-regexp re "" nil beg end)))

(global-set-key (kbd "C-x M-t") 'cleanup-region)
(global-set-key (kbd "C-c n") 'cleanup-buffer)
(global-set-key (kbd "C-x C-s") (lambda () (interactive) (whitespace-cleanup) (save-buffer)))

;; (setq-default show-trailing-whitespace t)
(add-hook 'term-mode (setq show-trailing-whitespace nil))
(add-hook 'term-mode-hook (lambda()
			    (yas-minor-mode -1)))

;;flyspell
(setq flyspell-issue-welcome-flag nil)
(if (eq system-type 'darwin)
    (setq-default ispell-program-name "/usr/local/bin/aspell")
  (setq-default ispell-program-name "/usr/bin/aspell"))
(setq-default ispell-list-command "list")

;;Language Hooks
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

;;matlab mode in emacs
(require 'matlab-load)

;;Themes
;; (load-theme 'tangotango t)
;; (set-foreground-color "#dcdccc")
;; (set-background-color "#2e3436")

;; (add-hook 'after-init-hook
;;    (lambda () (load-theme 'cyberpunk t)))


;; (load-theme 'zen-and-art t)
(load-theme 'sanityinc-tomorrow-night t)

;;EMMS player, not working yet
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
;; (emms-all)
;; (emms-default-players)
;; (setq emms-lastfm-client-username "")
;; (setq emms-lastfm-client-api-key "")
;; (setq emms-lastfm-client-api-secret-key "")


;;Locate Makefile in nearest directory and compile
(defun compile-parent (command)
  (interactive
   (let* ((make-directory (locate-dominating-file (buffer-file-name)
						  "Makefile"))
	  (command (concat "make -k -j8 -C "
			   (shell-quote-argument make-directory))))
     (list (compilation-read-command command))))
  (compile command))

(global-set-key "\C-cm" 'compile-parent)

;; (setq compilation-filenames '("Makefile" "makefile"))

;; (defun get-nearest-compilation-file ()
;;   "Search for the compilation file traversing up the directory tree."
;;   (let ((dir default-directory)
;;      (parent-dir (file-name-directory (directory-file-name default-directory)))
;;      (nearest-compilation-file 'nil))
;;     (while (and (not (string= dir parent-dir))
;;              (not nearest-compilation-file))
;;       (dolist (filename compilation-filenames)
;;      (setq file-path (concat dir filename))
;;      (when (file-readable-p file-path)
;;        (setq nearest-compilation-file file-path)))
;;       (setq dir parent-dir
;;          parent-dir (file-name-directory
;;                      (directory-file-name parent-dir))))
;;     file-name-directory))

;; (defun get-above-makefile () (expand-file-name
;;         "Makefile" (loop as d = default-directory then (expand-file-name
;;         ".." d) if (file-exists-p (expand-file-name "Makefile" d)) return
;;         (shell-quote-argument d))))

;; ;; bind compiling with get-above-makefile to f5
;; (global-set-key "\C-cm"
;;              (lambda () (interactive)
;;                (compile (format
;;                          "make -f %s"
;;                          (get-above-makefile)))))


;; Doxygen for emacs
;; (add-to-list 'load-path "~/.emacs.d/doxymacs/")
;; (require 'doxymacs)
;; (add-hook 'c-mode-common-hook 'doxymacs-mode)


;;Cscope
(require 'xcscope)

(cscope-setup)
(cscope-minor-mode 1)
(define-key global-map [(control f3)]  'cscope-set-initial-directory)
(define-key global-map [(control f4)]  'cscope-unset-initial-directory)
(define-key global-map [(control f5)]  'cscope-find-this-symbol)
(define-key global-map [(control f6)]  'cscope-find-global-definition)
(define-key global-map [(control f7)]
  'cscope-find-global-definition-no-prompting)
(define-key global-map [(control f8)]  'cscope-pop-mark)
(define-key global-map [(control f9)]  'cscope-history-forward-line)
(define-key global-map [(control f10)] 'cscope-history-forward-file)
(define-key global-map [(control f11)] 'cscope-history-backward-line)
(define-key global-map [(control f12)] 'cscope-history-backward-file)
(define-key global-map [(meta f9)]  'cscope-display-buffer)
(define-key global-map [(meta f10)] 'cscope-display-buffer-toggle)

;;CHREC license
;; ((nil
;;   (lice:default-license . "chrec")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-etags-requires 1)
 '(ansi-color-names-vector
   ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "c29e00a62634efa10d45cf110f12574831b2599367f2169f553a338bac232fa3" "a802c77b818597cc90e10d56e5b66945c57776f036482a033866f5f506257bca" "868f73b5cf78e72ca2402e1d48675e49cc9a9619c5544af7bf216515d22b58e7" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "71ecffba18621354a1be303687f33b84788e13f40141580fa81e7840752d31bf" default)))
 '(display-time-mode t)
 '(fci-rule-color "#383838")
 '(font-use-system-font t)
 '(safe-local-variable-values (quote ((lice:default-license . "chrec"))))
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(vhdl-electric-mode t t)
 '(vhdl-model-alist
   (quote
    (("Example Model" "<label> : process (<clock>, <reset>)
begin  -- process <label>
  if <reset> = '1' then  -- asynchronous reset (active high)
    <cursor>
  elsif <clock>'event and <clock> = '1' then  -- rising clock edge
    if <enable> = '1' then  -- synchronous load

    end if;
  end if;
end process <label>;" "e" ""))))
 '(vhdl-reset-active-high t))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:family "Droid Sans Mono" :foundry "unknown" :slant normal :weight normal :height 124 :width normal)))))

;;Comment styles
(add-hook 'c++-mode-hook (lambda () (setq comment-start "/*"
					  comment-end   "*/")))
(add-hook 'cuda-mode-hook (lambda () (setq comment-start "/*"
					   comment-end   "*/")))
(add-hook 'c-mode-hook (setq comment-style 'multi-line))
;;(add-hook 'cuda-mode-hook (setq comment-style 'multi-line))

;;auto-header
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
(add-hook 'emacs-lisp-mode-hook 'auto-make-header)
(add-hook 'cc-mode-common-hook  'auto-make-header)
(add-hook 'prog-mode-hook       'auto-make-header)
(add-hook 'cuda-mode-hook       'auto-make-header)

;;opencl-mode
;; (add-to-list 'load-path "~/.emacs.d/lisp")
;; (require 'opencl-mode)
;; (add-to-list 'auto-mode-alist '("\\.cl\\'" . opencl-mode))


;;Pandora
;; (autoload 'pianobar "pianobar" nil t)
;; (setq pianobar-username "")
;; (setq pianobar-password "")
;; (setq pianobar-station "5")
;; (global-set-key (kbd "s-m m") 'pianobar)
;; (global-set-key (kbd "s-m n") 'pianobar-next-song)
;; (global-set-key (kbd "s-m c") 'pianobar-change-station)
;; (global-set-key (kbd "s-m l") 'pianobar-love-current-song)
;; (global-set-key (kbd "s-m h") 'pianobar-ban-current-song)
;; (global-set-key (kbd "s-m p") 'pianobar-play-or-pause)

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

;;lice
(setq lice:default-license "chrec-2.0")

;;magit commit
(add-hook 'text-mode-hook
	  (lambda ()
	    (flyspell-mode)))


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

;; multi term
;; Buggy needs fixing
(setq multi-term-program "/bin/zsh")

;; whitespace cleanup
(global-whitespace-cleanup-mode t)
(add-hook 'before-save-hook 'whitespace-cleanup)

(add-hook 'vhdl-mode (setq vhdl-electric-mode t))

;; From draketo.de/light/english/emacs/babcor

;; Flymake: On the fly syntax checking

;; stronger error display
(defface flymake-message-face
  '((((class color) (background light)) (:foreground "#b2dfff"))
    (((class color) (background dark))  (:foreground "#b2dfff")))
  "Flymake message face")

;; show the flymake errors in the minibuffer
(package-require 'flymake-cursor)

;; use allout minor mode to have outlining everywhere.
(allout-mode)

;; syntax highlighting everywhere
(global-font-lock-mode 1)

;; Add proper word wrapping
(global-visual-line-mode t)

;; go to the last change
(package-require 'goto-chg)
(global-set-key [(control .)] 'goto-last-change)
					; M-. can conflict with etags tag search. But C-. can get overwritten
					; by flyspell-auto-correct-word. And goto-last-change needs a really
					; fast key.
;; (global-set-key [(meta .)] 'goto-last-change)

;; Highlight TODO and FIXME in comments
(package-require 'fic-ext-mode)
(defun add-something-to-mode-hooks (mode-list something)
  "helper function to add a callback to multiple hooks"
  (dolist (mode mode-list)
    (add-hook (intern (concat (symbol-name mode) "-mode-hook")) something)))

(add-something-to-mode-hooks '(cuda c c++ tcl emacs-lisp python text
				    markdown latex vhdl) 'fic-ext-mode)

;; Spotify emacs client
(global-set-key (kbd "s-p") #'spotify-playpause)
(global-set-key (kbd "s-n") #'spotify-next)

;; (spotify-enable-song-notifications)

;; electric-case mode
(require 'electric-case)
(add-hook 'c-mode-hook 'electric-case-mode)
(add-hook 'c++-mode-hook 'electric-case-mode)
(add-hook 'cuda-mode-hook 'electric-case-mode)
(add-hook 'opencl-mode-hook 'electric-case-mode)

;; enclose
;; (require 'enclose)
;;(enclose-global-mode)

;; electric-space
;; (require 'electric-spacing)
;; (add-hook 'c-mode-hook 'electric-spacing-mode)
;; (add-hook 'c++-mode-hook 'electric-spacing-mode)
;; (add-hook 'cuda-mode-hook 'electric-spacing-mode)
;; (add-hook 'opencl-mode-hook 'electric-spacing-mode)

;; cmake
(require 'cmake-mode)
;; (require 'rtags)
(cmake-ide-setup)
(autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'cmake-font-lock-activate)

;; flychek mode
(global-flycheck-mode)

;;Replace all freakin' ^M chars in the current buffer
(fset 'replace-ctrlms
      [escape ?< escape ?% ?\C-q ?\C-m return ?\C-q ?\C-j return ?!])
(global-set-key "\C-c\C-m" 'replace-ctrlms)


;; tags
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

;; eldoc
(require 'c-eldoc)
;; (add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
;; (add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode)
;; (add-hook 'cuda-mode-hook 'c-turn-on-eldoc-mode)
(require 'eldoc-extension)

(require 'eldoc-eval)
;; (autoload 'eldoc-in-minibuffer-mode "eldoc-eval")
;; (eldoc-in-minibuffer-mode 1)

;; CEDET tools
;; (global-ede-mode 1)
(require 'semantic/sb)
;; (semantic-mode 1)
(require 'semantic/bovine/gcc)

(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))

(add-hook 'c-mode-common-hook 'my-cedet-hook)

(defun my-c-mode-cedet-hook ()
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert))
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

(defun my-c-mode-cedet-hook ()
  (add-to-list 'ac-sources 'ac-source-gtags)
  (add-to-list 'ac-sources 'ac-source-semantic))
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)
;;(semantic-add-system-include "~/ti_5_5/include/" 'c++-mode)


(require 'srefactor)
(require 'srefactor-lisp)

(define-key c-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
(define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
(global-set-key (kbd "M-RET o") 'srefactor-lisp-one-line)
(global-set-key (kbd "M-RET m") 'srefactor-lisp-format-sexp)
(global-set-key (kbd "M-RET d") 'srefactor-lisp-format-defun)
(global-set-key (kbd "M-RET b") 'srefactor-lisp-format-buffer)


(defun my:add-semantic-to-autocomplete ()
  (add-to-list 'ac-sources 'ac-source-semantic)
  )

(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
(add-hook 'c++-mode-common-hook 'my:add-semantic-to-autocomplete)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; ac-c-headers
(require 'ac-c-headers)
(add-hook 'c-mode-hook
	  (lambda ()
	    (add-to-list 'ac-sources 'ac-source-c-headers)
	    (add-to-list 'ac-sources 'ac-source-c-header-symbols t)))

;;auto-complete-headres

(defun my:ac-c-headers-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))

(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode-hook 'my:ac-c-headers-init)

;; auctex
(load "auctex.el" nil t t)

(require 'auctex-latexmk)
(auctex-latexmk-setup)

(require 'auto-complete-auctex)

(require 'company-auctex)
(company-auctex-init)

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

					; Set cursor color to white
(set-cursor-color "#eeeee0")

;;fill paragraph
;; (afp-setup-recommended-hooks)
(add-hook 'tex-mode #'aggressive-fill-paragraph-mode)

;; Playing with fonts
;; (set-fontset-font "fontset-default" 'gb18030 '("dejavu sans mono" . “unicode-bmp”))

;; crux - NOT WORKING
;; (global-set-key [remap move-beginning-of-line] 'crux-move-beginning-of-line)
;; (global-set-key (kbd "C-c o") 'crux-open-with)
;; (global-set-key [(shift return)] 'crux-smart-open-line)
;; (global-set-key (kbd "s-r") 'crux-recentf-ido-find-file)
;; (global-set-key (kbd "C-<backspace>") 'crux-kill-line-backwards)
;; (global-set-key [remap kill-whole-line] 'crux-kill-whole-line)


;; openwith
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

;; Volume control
(global-set-key (kbd "M-,")     'emms-volume-lower)
(global-set-key (kbd "M-.")     'emms-volume-raise)

;; Aggressive indent mode
;; (global-aggressive-indent-mode 1)
;; (add-to-list 'aggressive-indent-excluded-modes 'html-mode)

;; (add-to-list
;;  'aggressive-indent-dont-indent-if
;;  '(and (derived-mode-p 'c++-mode 'c-mode)
;;        (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
;;                         (thing-at-point 'line)))))

;; Company mode
(global-company-mode 1)
(setq company-minimum-prefix-length 1)
(setq company-selection-wrap-around t)
;; (eval-after-load 'company
;;   '(progn
;;      (define-key company-active-map (kbd "<return>") nil)
;;      (define-key company-active-map (kbd "RET") nil)
;;      (define-key company-active-map (kbd "C-SPC") 'company-complete-selection)
;;      (define-key company-active-map (kbd "TAB") 'company-select-next)
;;      (define-key company-active-map [tab] 'company-select-next)))

;; irony mode, needs revisit

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
;; (add-hook 'cuda-mode-hook 'irony-mode)
(add-hook 'opencl-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
;; (defun my-irony-mode-hook ()
;;   (define-key irony-mode-map [remap completion-at-point]
;;     'irony-completion-at-point-async)
;;   (define-key irony-mode-map [remap complete-symbol]
;;     'irony-completion-at-point-async))
;; (add-hook 'irony-mode-hook 'my-irony-mode-hook)
;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(defun my-ac-irony-setup ()
  ;; be cautious, if yas is not enabled before (auto-complete-mode 1), overlays
  ;; *may* persist after an expansion.
  (yas-minor-mode 1)
  (auto-complete-mode -1)
  (add-to-list 'ac-sources 'ac-source-irony)
  (define-key irony-mode-map (kbd "M-RET") 'ac-complete-irony-async))

(add-hook 'irony-mode-hook 'my-ac-irony-setup)


;; Powerline theme
;; These two lines are just examples
;; (setq powerline-arrow-shape 'curve)
;; (setq powerline-default-separator-dir '(right . left))
;; ;; These two lines you really need.
;; (setq sml/theme 'powerline)
;; (sml/setup)



;; emacs-powerline
(add-to-list 'load-path "~/.emacs.d/lisps/emacs-powerline")
(require 'powerline)

(setq powerline-arrow-shape 'arrow)   ;; the default
(setq powerline-arrow-shape 'curve)   ;; give your mode-line curves
(setq powerline-arrow-shape 'arrow14) ;; best for small fonts

(custom-set-faces
 '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))

(setq powerline-color1 "grey22")
(setq powerline-color2 "grey40")

(set-face-attribute 'mode-line nil
		 :foreground "black"
		 :background "orange"
		 :box nil)


;; telephone line
;; (require 'telephone-line)
;; (telephone-line-mode 1)

;; auto-package-update
(auto-package-update-maybe)
(auto-package-update-at-time "03:00")
(setq auto-package-update-delete-old-versions t)

;;; .emacs ends here
