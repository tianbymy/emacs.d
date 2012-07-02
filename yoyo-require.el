;; Load path
;; Move my useful lisps to .emacs.d folder
(progn
  (setq load-path (cons "~/.emacs.d/site-lisp/" load-path))
  (cd "~/.emacs.d/site-lisp/")
  (normal-top-level-add-subdirs-to-load-path))

(defun require-extentions (action lst)
  "template for require extensions"
  (mapcar (lambda(ext) "" (funcall action ext)) lst))

;; add latest org-mode to load-path
(setq load-path (cons "~/.emacs.d/site-lisp/org/lisp" load-path))

(require-extentions
 'require
 (list
;; Packeges
  'tabbar
  'ibuffer
  'lusty-explorer
  ;; 'bm
  'highlight-symbol
  'yasnippet
  'psvn
  'cc-mode
  'ido
  'dired-x
  'sudoku
  'uniquify
  'window-numbering
  'color-theme
  'smooth-scrolling
  'recentf
  'modeline-posn
  'ecb
  'sourcepair
  'xcscope
  'slime
  'dropdown-list
; 'auto-complete-config
  'w3m
  'bookmark+
  'color-theme-solarized
  'flymake
  'flymake-cursor
  'gtags
;  'git
;  'egit
  'magit
  'git-emacs
  'unicad
  'idle-highlight-mode
  'color-theme-dawn-night
  'iimage
  'org-install

;; Customs
  'yoyo-themes
  'yoyo-functions
  'yoyo-key-binding
  'yoyo-properties
  'yoyo-calendar
  'yoyo-org
  'yoyo-program))

(if window-system
    (progn
      (require 'bm)))

(provide 'yoyo-require)
