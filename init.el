
;; (normal-erase-is-backspace-mode (if window-system 0 1)) ;; Ensure the backspace key works on FreeBSD

(setq make-backup-files nil)

(delete-selection-mode 1)
(menu-bar-mode 0)
(tool-bar-mode 0)

(global-set-key [C-tab] 'other-window)
(global-set-key [C-iso-lefttab] 'previous-window-any-frame)
(global-set-key [home] 'buffer-menu)

(setq c-default-style "linux"
      c-basic-offset  4)


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

 lsp-mode yasnippet lsp-treemacs helm-lsp projectile hydra flycheck company avy which-key helm-xref dap-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;;    L s p   S t u f f
;;;;
;;;; See also: https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/
;;;;

(which-key-mode)

(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)


(setq lsp-enable-symbol-highlighting t
      lsp-ui-doc-enable t
      lsp-ui-doc-show-with-cursor t
      lsp-ui-doc-show-with-mouse t
      lsp-ui-doc-enable t
      lsp-lens-enable t
      lsp-eldoc-enable-hover t
      lsp-ui-sideline-enable t
      lsp-ui-sideline-show-diagnostics t)

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))


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
