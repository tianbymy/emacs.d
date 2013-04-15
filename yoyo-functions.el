;; Functions
;; Open a new buffer to run eshell
(defun open-eshell-other-buffer ()
    "Open eshell in other buffer"
    (interactive)
    (split-window-vertically)
    (eshell))

;; View my notes in view mode
(defun view-my-notes ()
  "View my notes in view mode"
  (interactive)
  ;; (view-file "~/Org/notes.org"))       ;; Changed to open file in order to edit it.
  (find-file "~/Org/scratch.org"))

(defun toggle-todo-list ()
  (interactive)
  (message "%s" buffer-file-name)
  (if (string= (downcase (buffer-file-name))
               (replace-regexp-in-string
                "\\\\" "/"
                (downcase (concat (getenv "HOME")
                                  "/Documents/Org/todo.org"))))
        (switch-to-buffer (other-buffer))
      (find-file "~/Documents/Org/todo.org")))

;; Insert stamps
(defun insert-add-stamp-with-current-time ()
  "Insert a Add Stamp with current time"
  (interactive)
  (insert
   (format-time-string "\/\/Chenbin Added at <%Y-%m-%d %H:%M:%S> Begin " (current-time)))
  (let ((curPoint (point)))
        (insert (format-time-string "\/\/Chenbin Added at <%Y-%m-%d %H:%M:%S> End "
                                    (current-time)))
        (goto-char curPoint)))


;; Insert stamps
(defun insert-modify-stamp-with-current-time ()
  "Insert a Modified Stamp with current time"
  (interactive)
  (insert
   (format-time-string "\/\/Chenbin Modified at <%Y-%m-%d %H:%M:%S> Begin "
                       (current-time)))
  (let ((curPoint (point)))
        (insert (format-time-string "\/\/Chenbin Modified at <%Y-%m-%d %H:%M:%S> End"
                                    (current-time)))
        (goto-char curPoint)))

;; Insert stamps
(defun insert-delete-stamp-with-current-time ()
  "Insert a Modified Stamp with current time"
  (interactive)
  (insert
   (format-time-string "\/\/Chenbin Deleted at <%Y-%m-%d %H:%M:%S> Begin "
                       (current-time)))
  (let ((curPoint (point)))
        (insert (format-time-string "\/\/Chenbin Deleted at <%Y-%m-%d %H:%M:%S> End "
                                    (current-time)))
        (goto-char curPoint)))

;; Insert stamp
(defun insert-time-stamp-here ()
  "Insert a time stamp in current position"
  (interactive)
  (insert
   (format-time-string "<%Y-%m-%d %H:%M:%S>"
                       (current-time))))

;; 自动选中整个Buffer，并执行untabify操作
(defun select-all-buffer-and-untabify()
  "Select all buffer and untabify it, besides delete all trailing whitespace"
    (interactive)
    (message "Select buffer and Untabify")
    (save-excursion
      (delete-trailing-whitespace)
      (if (and transient-mark-mode mark-active)
          (untabify (region-beginning) (region-end))
        (untabify (point-min) (point-max)))))

;; 把 % 设置为在括号处寻找相应的配对括号，其他地方还是输入该符号
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
    ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
    (t (self-insert-command (or arg 1)))))


(defun tmp-point-to-register()
  "Store cursorposition _fast_ in a register.
   Use tmp-jump-to-register to jump back to the stored
   position."
  (interactive)
  (setq zmacs-region-stays t)
  (message "Store current position")
  (point-to-register 8))

(defun tmp-jump-to-register()
  "Switches between current cursorposition and position
   that was stored with tmp-point-to-register."
  (interactive)
  (message "Jump to stored position")
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
        (jump-to-register 8)
        (set-register 8 tmp)))

