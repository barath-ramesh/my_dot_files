;; .emacs ---
;;
;; Filename: .emacs
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Fri Jul 17 15:33:56 2015 (-0400)
;; Version:
;; Last-Updated: Mon Feb 12 11:06:22 2018 (-0500)
;;           By: Barath Ramesh
;;     Update #: 800
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;;User details

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq user-full-name "Barath Ramesh")
(setq user-mail-address "ramesh@hcs.ufl.edu")

;; DO not close emacs accidentaly
(setq kill-emacs-query-functions
      (list (function (lambda ()
			(ding)
			(y-or-n-p "Really quit? ")))))

;;Environment
(setenv "PATH" (concat "/usr/local/bin:/opt/local/bin:/usr/bin:/bin" (getenv "PATH")))


;; What is this issue with julia-mode?
;; (add-to-list 'load-path "~/.emacs.d/elisps/")
;; (require 'julia-mode)

(load "~/.emacs.d/elisps/package_management")

(load "~/.emacs.d/elisps/startup_options")

(load "~/.emacs.d/elisps/display_settings")

;;Indentation
(setq tab-width 2
      indent-tabs-mode nil)

;;Backup files
(setq make-backup-files nil)

;;Yes and No
(defalias 'yes-or-no-p 'y-or-n-p)

;;Key bindings
(load "~/.emacs.d/elisps/key_bindings")

;;Settings, enable logging when tasks are complete
(load "~/.emacs.d/elisps/org_settings")

;;Smex
(setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;;Ido mode
(load "~/.emacs.d/elisps/ido_settings")

;;Temporary file management
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;;autopair-mode
(require 'autopair)
(autopair-global-mode)

;;Power lisp
(load "~/.emacs.d/elisps/power_lisp")

;;auto-complete
;; (load "~/.emacs.d/elisps/auto_complete_settings.el")

(load "~/.emacs.d/elisps/ac_misc")

;; buffer cleanup
(load "~/.emacs.d/elisps/buffer_cleanup")

;;flyspell
(load "~/.emacs.d/elisps/flyspell_options")

;;Language Hooks
(load "~/.emacs.d/elisps/lang_hooks")

;;matlab mode in emacs, replace one in melpa
;; (require 'matlab-load)
;; (load "~/.emacs.d/elisps/matlab_load")

;;EMMS player, not working yet
(load "~/.emacs.d/elisps/emms_settings")

;;Locate Makefile in nearest directory and compile
(load "~/.emacs.d/elisps/make_options")

;; Doxygen for emacs
;; (add-to-list 'load-path "~/.emacs.d/doxymacs/")
;; (require 'doxymacs)
;; (add-hook 'c-mode-common-hook 'doxymacs-mode)


;; Cscope
(load "~/.emacs.d/elisps/cscope_settings")

;; VHDL mode options, needs fixing
(load "~/.emacs.d/elisps/vhdl_options")

;;auto-header
(load "~/.emacs.d/elisps/auto_header_options")

;;opencl-mode
(require 'opencl-mode)
(add-to-list 'auto-mode-alist '("\\.cl\\'" . opencl-mode))

;;cuda-mode
;; (add-to-list 'load-path "~/.emacs.d/elisps/")
;; (require 'cuda-mode)

;;Pandora
;; (load "~/.emacs.d/elisps/pandora_settings.el")


;;lice
(setq lice:default-license "chrec-2.0")

;; multi term
;; Buggy needs fixing
(setq multi-term-program "/bin/zsh")

;; Flymake: On the fly syntax checking
(load "~/.emacs.d/elisps/flymake_options")

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


;; (spotify-enable-song-notifications)

;; enclose
;; (require 'enclose)
;;(enclose-global-mode)

;; cmake
;; (require 'cmake-mode)
;; (require 'rtags)
;; (cmake-ide-setup)
;; (autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
;; (add-hook 'cmake-mode-hook 'cmake-font-lock-activate)

;; flycheck mode
(global-flycheck-mode)
(put 'flycheck-clang-args 'safe-local-variable (lambda (xx) t))

;;Replace all freakin' ^M chars in the current buffer
(fset 'replace-ctrlms
      [escape ?< escape ?% ?\C-q ?\C-m return ?\C-q ?\C-j return ?!])
(global-set-key "\C-c\C-m" 'replace-ctrlms)

;; tags
;; (load "~/.emacs.d/elisps/tags_settings.el")

;; CEDET
;; (load "~/.emacs.d/elisps/cedet_options.el")

;; yasnippet
;; (require 'yasnippet)
;; (yas-global-mode 1)

;; tex, Rnw and auctex
(load "~/.emacs.d/elisps/tex_utils_settings")
(add-to-list 'load-path "~/.emacs.d/elisps/ess-knitr/")
(require 'ess-knitr)

;; ploymode
(load "~/.emacs.d/elisps/polymode_settings")
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
(load "~/.emacs.d/elisps/openwith_settings")

;; Aggressive indent mode
(global-aggressive-indent-mode 1)
(add-to-list 'aggressive-indent-excluded-modes 'html-mode)

(add-to-list
 'aggressive-indent-dont-indent-if
 '(and (derived-mode-p 'c++-mode 'c-mode)
       (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
			   (thing-at-point 'line)))))

;; Comapny and Irony for intellisense
(load "~/.emacs.d/elisps/irony_company_settings")

;; sml and powerline
(load "~/.emacs.d/elisps/sml_powerline")

;; Set fonts need to be set after sml
(load "~/.emacs.d/elisps/font_options")

;; flyparen needs fixing
;; (load "~/.emacs.d/elisps/flyparens_options")

;; rtags options
(load "~/.emacs.d/elisps/rtags_options")

;; multiple cursors
(require 'multiple-cursors)

;; auto-complete-clang
;; (load "~/.emacs.d/elisps/auto_complete_clang_settings")


;; Make TeX and RefTex aware of Snw and Rnw files
;; (setq reftex-file-extensions
;;       '(("Snw" "Rnw" "nw" "tex" ".tex" ".ltx") ("bib" ".bib")))
;; (setq TeX-file-extensions
;;       '("Snw" "Rnw" "nw" "tex" "sty" "cls" "ltx" "texi" "texinfo"))

;; ;; Lets you do 'C-c C-c Sweave' from your Rnw file
;; (defun emacsmate-add-Sweave ()
;;   (add-to-list 'TeX-command-list
;;	       '("Sweave" "R CMD Sweave %s"
;;		 TeX-run-command nil (latex-mode) :help "Run Sweave") t)
;;   (add-to-list 'TeX-command-list
;;	       '("LatexSweave" "%l %(mode) %s"
;;		 TeX-run-TeX nil (latex-mode) :help "Run Latex after Sweave") t)
;;   (setq TeX-command-default "Sweave"))

;; (add-hook 'Rnw-mode-hook 'emacsmate-add-Sweave)

;; To re-compile all packages after major emacs udpate
;; Has resulted in error: “Symbol's function is void: cl-struct-define”
;; Magit did not work due to above error
;; C-u 0 M-x byte-recompile-directory

;;; .emacs ends here
