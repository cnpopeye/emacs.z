;;; init-tabbar.el --- 
 
;; Copyright 2013 zc
;;
;; Author: zc@zctekiMacBook-Pro.local
;; Version: $Id: init-tabbar.el,v 0.0 2013/02/24 09:46:07 zc Exp $
;; Keywords: 
;; X-URL: not distributed yet

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:
;; tabbar 更顺手设置
;;  1. 快捷键
;;  2. 外观，保护视力，保持简单，只修改 height
;;  3. group，需要时
;;

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'init-tabbar)

;;; Code:

(require 'tabbar)  
(tabbar-mode t) 
(define-prefix-command 'lwindow-map)  

;; 设置tabbar外观  
;; 设置默认主题: 字体, 背景和前景颜色，大小  


(set-face-attribute 'tabbar-default nil
          :background "gray50"
;          :family "Bitstream Vera Sans Mono"
          :foreground "gray75"
          :height 1.24)

;; 未选中的tab
;(set-face-attribute 'tabbar-unselected nil
;          :inherit 'tabbar-default
;          :background "gray85"
;          :foreground "gray30"
;          :box nil)

;; 选中的tab
;(set-face-attribute 'tabbar-selected nil
;          :inherit 'tabbar-default
;          :background "#f2f2f6"
;          :foreground "black"
;          :box nil)

;; 左边按钮样式
;(set-face-attribute 'tabbar-button nil
;          :inherit 'tabbar-default
;          :box '(:line-width 1
;             :color "gray72"
;             :style released-button))

;; tab separator设置
;(set-face-attribute 'tabbar-separator nil
;          :height 0.7)


;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; '(tabbar-default ((t (:inherit variable-pitch :background "gray50" :foreground "grey75" :height 1.0)))))


    ;;把除了Emacs Buffer之外的文件都放成一组 默认是将后缀相同的放在一个组  
    ;(setq tabbar-buffer-groups-function  
    ;    (lambda (b) (list "All Buffers")))  
    ;(setq tabbar-buffer-list-function  
    ;    (lambda ()  
    ;        (remove-if  
    ;          (lambda(buffer)  
    ;             (find (aref (buffer-name buffer) 0) " *"))  
    ;          (buffer-list))))  
      
      

(provide 'init-tabbar)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; init-tabbar.el ends here
