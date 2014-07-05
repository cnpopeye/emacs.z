;;; init-misc.el --- 

;; Copyright 2013 zc
;;
;; Author: zc@zctekiMacBook-Pro.local
;; Version: $Id: init-misc.el,v 0.0 2013/03/10 10:45:50 zc Exp $
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

;; 

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'init-misc)

;;; Code:

     ;;; set utf-8
    (setq current-language-environment "UTF-8")
    (setq default-buffer-file-coding-system 'utf-8)
    (prefer-coding-system 'utf-8)

    ;;不显示工具栏
    (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

    ;frame settings
    (setq frame-title-format "%b@Emacs -- %f") 

    ;;设置字体
;    (set-default-font "STKaiti-14")

;; Setting English Font
(set-face-attribute
 'default nil :font "monofur 14")

;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "STKaiti" :size 14)))


;;主题设置
(require 'color-theme)
(color-theme-initialize)  
;;启用自制主题 
(zc-theme) 

    ;;设置缺省模式是text，而不是基本模式  
    (setq default-major-mode 'text-mode)  
     
    ;;与其他程序互相能copy/paste  
    (setq x-select-enable-clipboard t)  
      
    ;;显示列号 在下面的工具栏加上行数显示  
    (setq column-number-mode t)  
    
    ;;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。      
    (mouse-avoidance-mode 'animate)

    ;;左边显示行号  
    ;(require 'linum)
    (global-linum-mode 1)  

    ;设置默认的列数是110  
    (setq default-fill-column 110)  
      
    ;;设置kill-ring-max为200  
    (setq kill-ring-max 200)  
            
    ;;下面的这个设置可以让光标指到某个括号的时候显示与它匹配的括号
    (show-paren-mode t)  
    (setq show-paren-style 'parentheses)  
      
    ;;显示日期  
    (setq display-time-day-and-date t)  
    (display-time)  
     
    ;;显示时间  
    (setq display-time-24hr-format t)  
    (setq display-time-day-and-date t)  
    (setq display-time-use-mail-icon t)  
    (setq display-time-interval 10)  
      
    ;;防止页面滚动时跳动  
    (setq scroll-margin 3  
          scroll-conservatively 10000)  
      
    ;;'y' for 'yes', 'n' for 'no'  
    (fset 'yes-or-no-p 'y-or-n-p)

    ;; tab 设置
    ;; 如果设置为 t，光标在 TAB 字符上会显示为一个大方块   
    (setq x-stretch-cursor t)  
    ;;设置tab为4个空格的宽度，而不是原来的2  
    (setq c-basic-offset 4)  
    (setq default-tab-width 4)  
    ;;TAB替换为相应数量的空格
    (setq-default indent-tabs-mode  nil)

   ;;time-stamp -- 记录修改时间  
    (add-hook 'write-file-hooks 'time-stamp)
    (setq time-stamp-format "%:u %02m/%02d/%04y %02H:%02M:%02S")  
    
    ;set shell mode  
    (setq shell-file-name "/bin/bash")   
    (autoload 'ansi-color-for-comint-mode-on 
      "ansi-color" nil t)   
    (add-hook 'shell-mode-hook 
              'ansi-color-for-comint-mode-on t)   

;(add-hook 'comint-input-filter-functions 'rename-buffer-in-ssh-login)   

;; SrSpeedbar is mode make SpeedBar show in Current Frame. 
(require 'sr-speedbar)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-max-width 150)
;;;; speedbar  Show all files 
(setq speedbar-show-unknown-files t) 


;; ido-mode is like magic pixie dust!
(ido-mode t)
(ido-ubiquitous t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)

;; smex
(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

;; markdown
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
;;(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-hook 'markdown-mode-hook 'turn-off-auto-fill)

;;;;;;;; trac wiki
;(require 'w3m-load)
;(require 'mime-w3m)
;(trac-wiki-define-multiple-projects
;                   '("trac"  "test")
;                    "http://youqfo.com:8009/trac" t)

; (autoload 'trac-wiki "trac-wiki"
;                     "Trac wiki editing entry-point." t)

;;shutdown emacs server
;(defun server-shutdown ()
;  "Save Buffers, Quit, and Shutdown (kill) server."
;  (interactive)
;  (desktop-save-in-desktop-dir)
;  (save-some-buffers)
;  (kill-emacs)
; )  

(provide 'init-misc)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; init-misc.el ends here
