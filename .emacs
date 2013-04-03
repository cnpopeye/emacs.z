;;设置自己的site-lisp载入路径  
;(setq load-path  
;    (cons (expand-file-name "~/.emacs.d/site-lisp/") load-path))  
;; 递归添加 .emacs.d 目录及子目录到load-path
(let* ((dir (expand-file-name user-emacs-directory ))
  (default-directory dir))
   (when (file-directory-p dir)
    (add-to-list 'load-path dir)
      (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))
(delete-dups load-path))

;; init package 
(require 'init-package)

; 字体、tab、shell、sr-speedbar等设置
(require 'init-misc)

;;;;tabbar  
(require 'init-tabbar)
         
;;move line up down
(require 'move-line-up-down)

;; delete repeated lines
(require 'uniq-lines)

;; develop configure
(require 'init-dev)

;; keybinding
(require 'init-bindings)


;;;;;;;;;;;;;;;;;;;;;;;;;  
;;   THE END           ;;  
;;;;;;;;;;;;;;;;;;;;;;;;;  
;; HACK: 要放在最后,免得会出现比较奇怪的现象  
;; 保存和恢复工作环境  
;; desktop,用来保存Emacs的桌面环境 — buffers、以及buffer的文件名、major modes和位置等等  
;;

;;session
(require 'session)  
(add-hook 'after-init-hook 'session-initialize)  

;;######### Desktop Reload #################
;;use only one desktop
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-dirname '("~/.emacs.d/"))
(setq desktop-base-file-name "emacs-desktop")
(desktop-load-default);;防止重复load，22以后版本无此问题
(desktop-save-mode 1)

