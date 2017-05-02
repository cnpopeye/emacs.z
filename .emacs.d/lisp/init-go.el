;;; init-go.el --- 

;; Copyright 2013 zc
;;
;; Author: zc@zctekiMacBook-Pro.local
;; Version: $Id: init-go.el,v 0.0 2013/12/01 09:54:38 zc Exp $
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
;;   (require 'init-go)

;;; Code:

;; golang mode

;; set env for go
(setenv "GOPATH" "/Users/zc/workspace/go")
(add-to-list 'exec-path "/Users/zc/workspace/go/bin")

;; whenever you save a Go file, it will automatically reformat the file with gofmt.
;(add-hook 'before-save-hook 'gofmt-before-save)

;; Autocomplete if you open a .go file the mode should be Go AC (AC == AutoComplete)
;(defun auto-complete-for-go ()
;  (auto-complete-mode 1))
;(add-hook 'go-mode-hook 'auto-complete-for-go)

;; go-autocomplete, The basic autocomplete installed is not as “go aware” as it should be.
;; The go-autocomplete (aka nsf/gocode) package fixes that.
(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)
;You’ll also need the following (as recommended in https://github.com/nsf/gocode/issues/325):
(with-eval-after-load 'go-mode
  (require 'go-autocomplete))

;; Use goimports instead of go-fmt
;;The idea of goimports is that every time you save a file, it will automatically update all of your imports, so you don’t have to. 
;(setq gofmt-command "goimports")


;; 将以上几个集中到一个hook中
(defun my-go-mode-hook ()
  ; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go generate && go build -v && go test -v && go vet"))
  ;;goflymake
  (load-file "$GOPATH/src/github.com/dougm/goflymake/go-flymake.el")
 
  ; Go oracle
  ; (load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")
  ; Godef jump key binding
  ; (local-set-key (kbd "M-.") 'godef-jump)
  ; (local-set-key (kbd "M-*") 'pop-tag-mark)
)
(add-hook 'go-mode-hook 'my-go-mode-hook)



(provide 'init-go)
(eval-when-compile
  (require 'cl))




;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; init-go.el ends here



;; The Go Oracle will blow your mind!
;; It can do things like find all the callers of a given function/method.
;; It can also show you all the functions that read or write from a given channel.
;; In short, it rocks.
;;(load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")

;; godef  it lets you quickly jump around the code,
;; as you might be used to with a full featured IDE.
;; doing M-x godef-jump to jump into the method, and M-* to go back.
;; godef key bindings   *****暂时不自定义绑定*****
;;(defun my-go-mode-hook ()
;;  ; Call Gofmt before saving                                                    
;;  (add-hook 'before-save-hook 'gofmt-before-save)
;;  ; Godef jump key binding                                                      
;;  (local-set-key (kbd "M-.") 'godef-jump)
;;  (local-set-key (kbd "M-*") 'pop-tag-mark)
;;  )
;;(add-hook 'go-mode-hook 'my-go-mode-hook)

;;(require 'go-mode-load)
;;(require 'go-autocomplete)
;;(speedbar-add-supported-extension ".go")
;;(add-hook
;;'go-mode-hook
;;'(lambda ()
;;    ;; gocode
;;    (auto-complete-mode 1)
;;    (setq ac-sources '(ac-source-go))
;;    ;; Imenu & Speedbar
;;    (setq imenu-generic-expression
;;        '(("type" "^type *\\([^ \t\n\r\f]*\\)" 1)
;;        ("func" "^func *\\(.*\\) {" 1)))
;;    (imenu-add-to-menubar "Index")
;;    ;; Outline mode
;;    (make-local-variable 'outline-regexp)
;;    (setq outline-regexp "//\\.\\|//[^\r\n\f][^\r\n\f]\\|pack\\|func\\|impo\\|cons\\|var.\\|type\\|\t\t*....")
;;    (outline-minor-mode 1)
;;    (local-set-key "\M-a" 'outline-previous-visible-heading)
;;    (local-set-key "\M-e" 'outline-next-visible-heading)
;;    ;; Menu bar
;;    (require 'easymenu)
;;    (defconst go-hooked-menu
;;        '("Go tools"
;;        ["Go run buffer" go t]
;;        ["Go reformat buffer" go-fmt-buffer t]
;;        ["Go check buffer" go-fix-buffer t]))
;;    (easy-menu-define
;;        go-added-menu
;;        (current-local-map)
;;        "Go tools"
;;        go-hooked-menu)
;;
;;    ;; Other
;;    (setq show-trailing-whitespace t)
;;    ))
;;;; helper function
;;(defun go ()
;;    "run current buffer"
;;    (interactive)
;;    (compile (concat "go run " (buffer-file-name))))
;;
;;;; helper function
;;(defun go-fmt-buffer ()
;;    "run gofmt on current buffer"
;;    (interactive)
;;    (if buffer-read-only
;;    (progn
;;        (ding)
;;        (message "Buffer is read only"))
;;    (let ((p (line-number-at-pos))
;;    (filename (buffer-file-name))
;;    (old-max-mini-window-height max-mini-window-height))
;;        (show-all)
;;        (if (get-buffer "*Go Reformat Errors*")
;;    (progn
;;        (delete-windows-on "*Go Reformat Errors*")
;;        (kill-buffer "*Go Reformat Errors*")))
;;        (setq max-mini-window-height 1)
;;        (if (= 0 (shell-command-on-region (point-min) (point-max) "gofmt" "*Go Reformat Output*" nil "*Go Reformat Errors*" t))
;;    (progn
;;        (erase-buffer)
;;        (insert-buffer-substring "*Go Reformat Output*")
;;        (goto-char (point-min))
;;        (forward-line (1- p)))
;;    (with-current-buffer "*Go Reformat Errors*"
;;    (progn
;;        (goto-char (point-min))
;;        (while (re-search-forward "<standard input>" nil t)
;;        (replace-match filename))
;;        (goto-char (point-min))
;;        (compilation-mode))))
;;        (setq max-mini-window-height old-max-mini-window-height)
;;        (delete-windows-on "*Go Reformat Output*")
;;        (kill-buffer "*Go Reformat Output*"))))
;;;; helper function
;;(defun go-fix-buffer ()
;;    "run gofix on current buffer"
;;    (interactive)
;;    (show-all)
;;    (shell-command-on-region (point-min) (point-max) "go tool fix -diff"))
;;
;;(provide 'init-go)
;;(eval-when-compile
;;  (require 'cl))


;;
;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; init-go.el ends here
