;;; init-dev.el --- 

;; Copyright 2013 zc
;;
;; Author: zc@zctekiMacBook-Pro.local
;; Version: $Id: init-dev.el,v 0.0 2013/03/03 14:07:41 zc Exp $
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
;;   (require 'init-dev)

;;; Code:

;; 代码折叠 
(load-library "hideshow")  
(add-hook 'java-mode-hook 'hs-minor-mode)  
(add-hook 'perl-mode-hook 'hs-minor-mode)  
(add-hook 'php-mode-hook 'hs-minor-mode)  
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)  
(add-hook 'c-mode-common-hook 'hs-minor-mode)  
(add-hook 'ess-mode-hook 'hs-minor-mode)  
(add-hook 'python-mode-hook 'hs-minor-mode)  
(add-hook 'sh-mode-hook 'hs-minor-mode)  
(add-hook 'html-mode-hook 'hs-minor-mode)

;; autopair
(autopair-global-mode)

;;template.el
(require 'template)
;set template dir
(setq template-default-directories (cons "~/.emacs.d/templates/" template-default-directories))
(template-initialize)
;;  template.el cooperate with ido.el
;(add-to-list 'template-find-file-commands
;             'ido-exit-minibuffer)

(dolist (cmd '(ido-select-text ido-magic-forward-char
                               ido-exit-minibuffer))
  (add-to-list 'template-find-file-commands cmd))

;; autocomplete
;(add-to-list 'load-path "~/.emacs.d/site-lisp/auto-complete")
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/auto-complete/ac-dict")
(setq ac-dictionary-files (list (concat user-emacs-directory ".dict")))
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode 1)
;; start complete char
(setq ac-auto-start 1)  
;; do what i mean
(setq ac-dwim t)

                                        
;;; git.el git-status
;  (add-to-list 'load-path ".../git/contrib/emacs")
;(require 'git)
;(require 'git-blame)

;;; python
(require 'init-python)

;; go
(require 'init-go)

;;; haskell
;(load "~/.emacs.d/site-lisp/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;;; json mode
(require 'json-mode)

;;; protobuf mode
(require 'protobuf-mode)
(add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode))


(provide 'init-dev)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; init-dev.el ends here