(defun switch-to-scratch ()
  "Switch to *scratch* buffer"
  (interactive)
  (let ((buffer (get-buffer-create "*scratch*")))
    (switch-to-buffer buffer)
    (unless (equal major-mode 'lisp-interaction-mode)
      (lisp-interaction-mode))))

(defun dos2unix ()
  "dos2unix on current buffer."
  (interactive)
  (set-buffer-file-coding-system 'unix))

(defun unix2dos ()
  "unix2dos on current buffer."
  (interactive)
  (set-buffer-file-coding-system 'dos))

;; Enhance default comment command
(defun comment-dwim-line-plus (&optional arg)
  "Replacement for the comment-dwim command.
If no region is selected and current line is not blank and we are not at the end of the line,
then comment current line.
Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))


(defun count-line-number-of-region()
  (interactive)
  (let ((line-count (count-lines (region-beginning) (region-end))))
    (if (> line-count 1)
      (message "%d lines" line-count)
    (message "%d line" line-count))))


;;;;;;;;;;;; Smart scan ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar smart-use-extended-syntax nil
  "If t the smart symbol functionality will consider extended
syntax in finding matches, if such matches exist.")

(defvar smart-last-symbol-name ""
  "Contains the current symbol name.

This is only refreshed when `last-command' does not contain
either `smart-symbol-go-forward' or `smart-symbol-go-backward'")

(make-local-variable 'smart-use-extended-syntax)

(defvar smart-symbol-old-pt nil
  "Contains the location of the old point")

(defun smart-symbol-goto (name direction)
  "Jumps to the next NAME in DIRECTION in the current buffer.

DIRECTION must be either `forward' or `backward'; no other option
is valid."

  ;; if `last-command' did not contain
  ;; `smart-symbol-go-forward/backward' then we assume it's a
  ;; brand-new command and we re-set the search term.
  (unless (memq last-command '(smart-symbol-go-forward
                               smart-symbol-go-backward))
    (setq smart-last-symbol-name name))
  (setq smart-symbol-old-pt (point))
  (message (format "%s scan for symbol \"%s\""
                   (capitalize (symbol-name direction))
                   smart-last-symbol-name))
  (unless (catch 'done
            (while (funcall (cond
                             ((eq direction 'forward) ; forward
                              'search-forward)
                             ((eq direction 'backward) ; backward
                              'search-backward)
                             (t (error "Invalid direction"))) ; all others
                            smart-last-symbol-name nil t)
              (unless (memq (syntax-ppss-context
                             (syntax-ppss (point))) '(string comment))
                (throw 'done t))))
    (goto-char smart-symbol-old-pt)))

(defun smart-symbol-go-forward ()
  "Jumps forward to the next symbol at point"
  (interactive)
  (smart-symbol-goto (smart-symbol-at-pt 'end) 'forward))

(defun smart-symbol-go-backward ()
  "Jumps backward to the previous symbol at point"
  (interactive)
  (smart-symbol-goto (smart-symbol-at-pt 'beginning) 'backward))

(defun smart-symbol-at-pt (&optional dir)
  "Returns the symbol at point and moves point to DIR (either `beginning' or `end') of the symbol.

If `smart-use-extended-syntax' is t then that symbol is returned
instead."
  (with-syntax-table (make-syntax-table)
    (if smart-use-extended-syntax
        (modify-syntax-entry ?. "w"))
    (modify-syntax-entry ?_ "w")
    (modify-syntax-entry ?- "w")
    ;; grab the word and return it
    (let ((word (thing-at-point 'word))
          (bounds (bounds-of-thing-at-point 'word)))
      (if word
          (progn
            (cond
             ((eq dir 'beginning) (goto-char (car bounds)))
             ((eq dir 'end) (goto-char (cdr bounds)))
             (t (error "Invalid direction")))
            word)
        (error "No symbol found")))))


;; change highlight mode colors
(or (facep 'my-hl-line-face) (make-face 'my-hl-line-face))
(setq hl-line-face 'my-hl-line-face)
(face-spec-set 'my-hl-line-face '((t (
                                      :background "DodgerBlue3"
                                                  ;;:bold
                                                  ;;:weight nil
                                      :inverse-video nil
                                      ))))

(defun wcy-color-theme-adjust-hl-mode-face()
  (interactive)
  (let* ((color  (x-color-values (face-attribute 'default :background))))
    (if (null color)
        (error "not support.")
      (let ((my-color
             (mapcar
              (lambda (x)
                (let ((y (/ #XFFFF 4))
                      (delta #X18FF))
                  (cond
                   ((< x (* y 1)) (+ x delta))
                   ((< x (* y 2)) (+ x delta))
                   ((< x (* y 3)) (- x delta))
                   (t (- x delta)))))
              color)))
        ;;(message "%S %S" color my-color)
        (set-face-attribute
         'my-hl-line-face nil
         :background
         (concat "#"
                 (mapconcat
                  (lambda (c) (format "%04X" c))
                  my-color
                  "")))))))

(defun kill-buffer-and-suspend-window()
  "kill a buffer and suspend current window
if kill buffer failed, do nothing"
  (interactive)
  (progn
    (if (kill-buffer)
        (suspend-frame))))

 ;; Set transparency of emacs
(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))

(defun copy-line (&optional arg)
  "Save current line into Kill-Ring without mark the line"
  (interactive "P")
  (let ((beg (line-beginning-position))
        (end (line-end-position arg)))
    (copy-region-as-kill beg end)
    (message "copy line")))

(defun copy-word (&optional arg)
  "Copy words at point"
  (interactive "P")
  (let ((beg (progn (if (looking-back "[a-zA-Z0-9]" 1)
                        (backward-word 1))
                    (point)))
        (end (progn (forward-word arg)
                    (point))))
    (copy-region-as-kill beg end)
    (message "copy word")))

(defun copy-paragraph (&optional arg)
  "Copy paragraphes at point"
  (interactive "P")
  (let ((beg (progn (backward-paragraph 1)
                    (point)))
        (end (progn (forward-paragraph arg)
                    (point))))
    (copy-region-as-kill beg end)
    (message "copy paragraph")))

(defun w3m-browse-url-other-window (url &optional newwin)
  (let ((w3m-pop-up-windows t))
    (if (one-window-p) (split-window))
    (other-window 1)
    (w3m-browse-url url newwin)))

(defvar toggle-keyboard-setting-on-mac nil)
(defun toggle-keyboard-settings ()
  (interactive)
  (if (not toggle-keyboard-setting-on-mac)
      (progn (setq mac-option-key-is-meta nil
           mac-command-key-is-meta t
           mac-command-modifier 'meta
           mac-option-modifier nil)
         (setq toggle-keyboard-setting-on-mac t))
      (progn (setq mac-option-key-is-meta t
           mac-command-key-is-meta nil
           mac-command-modifier nil
           mac-option-modifier 'meta)
         (setq toggle-keyboard-setting-on-mac nil))))

(defun toggle-sr-speed-with-update ()
  (interactive)
  (progn
    (sr-speedbar-toggle)
    (speedbar-update-contents)))

(provide 'yoyo-functions)
