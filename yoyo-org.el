;; ;;; Code:
;; (add-to-list 'load-path "~/lib/emacs-lisp/org-6.01d/lisp")
;; (add-to-list 'load-path "~/lib/emacs-lisp/org-6.01d/contrib/lisp")


;; (setq org-agenda-files
;;       (list "~/.emacs.d/org/work.org"
;;      ;  "~/org/sparetime.org"
;;        "~/.emacs.d/org/home.org"
;;      ;  "~/org/fortune.org"
;;        ))

;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; ;; ;(define-key global-map "\C-cl" 'org-store-link)
;; ;; ;(define-key global-map "\C-ca" 'org-agenda)
;; (setq org-log-done 'time)

;; ;; Face for TODO keywords
;; (setq org-todo-keyword-faces
;;       '(
;;    ("TODO"      . (:foreground "red" :weight bold))
;;    ;("TODO"      . org-warning)
;;    ("DEFERRED"  . shadow)     ;; 延缓执行
;;    ("CANCELED"  . (:foreground "blue" :weight bold));;取消
;;    ))
;; (setq org-todo-keywords '("TODO" "FEEDBACK" "VERIFY"
;;            "DEFERRED" "CANCELED"  "DONE")
;;       org-todo-interpretation 'sequence)

;; ;; OrgMode & Remember
;; (org-remember-insinuate)
;; (setq org-directory "~/org")
;; (setq org-default-notes-file "~/org/notes.org")
;; (setq remember-annotation-functions '(org-remember-annotation))
;; (setq remember-handler-functions '(org-remember-handler))
;; (add-hook 'remember-mode-hook 'org-remember-apply-template)

;; ;; ;; org project
;; ;; (setq org-publish-project-alist
;; ;;       '(("org"
;; ;;     :base-directory "~/org/"
;; ;;     :publishing-directory "~/org/public_html"
;; ;;     :section-numbers nil
;; ;;     :table-of-contents nil
;; ;;     :style "<link rel=stylesheet
;; ;;       href=\"../other/mystyle.css\"
;; ;;       type=\"text/css\">")))

;; ;; ;; 一些有用的命令
;; ;; ;; C-c a W/w 找WAITING
;; ;; ;; C-C a U/v/u 找BOSS-URGENT
;; ;; ;; C-c a f 找 FIXME
;; ;; (setq org-agenda-custom-commands
;; ;;       '(("w" todo "WAITING")
;; ;;    ("W" todo-tree "WAITING")
;; ;;    ("u" tags "+BOSS-URGENT")
;; ;;    ("v" tags-todo "+BOSS-URGENT")
;; ;;    ("U" tags-tree "+BOSS-URGENT")
;; ;;    ("f" occur-tree "\\<FIXME\\>")))


;; ;; 关联上Emacs的diary
;; ;; (setq org-agenda-include-diary t)
;; ;; open appt message function
;; (add-hook 'diary-hook 'appt-make-list)
;; (setq appt-display-diary nil)

;; ;; org to appt
;; (setq appt-display-format 'window)
;; (setq appt-display-duration 60)
;; (setq appt-audible t)
;; (setq appt-display-mode-line t)
;; (appt-activate 1)
;; ;(setq appt-msg-countdown-list '(10 0))
;;       ;(org-agenda)
;; (org-agenda-to-appt )
;; ;; 只要你在任务中，C-c C-s后，把Schedule的单词删除，那么就是
;; ;; 一个时间戳的概念，那么OrgMode就知道你是要让这个任务中特定的
;; ;; 时间跳出来，提醒你。这时，需要你使用我之前注释掉的代码：

;; ;; 来让OrgMode将这个任务条转换为appt。就是到时间提醒你，很实用的功能

(setq org-hide-leading-stars t)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done 'time)

(setq org-agenda-files (list "~/Org/diary.org"
                             "~/Org/work.org"
                             "~/Org/todo.org"
                             "~/Org/notes.org"))

;; Org Mode 的TODO项


(setq org-todo-keywords
       '((sequence "TODO(t)" "ACTIVE(a@)" "WAIT(w@/!)" "SUSPNEDED(s@/!)"  "|"
                   "DONE(d!)" "CANCELED(c@)")))


;; 当所有子项目完成时，自动将母项目设为DONE
;; (defun org-summary-todo (n-done n-not-done)
;;   "Switch entry to DONE when all subentries are done, to TODO otherwise."
;;   (let (org-log-done org-log-states)   ; turn off logging
;;     (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

;; Remember Mode
(org-remember-insinuate)
(setq org-directory "~/Org")
(setq org-default-notes-file (concat org-directory "/scratch.org"))

(setq appt-issue-message t)


;; -- Display images in org mode
;; enable image mode first
(iimage-mode)
;; add the org file link format to the iimage mode regex
(add-to-list 'iimage-mode-image-regex-alist
             (cons (concat "\\[\\[file:\\(~?" iimage-mode-image-filename-regex
                           "\\)\\]")  1))
;;  add a hook so we can display images on load
(add-hook 'org-mode-hook '(lambda () (org-turn-on-iimage-in-org)))
;; function to setup images for display on load
(defun org-turn-on-iimage-in-org ()
  "display images in your org file"
  (interactive)
  (turn-on-iimage-mode)
  (set-face-underline-p 'org-link nil))

;; function to toggle images in a org bugger
(defun org-toggle-iimage-in-org ()
  "display images in your org file"
  (interactive)
  (if (face-underline-p 'org-link)
      (set-face-underline-p 'org-link nil)
      (set-face-underline-p 'org-link t))
  (iimage-mode))

(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key "\M-n" 'outline-next-visible-heading)
            (local-set-key "\M-p" 'outline-previous-visible-heading)
            ;; table
            (local-set-key "\M-\C-w" 'org-table-copy-region)
            (local-set-key "\M-\C-y" 'org-table-paste-rectangle)
            (local-set-key "\M-\C-l" 'org-table-sort-lines)
            ;; display images
            (local-set-key "\M-I" 'org-toggle-iimage-in-org)
            ;; fix tab
            (local-set-key "\C-y" 'yank)
            ;; yasnippet (allow yasnippet to do its thing in org files)
            (org-set-local 'yas/trigger-key [tab])
            (define-key yas/keymap [tab] 'yas/next-field-group)))

(define-key org-mode-map (kbd "C-S-a") 'org-archive-subtree)

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(require 'org-publish)
(setq org-publish-project-alist
      '(

	;; ... add all the components here (see below)...
	("org-notes"
	 :base-directory "~/Documents/notebook/notes/"
	 :base-extension "org"
	 :publishing-directory "~/Documents/notebook/public_html/"
	 :recursive t
	 :publishing-function org-publish-org-to-html
	 :headline-levels 4             ; Just the default for this project.
	 :auto-preamble t
	 )

	("org-static"
	 :base-directory "~/Documents/notebook/notes/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	 :publishing-directory "~/Documents/notebook/public_html/"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )

	("notes" :components ("org-notes" "org-static"))))

(setq org-export-html-coding-system 'utf-8)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (ditaa . t)
   (dot . t)
   (emacs-lisp . t)
   (gnuplot . t)
   (haskell . nil)
   (latex . t)
   (ledger . t)         ;this is the important one for this tutorial
   (ocaml . nil)
   (octave . t)
   (python . t)
   (ruby . t)
   (screen . nil)
   (sh . t)
   (sql . nil)
   (sqlite . t)))

(provide 'yoyo-org)
