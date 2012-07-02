;;;;;;;;;;;快捷键设置;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Alias
;;;;;;;;;;;;;;;;;;Commands Alias;;;;;;;;;;;;;;
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'lml 'list-matching-lines)
(defalias 'dml 'delete-matching-lines)
(defalias 'rb  'revert-buffer)
(defalias 'rs  'replace-string)
(defalias 'rr  'replace-regexp)
(defalias 'eb  'eval-buffer)
(defalias 'uta 'select-all-buffer-and-untabify)
(defalias 'ut  'untabify)
(defalias 'ss  'svn-status)
(defalias 'ha  'hs-hide-all)
(defalias 'sa  'hs-show-all)
(defalias 'ms  'magit-status)
(defalias 'opp 'org-publish-project)

;; Key bindings
;;(global-set-key [f3] 'repeat-complex-command)    ;; Do previous M-x Commands again
(global-set-key [C-f3] 'org-remember)      ;; Ctrl-F3 Remember Mode
(global-set-key [M-f3] 'view-my-notes)     ;; F3 View Notes
;;(global-set-key [C-f4] 'speedbar)        ;; F4 other-window
;;(global-set-key [f5] 'other-window)      ;; F5 speedbar
(global-set-key [f5] 'speedbar)            ;; F5 speedbar

(global-set-key [C-f6] 'open-eshell-other-buffer) ;; F6 eShell on another buffer
(global-set-key [f6] 'eshell)              ;; C-F6 eShell
(global-set-key [f7] 'compile)             ;; F7编译
(global-set-key [f8] 'linum-mode)          ;; F8为打开行号开关

;; Tabbar mode
(global-set-key [(C-f8)] 'tabbar-mode)

;;(global-set-key [f9] 'tool-bar-mode)    ;; F9打开或关闭工具栏
(global-set-key [C-f9] 'bookmark-set)     ;; F9 Set Bookmark
(global-set-key [f10]   'list-bookmarks)   ;; C-F9 List Bookmark
;; (global-set-key [f10]  'menu-bar-mode)    ;; F10打开关闭菜单栏
(global-set-key [C-f10] 'git-status)     ;; Ctrl+F10 Git Status
(global-set-key [f11]  'calendar)         ;; F11打开日历
;;(global-set-key [f12] 'view-mode)       ;; view-mode
;; kill current buffer and suspend this window
(global-set-key [f12] 'kill-buffer-and-suspend-window)
;;(global-set-key [f12] 'undo)            ;; F12 Undo

;; 将 M-/ 替换为hippie-expand
(global-set-key [(meta ?/)] 'hippie-expand)

(global-set-key [f9] 'select-all-buffer-and-untabify)
(global-set-key [(meta f6)] 'insert-add-stamp-with-current-time)
(global-set-key [(meta f7)] 'insert-modify-stamp-with-current-time)
(global-set-key [(meta f8)] 'insert-delete-stamp-with-current-time)

(global-set-key "\C-xt" 'insert-time-stamp-here)

;; smart scan
(global-set-key (kbd "M-n") 'smart-symbol-go-forward)
(global-set-key (kbd "M-p") 'smart-symbol-go-backward)

;; source pair
(global-set-key "\C-xp" 'sourcepair-load)

(global-set-key [(control ?\,)] 'tmp-point-to-register)
(global-set-key [(control ?\.)] 'tmp-jump-to-register)

(global-set-key "%" 'match-paren)
(global-set-key "\C-t" 'set-mark-command)    ;; C-t Mark region
(global-set-key "\M-," 'hs-toggle-hiding)    ;; 绑定自动隐藏
(global-set-key "\C-x\C-b" 'ibuffer)         ;; 绑定原始buffer功能为ibuffer
;;lusty-explorer mode
;; (global-set-key "\C-x\C-f" 'lusty-file-explorer)
;; (global-set-key "\C-x b"   'lusty-buffer-explorer)
;; (global-set-key "\C-c\C-a" 'msf-abbrev-define-new-abbrev-this-mode)
;; 替换Alt-X 执行命令
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; C-c C-l lock screen by zone
;;(global-set-key "\C-c\C-l" 'zone)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\C-x\C-j" 'dired-jump) ; 通过 C-x C-j 跳转到当前目录的 Dired

;; copy words at point
(global-set-key "\C-c w" 'copy-word)
(global-set-key "\C-c\C-w" 'copy-word)
;; save current line into kill-ring without mark the line
(global-set-key "\C-c l" 'copy-line)
(global-set-key "\C-c\C-l" 'copy-line)
;; copy paragraphes at point
(global-set-key "\C-c p" 'copy-paragraph)
(global-set-key "\C-c\C-p" 'copy-paragraph)

;; Bookmark mode
(if window-system
    (progn
      (global-set-key [C-f2] 'bm-toggle)
      (global-set-key [f2]   'bm-next)
      ))

(global-set-key [f3] 'highlight-symbol-at-point)
(global-set-key [f4] 'highlight-symbol-next)
(global-set-key [M-f4] 'highlight-symbol-prev)
(global-set-key (kbd "<S-f2>") 'bm-previous)
(global-set-key (kbd "<left-fringe> <mouse-5>") 'bm-next-mouse)
(global-set-key (kbd "<left-fringe> <mouse-4>") 'bm-previous-mouse)
(global-set-key (kbd "<left-fringe> <mouse-1>") 'bm-toggle-mouse)

;; 使用Ctrl + 滚轮放大缩小字体
;; Emacs 默认调整字体大小的快捷键
;; 放大字体: Ctrl-x Ctrl-+ 或 Ctrl-x Ctrl-=
;; 缩小字体: Ctrl-x Ctrl–
;; 重置字体: Ctrl-x Ctrl-0
;; 如果要放大或缩小多次,在第二次直接按 +,-,0 就可以了,比如,
;; 放大 3 次: Ctrl-x Ctrl-= = = .另外,Shift + 鼠标左键也能唤出调整字体大
;; 小的弹出菜单.
;; For Windows
(global-set-key (kbd "<C-wheel-up>")   'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
;; For Linux
;; (global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
;; (global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)

;; 重新设置注释快捷键
(global-set-key "\M-;" 'comment-dwim-line-plus)

;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)

;; magit status
(global-set-key (kbd "C-x g s") 'magit-status)


;; (setq fold-keys-already-setup nil)
;; (add-hook 'folding-mode-hook
;;       (function (lambda()
;;               (unless fold-keys-already-setup
;;             (setq fold-keys-already-setup t)
;;             (define-prefix-command 'ctl-f-folding-mode-prefix)
;;             (define-key 'ctl-f-folding-mode-prefix "f" 'fold-fold-region)
;;             (define-key  'ctl-f-folding-mode-prefix "e" 'fold-enter)
;;             (define-key 'ctl-f-folding-mode-prefix "x" 'fold-exit)
;;             (define-key  'ctl-f-folding-mode-prefix "b" 'fold-whole-buffer)
;;             (define-key 'ctl-f-folding-mode-prefix "o" 'fold-open-buffer)
;;             (define-key 'ctl-f-folding-mode-prefix "h" 'fold-hide)
;;             (define-key 'ctl-f-folding-mode-prefix "s" 'fold-show)
;;             (define-key 'ctl-f-folding-mode-prefix "t" 'fold-top-level)
;;             (define-key 'ctl-f-folding-mode-prefix "f" 'fold-fold-region)
;;             )
;;               (local-set-key "\C-f" 'ctl-f-folding-mode-prefix))))

;; (fold-add-to-marks-list 'sgml-mode
;;             "<!-- {"
;;              "<!-- } -->" " --> ")
;; (fold-add-to-marks-list 'c-mode "/* <" "/* > */" "*/")
;; (fold-add-to-marks-list 'c++-mode
;;             "//<" "//>" "")
;; (fold-add-to-marks-list 'LaTeX-mode "%%% {{{" "%%% }}}" " ")
;; (fold-add-to-marks-list 'latex2e-mode "%%% {{{" "%%% }}}" " ")
;; (fold-add-to-marks-list 'latex-mode "%%%% {{{" "%%%% }}}" " ")
;; (fold-add-to-marks-list 'BibTeX-mode "%%% {{{" "%%% }}}" " ")
;; (fold-add-to-marks-list 'lisp-mode ";;; {" ";;; }" "")
;; (fold-add-to-marks-list 'lex-mode" /* {{{ " " /* }}} */ " "*/")
;; (fold-add-to-marks-list 'html-mode "<!-- { " "<!-- } -->" "-->")
;; (fold-add-to-marks-list 'shell-script-mode "# {{{" "# }}}" nil)
;; (fold-add-to-marks-list 'sh-mode "# {{{ " "# }}}" nil)

(provide 'yoyo-key-binding)
