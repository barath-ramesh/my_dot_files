;;; package_management.el ---
;;
;; Filename: package_management.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 08:22:48 2016 (-0400)
;; Version:
;; Last-Updated: Tue Jun 21 01:01:23 2016 (-0400)
;;           By: Barath Ramesh
;;     Update #: 34
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;; written based of http://www.aaronbedra.com/emacs.d/
package-enable-at-startup
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
			      auto-complete-clang
			      auto-package-update
			      ac-slime
			      ac-etags
			      auctex-latexmk
			      auto-complete-auctex
			      auto-complete
			      auto-complete-exuberant-ctags
			      autofit-frame
			      autopair
			      base16-theme
			      bookmark+
			      c-eldoc
			      clojure-mode
			      cmake-mode
			      cmake-ide
			      cmake-font-lock
			      cmake-project
			      cmds-menu
			      ;;cpputils-cmake
			      ;;clojure-test-mode
			      coffee-mode
			      column-enforce-mode
			      color-theme-sanityinc-tomorrow
			      company
			      company-auctex
			      company-anaconda
			      company-irony
			      crux
			      csharp-mode
			      ctags
			      cuda-mode
			      cyberpunk-theme
			      dired+
			      dired-hacks-utils
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
			      fit-frame
			      frame-fns
			      flycheck
			      flymake-cursor
			      flyparens
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
			      help+
			      highlight
			      htmlize
			      image-dired
			      info+
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
			      menu-bar+
			      misc-cmds
			      misc-fns
			      monokai-theme
			      multi-term
			      naked
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
			      pp+
			      puppet-mode
			      restclient
			      rtags
			      rvm
			      scala-mode
			      second-sel
			      smart-mode-line
			      smart-mode-line-powerline-theme
			      smex
			      sml-mode
			      solarized-theme
			      spotify
			      srefactor
			      strings
			      subr+
			      tangotango-theme
			      telephone-line
			      thingatpt+
			      twilight-theme
			      web-mode
			      whitespace-cleanup-mode
			      wid-edit+
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

;; auto-package-update
(auto-package-update-maybe)
(auto-package-update-at-time "03:00")
(setq auto-package-update-delete-old-versions t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; package_management.el ends here
