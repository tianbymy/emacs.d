;; Set Home directory

;; Set Load Path
;; All Confiuration files are in yoyo-require packages
(setq load-path (cons "~/.emacs.d/" load-path))

(require 'yoyo-require)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(git-baseline-alist (quote (("e:/git_cd/vplat/" . "master"))) t)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil)
 '(w3m-antenna-sites (quote (("http://planet.emacsen.org/" "Planet Emacsen" nil) ("file:///cygdrive/d/emacs-23.1/home/Muse/public_html/Lisp.html" "Lisp" nil)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
