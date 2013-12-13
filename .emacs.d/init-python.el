;;; init-python.el --- 

;; Copyright 2013 zc
;;
;; Author: zc@zctekiMacBook-Pro.local
;; Version: $Id: init-python.el,v 0.0 2013/03/10 11:05:03 zc Exp $
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
;;   (require 'init-python)

;;; Code:

; set enviroments on Mac OSX,is required.
(setenv "WORKON_HOME" "~/.virtualenvs")
(setenv "PATH"
        (concat
         (getenv "PATH")
            ":""/usr/local/bin"
            ":""/usr/local/sbin"))
; set user-dir
;(setq user-dir (concat user-emacs-directory user-login-name))
;(setq smex-save-file (concat user-emacs-directory ".smex-items"))

;; Set up python-mode
;(setq py-install-directory (concat user-dir "/python-mode.el-6.0.12/")) 
;(setq py-install-directory (concat user-emacs-directory "site-lisp/python-mode.el-6.1.1/"))
;(add-to-list 'load-path py-install-directory)

;; this will show method signatures while typing
;(setq py-set-complete-keymap-p t)
;(require 'python-mode)


(add-to-list 'load-path "el-get/python-mode/") 
(setq py-install-directory "el-get/python-mode/")
(require 'python-mode)



(require 'virtualenv)
(setq virtualenv-workon-starts-python nil)
;(add-hook 'python-mode-hook '(lambda()
;                               ;without this,will get a error
;                               (setq virtualenv-workon-starts-python nil)
;                               (virtualenv-workon nil)))

;; jedi
;(autoload 'jedi:setup "jedi" nil t) 
(require 'jedi)

;(add-hook 'python-mode-hook '(lambda ()
;                               (setq jedi:setup-keys t)  
;                               (setq jedi:complete-on-dot t)  
;                               (when (fboundp 'jedi:setup) (jedi:setup))  ))

(add-hook 'python-mode-hook '(lambda ()
                               (setq jedi:setup-keys t)
                               (setq jedi:complete-on-dot t)
                               (jedi:setup) ))


;(add-hook 'python-mode-hook 'jedi:ac-setup)



;pymacs 
;(require 'pymacs) 

;(defun load-pycomplete ()
;  "Load and initialize pycomplete."
;;   (interactive)
;;   (let* ((pyshell (py-choose-shell))
;;          (path (getenv "PYTHONPATH")))
;;     (setenv "PYTHONPATH" (concat
;;                           (expand-file-name py-install-directory) "completion"
;;                           (if path (concat path-separator path))))
;;     (if (py-install-directory-check)
;;         (progn
;;           (setenv "PYMACS_PYTHON" (if (string-match "IP" pyshell) 
;;                                       "python"
;;                                     pyshell))
;;           (autoload 'pymacs-apply "pymacs")
;;           (autoload 'pymacs-call "pymacs")
;;           (autoload 'pymacs-eval "pymacs")
;;           (autoload 'pymacs-exec "pymacs")
;;           (autoload 'pymacs-load "pymacs")
;;           (load (concat py-install-directory "completion/pycomplete.el") nil t)
;;           (add-hook 'python-mode-hook 'py-complete-initialize))
;;       (error "`py-install-directory' not set, see INSTALL"))))

;; (eval-after-load 'pymacs '(load-pycomplete))



;; pyflakes flymake integration
;; http://stackoverflow.com/a/1257306/347942
;;(setq pycheckers-command "~/.emacs.d/pycheckers")

  (when (load "flymake" t)
    (defun flymake-pyflakes-init ()
      (let* ((temp-file (flymake-init-create-temp-buffer-copy
                         'flymake-create-temp-inplace))
             (local-file (file-relative-name
                          temp-file
                          (file-name-directory buffer-file-name))))
        (list "/usr/local/bin/pyflakes" (list local-file))))
    (add-to-list 'flymake-allowed-file-name-masks
                 '("\\.py\\'" flymake-pyflakes-init)))
  (add-hook 'python-mode-hook 'flymake-mode)
  (load-library "flymake-cursor")  ;在minibuffer显示错误信息

  (custom-set-faces
       '(flymake-errline ((((class color)) (:underline "red"))))
       '(flymake-warnline ((((class color)) (:underline "yellow2")))))
 (setq flymake-no-changes-timeout 600)


(provide 'init-python)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; init-python.el ends here
