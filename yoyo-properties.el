;; Properties
;; Emacs Server
(unless (server-running-p)
  (server-mode t))

;; Save Emacs sessions automatically
(unless (file-exists-p "~/.emacs.desktop.lock")
    (desktop-save-mode t))

;; Personal information
(setq user-full-name "Chenbin")
(setq user-mail-address "chen.bin11@zte.com.cn")

;; Color themes
(color-theme-initialize)

;; different when vary system
(if window-system
    (color-theme-gnome-3-adwaita)
  (color-theme-cl-dawn))

;;(color-theme-scintilla)
;;(color-theme-classic)
;;(color-theme-dark-blue2)
;;(color-theme-xemacs)
;;(color-theme-calm-forest)
;;(color-theme-aalto-light)
;;(color-theme-charcoald-black)
;;(color-theme-darkmate)
;;(color-theme-solarized-dark)
;;(color-theme-tango)
;;(color-theme-tango-2)
;;(color-theme-tango-light)
;;(color-theme-deep-blue)
;;(color-theme-deep-blue-up)
;;(color-theme-blippblopp)
;;(color-theme-snowish)
;;(color-theme-gnome2)
;;(color-theme-subtle-hacker)
;;(color-theme-gnome-3-adwaita)
;;(color-theme-sitaramv-solaris)
;;(color-theme-infodoc)
;;(color-theme-solarized-light)
;;(color-theme-solarized-dark)
;;(color-theme-cl-dawn)
;;(color-theme-cl-night)

