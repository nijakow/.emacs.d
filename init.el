
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
