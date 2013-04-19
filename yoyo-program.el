 ;;(setq compile-command "gcc -Wall -g ")    ;;默认编译命令为gcc
 (setq compile-command "cl ")    ;;Windows平台使用VC编译器 cl 命令
 ;;(setq compile-command "javac -d . ")    ;;默认编译命令为javac

 ;;(setq c-default-sytle '((java-mode."java")
            ;; (c++-mode."stroustrup")
            ;; (c-mode."stroustrup"))

;; GNU Global
(autoload 'gtags-mode "gtags" "" t)

(add-hook 'gtags-mode-hook
          '(lambda ()
            (setq gtags-pop-delete t)
            (setq gtags-path-style 'root)
            (setq gtags-suggested-key-mapping t)

            (define-key gtags-mode-map "\C-ch" 'gtags-display-browser)
            (define-key gtags-mode-map "\C-]" 'gtags-find-tag-from-here)
            ;; (define-key gtags-mode-map "\C-t" 'gtags-pop-stack)
            (define-key gtags-mode-map "\C-cP" 'gtags-find-file)
            (define-key gtags-mode-map "\C-cf" 'gtags-parse-file)
            (define-key gtags-mode-map "\C-cg" 'gtags-find-with-grep)
            (define-key gtags-mode-map "\C-cI" 'gtags-find-with-idutils)
            (define-key gtags-mode-map "\C-cs" 'gtags-find-symbol)
            (define-key gtags-mode-map "\C-cr" 'gtags-find-rtag)
            (define-key gtags-mode-map "\C-ct" 'gtags-find-tag)
            (define-key gtags-mode-map "\C-cv" 'gtags-visit-rootdir)
            ; common
            (define-key gtags-mode-map "\e*" 'gtags-pop-stack)
            (define-key gtags-mode-map "\e." 'gtags-find-tag)
            (define-key gtags-mode-map "\C-x4." 'gtags-find-tag-other-window)))

(add-hook 'gtags-select-mode-hook
          '(lambda ()
            (setq hl-line-face 'underline)
            (hl-line-mode 1)
            (setq gtags-suggested-key-mapping t)

            (define-key gtags-select-mode-map "\e*" 'gtags-pop-stack)
            (define-key gtags-select-mode-map "\^?" 'scroll-down)
            (define-key gtags-select-mode-map " " 'scroll-up)
            (define-key gtags-select-mode-map "\C-b" 'scroll-down)
            (define-key gtags-select-mode-map "\C-f" 'scroll-up)
            (define-key gtags-select-mode-map "k" 'previous-line)
            (define-key gtags-select-mode-map "j" 'next-line)
            (define-key gtags-select-mode-map "p" 'previous-line)
            (define-key gtags-select-mode-map "n" 'next-line)
            (define-key gtags-select-mode-map "q" 'gtags-pop-stack)
            (define-key gtags-select-mode-map "u" 'gtags-pop-stack)
            (define-key gtags-select-mode-map "\C-m" 'gtags-select-tag)
            (define-key gtags-select-mode-map "\C-o" 'gtags-select-tag-other-window)
            (define-key gtags-select-mode-map "\e." 'gtags-select-tag)))

(setq gtags-auto-update t)

;;载入hideshow模块
(load-library "hideshow")

 ;;C++显示模式
(add-hook 'c++-mode-hook
          '(lambda ()
            (c-toggle-hungry-state t)
            (gtags-mode 1)
            (hs-minor-mode)
            (idle-highlight-mode t)
            (hide-ifdef-mode)))
 ;;C显示模式
(add-hook 'c-mode-hook
          '(lambda ()
            (c-toggle-hungry-state t)
            (gtags-mode 1)
            (hs-minor-mode)
            (idle-highlight-mode t)
            (hide-ifdef-mode)))

(add-hook 'objc-mode-hook
          '(lambda ()
            (hs-minor-mode)
            (c-toggle-hungry-state t)
            (idle-highlight-mode t)
            (hide-ifdef-mode)))

(add-hook 'python-mode-hook
          '(lambda ()
            (setq tab-width 4)
            (setq indent-tab-mode nil)
            (hs-minor-mode)))

(setq c-default-style "linux" c-basic-offset 4)

(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode nil)

(setq c-offsets-alist '((case-label . +) 
                        (substatement-open . 0)))

(setq pylookup-dir "~/document/python/")
(add-to-list 'load-path pylookup-dir)
(setq pylookup-program "~/.emacs.d/site-lisp/tsgates-pylookup/pylookup.py")
(setq pylookup-db-file "~/Documents/pydoc/pylookup.db")

;; already translate msf-abbrev to yasnippet
;;msf-abbrev mode
;; (setq-default abbrev-mode t)
;; (setq save-abbrevs nil)
;; (setq msf-abbrev-root "~/.emacs.d/mode-abbrevs/")
;; (msf-abbrev-load)
;; (setq msf-abbrev-verbose nil)

;;Google C/C++ Style
;;(add-hook 'c-mode-common-hook 'google-set-c-style)

 ;;Java显示模式
 (add-hook 'java-mode-hook
       '(lambda()
          (c-toggle-hungry-state)))    ;;自动打开hungry-delete模式

;;Python没有hungry-delete模式--No, It doesn't;;
;;Use python-mode instead of default python mode
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.pyw$" . python-mode) auto-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(setq interpreter-mode-alist(cons '("python" . python-mode) interpreter-mode-alist))


;;  ;;Python显示模式
;;  (add-hook 'python-mode-hook
;;        '(lambda()
;;           (c-toggle-hungry-state)))    ;;自动打开hungry-delete模式

;; ;;;;;;;;;;;;;;CSharp
;; C# 模式暂时不可用
;; (require 'csharp-mode)
;;  (setq auto-mode-alist (cons '( "\\.cs\\'" . csharp-mode ) auto-mode-alist ))
;;  (add-hook 'csharp-mode-hook  'hs-minor-mode)
;;  (add-hook 'csharp-mode-hook  (function (lambda()
;;  (define-key csharp-mode-map "\C-x\C-a"     'dd-open-aspx-cs-current-window)
;;               (c-set-style "bsd")
;;           (setq c-basic-offset 4)
;;                )))
;;  (define-key csharp-mode-map "\C-x\C-a" 'dd-open-aspx-cs-current-window)
;;  (global-set-key  "\C-x\C-a" 'dd-open-aspx-cs-current-window)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 设置tab为4个空格，并关闭使用tab缩进
(setq tab-width 4)
(setq indent-tab-mode nil)

;; Use cperl-mode instead of original perl-mode
(fset 'perl-mode 'cperl-mode)

;; cperl-mode Settings
(defalias 'perl-mode 'cperl-mode)
(defun pde-perl-mode-hook ()
  (abbrev-mode t)
  (add-to-list 'cperl-style-alist
               '("PDE"
                 (cperl-auto-newline                         . t)
                 (cperl-brace-offset                         . 0)
                 (cperl-close-paren-offset                   . 0)
                 (cperl-continued-brace-offset               . 0)
                 (cperl-continued-statement-offset           . 0)
                 (cperl-extra-newline-before-brace           . nil)
                 (cperl-extra-newline-before-brace-multiline . nil)
                 (cperl-indent-level                         . 4)
                 (cperl-indent-parens-as-block               . t)
                 (cperl-label-offset                         . -4)
                 (cperl-merge-trailing-else                  . t)
                 (cperl-tab-always-indent                    . t)
                 ))
  (cperl-set-style "PDE"))

(add-hook 'cperl-mode-hook
          '(lambda()
             (pde-perl-mode-hook)))

;; (load-file "~/.emacs.d/site-lisp/cedet-1.0/common/cedet.el")
;; (global-ede-mode 1)                      ; Enable the Project management system
;; (semantic-load-enabe-code-helpers)      ; Enable prototype help and smart completion
;; (global-srecode-minor-mode 1)            ; Enable template insertion menu

;; SLIME setup
;; (setq inferior-lisp-program "D:\\Progra~1\\clisp-2.49\\full\\lisp.exe
;;     -B D:\\Progra~1\\clisp-2.49\\full\\
;;     -M D:\\Progra~1\\clisp-2.49\\full\\lispinit.mem
;;     -ansi -q")

;; quicklisp
;;(load (expand-file-name "~/quicklisp/slime-helper.el"))

(setq inferior-lisp-program "sbcl")
(setq lisp-indent-function 'common-lisp-indent-function)
(setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
(setq common-lisp-hyperspec-root "file://localhost/f:/Documents/HyperSpec/")
;;(setq slime-net-coding-system 'utf-8-unix)
;;(slime-setup '(slime-fancy))
(slime-setup '(slime-fancy slime-asdf))

;; (ffap-bindings)
;; ;; 设定搜索的路径 ffap-c-path
;; (setq ffap-c-path
;;       '("D:\\Program Files\\Microsoft Visual Studio\\VC98\\Include"))
;; ;; 如果是新文件要确认
;; (setq ffap-newfile-prompt t)
;; ;; ffap-kpathsea-expand-path 展开路径的深度
;; (setq ffap-kpathsea-depth 5)

;; sourcepair settings
(setq sourcepair-source-path '( "." "../*" ))
(setq sourcepair-header-path '( "." "include" "../include" "../*"))
(setq sourcepair-recurse-ignore '( "CVS" "Obj" "Debug" "Release" ".svn"))
(setq sourcepair-source-extensions '(".c" ".cpp" ".cxx" ".cc" ".m" ".mm"))
(setq sourcepair-header-extensions '(".h" ".hpp" ".hh"))

;; (when (executable-find "pyflakes")
;;   (defun flymake-pyflakes-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list "pyflakes" (list local-file))))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pyflakes-init)))

;; ;; (when (load "flymake" t)
;; (defun flymake-pyflakes-init ()
;; ; Make sure it's not a remote buffer or flymake would not work
;;   (when (not (subsetp (list (current-buffer)) (tramp-list-remote-buffers)))
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list "pyflakes" (list local-file)))))
;; (add-to-list 'flymake-allowed-file-name-masks
;;              '("\\.py\\'" flymake-pyflakes-init))


;; (autoload 'flymake-find-file-hook "flymake" "" t)
;; (add-hook 'find-file-hook 'flymake-find-file-hook)
;; (setq flymake-gui-warnings-enabled nil)
;; (setq flymake-log-level 0)


;; ac-mode
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/ac-dict")
;;(ac-config-default)

(setq imenu-auto-rescan t)

(provide 'yoyo-program)