;;;;设置字体
(if (string= "windows-nt" system-type)
    (progn
      (set-default-font "DejaVu Sans Mono:pixelsize=13:bold")
      ;;(set-default-font "consolas:pixelsize=13")
      ;;(set-default-font "Anonymous:pixelsize=12")
      (set-fontset-font (frame-parameter nil 'font)
                        'han '("微软雅黑" . "unicode-bmp"))
      ;; Set plink as the default tramp method
      (setq tramp-default-method "plink")
      ))

(if (string= "darwin" system-type)
    (progn
      ;;;;Fonts
      (set-default-font "Monaco:pixelsize=13:bold")
      ;; ;;(set-default-font "Anonymous:pixelsize=12")
      (set-fontset-font (frame-parameter nil 'font)
			'han '("STSong" . "unicode-bmp"))
      (toggle-keyboard-settings)
      (setq tramp-default-method "ssh")
      ))

(if (not (string= "windows-nt" system-type))
    (progn
      (prefer-coding-system       'utf-8)
      (set-default-coding-systems 'utf-8)
      (set-terminal-coding-system 'utf-8)
      (set-keyboard-coding-system 'utf-8)
      ;; This from a japanese individual.  I hope it works.
      (setq default-buffer-file-coding-system 'utf-8)
      ))

;(setq unicad-mode t)

(if window-system
    (progn
      ;;;;设置初始化边框
      (setq default-frame-alist
	    '((top . 0)(left . 0)(width . 80)(height . 35)))
      (set-scroll-bar-mode nil)
      ;; hl-line-mode setting
      (wcy-color-theme-adjust-hl-mode-face)
      ;; Highlight line mode
      (global-hl-line-mode t)
      ;; bookmark
      (setq-default bm-buffer-persistence t)
      (setq bm-highlight-style 'bm-highlight-only-fringe)
      ;;(setq bm-highlight-style 'bm-highlight-line-and-fringe)
      ))


(tool-bar-mode -1)
(menu-bar-mode -1)
(setq-default abbrev-mode t)

;; recentf mode
;; enable recent files mode.
(recentf-mode t)
;; 50 files ought to be enough.
(setq recentf-max-saved-items 100)

;; Speedbar
(setq speedbar-show-unknown-files t)      ;; 可以显示所有目录以及文件
(setq dframe-update-speed nil)            ;; 不自动刷新，手动 g 刷新
(setq speedbar-update-flag nil)
(setq speedbar-use-images nil)            ;; 不使用 image 的方式
(setq speedbar-verbosity-level 0)

;; hippie expand
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;;;;;;;;;;; abbrev mode ;;;;;;;;;;;;;;;
;; ensure abbrev mode is always on

;;;;设置时间stamp
(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(setq time-stamp-format "%Y-%02m-%02d %3a %02H:%02M:%02S")
(add-hook 'before-save-hook 'time-stamp)

(auto-image-file-mode t)  ;;打开图片显示功能
(transient-mark-mode t)   ;;反显示选中区域
(show-paren-mode 1)       ;;高亮显示配对括号
(blink-cursor-mode t)     ;;光标是否闪烁
;;关闭警告音
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;;(global-font-lock-mode t)
(setq inhibit-startup-message t)       ;;关闭启动画面
(setq mouse-avoidance-mode 'animate)   ;;光标靠近鼠标时，鼠标自动移开
;;(setq frame-title-format "Chenbin@%f") ;;标题栏显示buffer名字
(setq frame-title-format
      '("Chenbin%@"
        (:eval (system-name))
        ": "
        (:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                   "%f"))" <Buffer Size: %I> "))

;;(setq make-backup-files nil)         ;;不产生备份文件
(setq x-select-enable-clipboard t)     ;;允许emacs和外部其他程序粘贴

;; (menu-bar-mode nil)                    ;;关闭菜单栏
;; (setq menu-bar-mode nil)
(setq default-directory "~/")          ;;设置打开文件的缺省路径
;;(setq-default cursor-type 'bar)      ;;设置光标为竖线
(setq-default cursor-type 'box)        ;;设置光标为方块
;;(setq split-width-threshold 2)       ;;设置默认打开窗口方式为垂直代开，默认为水平打开

;;滚动页面时比较舒服，不要整页的滚动，防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文。
;; Using Smooth-scrolling.el instead of it
;;(setq scroll-step 1 scroll-margin 1 scroll-conservatively 100000)

;;显示行列号
(setq column-number-mode t)
(setq line-number-mode t)
(setq-default c-electric-flag t) ;;打开(t)/关闭(nil)Electric Mode

(setq default-major-mode 'text-mode) ;;设定主模式为text mode, 并打开auto-fill模式
(add-hook 'text-mode-hook 'text-mode-hook-identify)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq default-fill-column 72)

;; ido mode
(ido-mode t)
(setq ido-create-new-buffer (quote never))
(setq ido-enable-flex-matching t)
(setq ido-enable-last-directory-history nil)
(setq ido-enable-regexp nil)
(setq ido-max-directory-size 300000)
(setq ido-max-file-prompt-width 0.1)
(setq ido-use-filename-at-point (quote guess))
(setq ido-use-url-at-point t)
(setq ido-use-virtual-buffers t)

;; Backup Settings
;; Emacs 中，改变文件时，默认都会产生备份文件(以 ~ 结尾的文件)。可以完全去掉
;; (并不可取)，也可以制定备份的方式。这里采用的是，把所有的文件备份都放在一
;; 个固定的地方("~/backups")。对于每个备份文件，保留最原始的两个版本和最新的
;; 1个版本。并且备份的时候，备份文件是复本，而不是原件。
(setq version-control t);;启用版本控制，即可以备份多次
(setq kept-old-versions 3);;备份最原始的版本两次，及第一次编辑前的文档，和第二次编辑前的文档
(setq kept-new-versions 5);;备份最新的版本3次，理解同上
(setq delete-old-versions t);;删掉不属于以上3种版本的版本
(setq backup-directory-alist '(("." . "~/.emacs.d/backup/")));;设置备份文件的路径
(setq backup-by-copying t);;备份设置方法，直接拷贝

;; Dired Delete files by moving to trash
(setq delete-by-moving-to-trash t)


;; Dired
(setq dired-recursive-deletes t) ; 可以递归的删除目录
(setq dired-recursive-copies t)  ; 可以递归的进行拷贝
(setq dired-guess-shell-alist-user
      (list
       (list "\\.htm$" "explorer")
       (list "\\.html$" "explorer")
       (list "\\.doc$" "winword"))) ; 设置一些文件的默认打开方式，此功能必须在(require 'dired-x)之后


;; 该模式修改为路径加文件名来区分
(setq uniquify-buffer-name-style 'forward)
;; 使用数字编号来标识窗口
(window-numbering-mode t)

;; (setq Info-directory-list
;;       '("D:/Emacs/info/"
;;         "~/info/"))

;; 设置透明度
(set-frame-parameter (selected-frame) 'alpha (list 96 80))
(add-to-list 'default-frame-alist (cons 'alpha (list 96 80)))


;; Ediff related
;; split window depends on window width
(setq ediff-split-window-function
      (lambda (&optional arg)
        (if (> (frame-width) 150)
            (split-window-horizontally arg)
          (split-window-vertically arg))))

(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Yasnipets
(setq yas/root-directory "~/.emacs.d/site-lisp/yasnippets")
(yas/load-directory yas/root-directory)
(yas/global-mode t)
(setq yas/prompt-functions '(yas/ido-prompt
                             yas/dropdown-prompt
                             yas/completing-prompt))

;; 系统语言,nil为默认,C为英文
(setq system-time-locale "C")

;; mode-line-position mode
(setq modelinepos-column-limit 80)
(column-number-mode 1)
(size-indication-mode 1)

;; use C-n for next new line
;;(setq next-line-add-newlines nil)

;; use jabber
(setq jabber-account-list
      '(("heychenbin@gmail.com"
         (:network-server . "talk.google.com")
         (:connection-type . ssl))))

;; Identify trailing whitepace characters at end of line
;; and end of file in Emacs
;; (setq-default show-trailing-whitespace t)
(setq-default indicate-empty-lines t
              indicate-buffer-boundaries 'left)

;; if delete trailing whitespace before save, do below:
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq shell-file-name
      ;; must be in the `PATH' (Windows users)
      (cond ((executable-find "zsh") "zsh")
            ((executable-find "cmdproxy.exe") "cmdproxy.exe")
            ((executable-find "bash") "bash")
            (t "cmd.exe"))) ;; = system shell


;;w3m
;;(add-to-list 'load-path "~/emacs/site-lisp/w3m")
;;(require 'w3m-load)
;; (require 'w3m-e21)
;; (provide 'w3m-e23)
;; w3m may not exists
(if (ignore-errors (require 'w3m))
    (progn
      (setq w3m-use-favicon nil)
      (setq w3m-command-arguments '("-cookie" "-F"))
      (setq w3m-use-cookies t)
      (setq w3m-home-page "about://bookmark/")
      ;; (setq browse-url-browser-function 'w3m-browse-url)
      (setq browse-url-browser-function 'w3m-browse-url-other-window)
      (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
      (setq w3m-default-display-inline-images t)
      (setq w3m-use-mule-ucs t)
      (define-key w3m-mode-map (kbd "C-t") 'set-mark-command)
      (define-key w3m-mode-map [left]      'backward-char)
      (define-key w3m-mode-map [down]      'next-line)
      (define-key w3m-mode-map [up]        'previous-line)
      (define-key w3m-mode-map [right]     'forward-char)
      (define-key w3m-mode-map (kbd "0")   'w3m-beginning-of-line)
      (define-key w3m-mode-map (kbd "n")   'w3m-next-anchor)
      (define-key w3m-mode-map (kbd "p")   'w3m-previous-anchor)

      (setq w3m-command-arguments
	    (nconc w3m-command-arguments
		   '("-o" "http_proxy=http://proxynj.zte.com.cn:80/")))
      (setq w3m-no-proxy-domains '("10.*.*.*" "192.168.*.*" "*.zte.com.cn" "*.zte.intra"))
      ))

;; (setq w3m-coding-system           'utf-8
;;       w3m-file-coding-system      'utf-8
;;       w3m-file-name-coding-system 'utf-8
;;       w3m-input-coding-system     'utf-8
;;       w3m-output-coding-system    'utf-8
;;       w3m-terminal-coding-system  'utf-8)
;;(global-set-key “\C-xm” ‘browse-url-at-point)


;; ;; evernote can not work now??
;; (setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8")) ; option
;; ;(add-to-list 'load-path "<your load path>")
;; (require 'evernote-mode)
;; (global-set-key "\C-cec" 'evernote-create-note)
;; (global-set-key "\C-ceo" 'evernote-open-note)
;; (global-set-key "\C-ces" 'evernote-search-notes)
;; (global-set-key "\C-ceS" 'evernote-do-saved-search)
;; (global-set-key "\C-cew" 'evernote-write-note)
;; (global-set-key "\C-cep" 'evernote-post-region)
;; (global-set-key "\C-ceb" 'evernote-browser)

;; (autoload 'iimage-mode "iimage" "Support Inline image minor mode." t)
;; (autoload 'turn-on-iimage-mode "iimage" "Turn on Inline image minor mode." t)


(add-hook 'sgml-mode-hook
          '(lambda()
             (hs-minor-mode 1)))
(add-to-list 'hs-special-modes-alist
             '(sgml-mode
               "<!--\\|<[^/>]>\\|<[^/][^>]*[^/]>"
               ""
               "<!--"
               sgml-skip-tag-forward
               nil))

(provide 'yoyo-properties)
