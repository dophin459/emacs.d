
;; 默认启动全屏
(setq initial-frame-alist '((fullscreen . maximized)))

;; 关闭工具栏
(tool-bar-mode -1)

;; 关闭滚动条
(scroll-bar-mode -1)

;; 关闭启动帮助画面
(setq inhibit-splash-screen t)

;; set a default font
(when (member "Source Code Pro" (font-family-list))
  (set-face-attribute 'default nil :font "Source Code Pro-14"))

;; 显示行号
(global-linum-mode 1)

;; 设置光标样式
(setq-default cursor-type 'bar)

;; 高亮显示当前行
(global-hl-line-mode 1)

(provide 'init-ui)
