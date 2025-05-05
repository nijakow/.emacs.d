
;; (normal-erase-is-backspace-mode (if window-system 0 1)) ;; Ensure the backspace key works on FreeBSD

(setq warning-minimum-level :error)

(setq make-backup-files nil)

(delete-selection-mode 1)
(menu-bar-mode 0)
(tool-bar-mode 0)

(setq-default indent-tabs-mode nil
              tab-width        4)

(global-set-key [C-tab] 'other-window)
(global-set-key [C-iso-lefttab] 'buffer-menu)
(global-set-key [C-S-tab] 'buffer-menu)
; (global-set-key [home] 'buffer-menu)

(setq c-default-style "linux"
      c-basic-offset  4)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;;    C u s t o m   F u n c t i o n s
;;;;

(defun edit-lime-lisp ()
  (interactive)
  (find-file "~/me/workspace/project-horizon/lime-lisp/src/common-lisp-3/")
  (find-file "~/me/workspace/project-horizon/lime-lisp/src/common-lisp-3/modules/compiler/compiler.lisp"))


(defun insert-gnu-c-header-comment ()
  (interactive)
  (insert "/* -*- mode: c; c-file-style: \"gnu\"; c-basic-offset: 2; -*- */"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;;    P a c k a g e   S y s t e m
;;;;

(require 'package)

(setq package-archives
  '(("MELPA"        . "https://melpa.org/packages/")
    ("GNU ELPA"     . "https://elpa.gnu.org/packages/")))

(package-initialize)

(setq efn-package-content-refreshed nil)

(defun efn-ensure-package-content-refreshed ()
  (unless efn-package-content-refreshed
    (setq efn-package-content-refreshed t)
    (package-refresh-contents)))

(defun ensure-package-list (packages)
  (dolist (package packages)
    (unless (package-installed-p package)
      (message "Package %s not installed, installing ..." package)
      (efn-ensure-package-content-refreshed)
      (package-install package))))

(defmacro ensure-packages (&rest package-list)
  `(ensure-package-list '(,@package-list)))

(ensure-packages
 doom-themes
 smalltalk-mode
 forth-mode
 go-mode
 slime)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;;    S l i m e
;;;;

(let ((expanded (expand-file-name "~/quicklisp/slime-helper.el")))
  (when (file-exists-p expanded)
    (load expanded)))

(setq inferior-lisp-program "sbcl")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;;    C u s t o m   V a r i a b l e s
;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(doom-flatwhite))
 '(custom-safe-themes
   '("a9eeab09d61fef94084a95f82557e147d9630fbbb82a837f971f83e66e21e5ad" default))
 '(package-selected-packages '(smalltalk-mode doom-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
