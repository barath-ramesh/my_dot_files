;;; vhdl_options.el ---
;;
;; Filename: vhdl_options.el
;; Description:
;; Author: Barath Ramesh
;; Maintainer:
;; Created: Sat Jun 11 19:04:55 2016 (-0400)
;; Version:
;; Last-Updated:
;;           By:
;;     Update #: 3
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

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

(add-hook 'vhdl-mode (setq vhdl-electric-mode t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; vhdl_options.el ends here
