
;; ----------------------------------------------------
;; Bind build-in functions
;; ----------------------------------------------------
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(global-set-key (kbd "s-/") 'hippie-expand)


;; ----------------------------------------------------
;; Bind custom functions
;; ----------------------------------------------------
(global-set-key (kbd "<f2>") 'my/open-init-file)
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)
(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)
(global-set-key (kbd "M-s o") 'occur-dwim)


;; ----------------------------------------------------
;; Bind third party packages
;; ----------------------------------------------------
;; ivy & swiper & counsel keybindings
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-h l") 'counsel-find-library)
;;(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;;(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "M-s i") 'counsel-imenu)

(global-set-key (kbd "C-=") 'er/expand-region)

;; js2-refactor
(js2r-add-keybindings-with-prefix "C-c C-m")

(provide 'init-keybindings)
