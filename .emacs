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

(defun uniquify-region-lines (beg end)
    "Remove duplicate adjacent lines in region."
    (interactive "*r")
    (save-excursion
      (goto-char beg)
      (while (re-search-forward "^\\(.*\n\\)\\1+" end t)
        (replace-match "\\1"))))
  
  (defun uniquify-buffer-lines ()
    "Remove duplicate adjacent lines in the current buffer."
    (interactive)
    (uniquify-region-lines (point-min) (point-max)))

;; init package 
;(require 'init-package)

;; init el-get
(require 'init-el-get)

;; epc jedi
(require 'epc)

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((virtualenv-workon . \"defalut\"))))
 '(session-use-package t nil (session)))
