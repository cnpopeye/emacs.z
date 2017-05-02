;;; init-bindings.el --- 

;; Copyright 2013 zc
;;
;; Author: zc@zctekiMacBook-Pro.local
;; Version: $Id: init-bindings.el,v 0.0 2013/03/10 10:44:03 zc Exp $
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
;;   (require 'init-bindings)

;;; Code:


;;===== global-set-key =====
;; resize window
(global-set-key (kbd "C-^") 'enlarge-window)
(global-set-key (kbd "C-M-^") 'shrink-window)

;; rename buffer
(global-set-key (kbd "C-c r") 'rename-buffer)   

;; rename shell
(global-set-key (kbd "C-c z") 'shell)   

;; tabbar 快捷键
(global-set-key (kbd "<S-tab>") 'tabbar-backward-group)  
;;(global-set-key (kbd "<C-S-iso-lefttab>") 'tabbar-forward-group)  
(global-set-key (kbd "<C-S-tab>") 'tabbar-backward)
(global-set-key (kbd "<C-tab>") 'tabbar-forward)

;; sr-speedbar toggle 
(global-set-key (kbd "<M-return>") 'sr-speedbar-toggle)

;; protobuf-mode 
(global-set-key (kbd "C-c p") 'protobuf-mode)

;;flymakle 
(global-set-key [f10] 'flymake-goto-prev-error)
(global-set-key [f11] 'flymake-goto-next-error)

;;move lines
(global-set-key [S-M-up] 'move-text-up)
(global-set-key [S-M-down] 'move-text-down)


(provide 'init-bindings)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; init-bindings.el ends here
