
;; 禁止自动生成~为后缀的备份文件
(setq make-backup-files nil)

;; 选中输入替换模式
(delete-selection-mode 1)

;; 启用最近打开的文件
(recentf-mode 1)
(setq recentf-max-menu-items 10)

;; 高亮括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;  自动加载外部修改过的文件
(global-auto-revert-mode 1)

;; 关闭自动保存
(setq auto-save-default nil)

;; 关闭警告音
(setq ring-bell-function 'ignore)

(fset 'yes-or-no-p 'y-or-n-p)


;; 代码缩进
(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

;; bind to key "C-M-\" in init-keybindings.el
(defun indent-region-or-buffer ()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))


;; 光标在中间的时候也高亮括号
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))


(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (unless buffer-display-table
    (setq buffer-display-table (make-display-table)))
  (aset buffer-display-table ?\^M []))

(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;;(remove-dos-eol)


(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))


;; 让Dired mode 重用唯一的缓冲区
(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 每次进入Dired模式时，使用快捷键C-x C-j进入当前文件所在的目录
(require 'dired-x)

;; 当一个窗口中存在两个分屏时，将另一个分屏自动设置成拷贝目标地址
(setq dired-dwim-target 1)


(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))


(provide 'init-better-defaults)
