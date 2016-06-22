;;; make_options.el ---
;;
;; Filename: make_options.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 19:02:07 2016 (-0400)
;; Version:
;; Last-Updated:
;;           By:
;;     Update #: 1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; make_options.el ends here
