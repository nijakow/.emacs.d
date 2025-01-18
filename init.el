
(normal-erase-is-backspace-mode (if window-system 0 1)) ;; Ensure the backspace key works on FreeBSD

(setq make-backup-files nil)

(delete-selection-mode 1)
(menu-bar-mode 0)
(tool-bar-mode 0)

(global-set-key [C-tab] 'other-window)
(global-set-key [C-iso-lefttab] 'buffer-menu)
(global-set-key [home] 'buffer-menu)

(setq c-default-style "linux"
      c-basic-offset  4)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;;    P a c k a g e   S y s t e m
;;;;

(package-initialize)

(defun ensure-package-list (packages)
  (dolist (package packages)
    (unless (package-installed-p package)
      (message "Package %s not installed" package))))

(defmacro ensure-packages (&rest package-list)
  `(ensure-package-list '(,@package-list)))

(ensure-packages
 smalltalk-mode)


