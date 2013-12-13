;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (autopair-global-mode autopair-mode) "autopair/autopair"
;;;;;;  "autopair/autopair.el" (21152 20365))
;;; Generated autoloads from autopair/autopair.el

(autoload 'autopair-mode "autopair/autopair" "\
Automagically pair braces and quotes like in TextMate.

\(fn &optional ARG)" t nil)

(defvar autopair-global-mode nil "\
Non-nil if Autopair-Global mode is enabled.
See the command `autopair-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `autopair-global-mode'.")

(custom-autoload 'autopair-global-mode "autopair/autopair" nil)

(autoload 'autopair-global-mode "autopair/autopair" "\
Toggle Autopair mode in all buffers.
With prefix ARG, enable Autopair-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Autopair mode is enabled in all buffers where
`autopair-on' would do it.
See `autopair-mode' for more information on Autopair mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (el-get-checksum el-get-make-recipes el-get-cd
;;;;;;  el-get-self-update el-get-update-all el-get-version) "el-get/el-get"
;;;;;;  "el-get/el-get.el" (21152 18595))
;;; Generated autoloads from el-get/el-get.el

(autoload 'el-get-version "el-get/el-get" "\
Message the current el-get version

\(fn)" t nil)

(autoload 'el-get-update-all "el-get/el-get" "\
Performs update of all installed packages.

\(fn &optional NO-PROMPT)" t nil)

(autoload 'el-get-self-update "el-get/el-get" "\
Update el-get itself.  The standard recipe takes care of reloading the code.

\(fn)" t nil)

(autoload 'el-get-cd "el-get/el-get" "\
Open dired in the package directory.

\(fn PACKAGE)" t nil)

(autoload 'el-get-make-recipes "el-get/el-get" "\
Loop over `el-get-sources' and write a recipe file for each
entry which is not a symbol and is not already a known recipe.

\(fn &optional DIR)" t nil)

(autoload 'el-get-checksum "el-get/el-get" "\
Compute the checksum of the given package, and put it in the kill-ring

\(fn PACKAGE &optional PACKAGE-STATUS-ALIST)" t nil)

;;;***

;;;### (autoloads (el-get-list-packages) "el-get/el-get-list-packages"
;;;;;;  "el-get/el-get-list-packages.el" (21152 18595))
;;; Generated autoloads from el-get/el-get-list-packages.el

(autoload 'el-get-list-packages "el-get/el-get-list-packages" "\
Display a list of packages.

\(fn)" t nil)

;;;***

;;;### (autoloads (ido-ubiquitous-mode) "ido-ubiquitous/ido-ubiquitous"
;;;;;;  "ido-ubiquitous/ido-ubiquitous.el" (21152 20474))
;;; Generated autoloads from ido-ubiquitous/ido-ubiquitous.el

(define-obsolete-variable-alias 'ido-ubiquitous 'ido-ubiquitous-mode "0.8")

(define-obsolete-function-alias 'ido-ubiquitous 'ido-ubiquitous-mode "0.8")

(defvar ido-ubiquitous-mode nil "\
Non-nil if Ido-Ubiquitous mode is enabled.
See the command `ido-ubiquitous-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `ido-ubiquitous-mode'.")

(custom-autoload 'ido-ubiquitous-mode "ido-ubiquitous/ido-ubiquitous" nil)

(autoload 'ido-ubiquitous-mode "ido-ubiquitous/ido-ubiquitous" "\
Use `ido-completing-read' instead of `completing-read' almost everywhere.

  This mode has no effect unles `ido-mode' is also enabled.

  If this mode causes problems for a function, you can customize
  when ido completion is or is not used by customizing
  `ido-ubiquitous-command-overrides' or
  `ido-ubiquitous-function-overrides'.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (gfm-mode markdown-mode) "markdown-mode/markdown-mode"
;;;;;;  "markdown-mode/markdown-mode.el" (21152 20411))
;;; Generated autoloads from markdown-mode/markdown-mode.el

(autoload 'markdown-mode "markdown-mode/markdown-mode" "\
Major mode for editing Markdown files.

\(fn)" t nil)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode/markdown-mode" "\
Major mode for editing GitHub Flavored Markdown files.

\(fn)" t nil)

;;;***

;;;### (autoloads (smex-initialize smex) "smex/smex" "smex/smex.el"
;;;;;;  (21152 20369))
;;; Generated autoloads from smex/smex.el

(autoload 'smex "smex/smex" "\


\(fn)" t nil)

(autoload 'smex-initialize "smex/smex" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (virtualenv-minor-mode virtualenv-deactivate virtualenv-workon)
;;;;;;  "virtualenv/virtualenv" "virtualenv/virtualenv.el" (21153
;;;;;;  7526))
;;; Generated autoloads from virtualenv/virtualenv.el

(autoload 'virtualenv-workon "virtualenv/virtualenv" "\
Activate a virtual environment for python.
Optional argument ENV if non-nil, either use the string given as
the virtual environment or if not a string then query the user.

\(fn &optional ENV)" t nil)

(autoload 'virtualenv-deactivate "virtualenv/virtualenv" "\


\(fn)" t nil)

(autoload 'virtualenv-minor-mode "virtualenv/virtualenv" "\
Toggle Virtualenv minor mode on or off.
With a prefix argument ARG, enable Virtualenv minor mode if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
the mode if ARG is omitted or nil, and toggle it if ARG is `toggle'.
\\{virtualenv-minor-mode-map}

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("autopair/autopair-tests.el" "deferred/concurrent-sample.el"
;;;;;;  "deferred/concurrent.el" "deferred/deferred-samples.el" "deferred/deferred.el"
;;;;;;  "deferred/test-concurrent.el" "deferred/test-deferred.el"
;;;;;;  "el-expectations/el-expectations.el" "el-get/el-get-autoloads.el"
;;;;;;  "el-get/el-get-build.el" "el-get/el-get-byte-compile.el"
;;;;;;  "el-get/el-get-core.el" "el-get/el-get-custom.el" "el-get/el-get-dependencies.el"
;;;;;;  "el-get/el-get-install.el" "el-get/el-get-methods.el" "el-get/el-get-notify.el"
;;;;;;  "el-get/el-get-recipes.el" "el-get/el-get-status.el" "fuzzy/fuzzy.el"
;;;;;;  "ido-ubiquitous/ido-ubiquitous-autoloads.el" "ido-ubiquitous/ido-ubiquitous-pkg.el"
;;;;;;  "java-mode-indent-annotations/java-mode-indent-annotations.el"
;;;;;;  "python-mode/python-mode.el") (21153 7526 618964))

;;;***

(provide '.loaddefs)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here
