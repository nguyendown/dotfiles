(server-start)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-safe-themes
   (quote
    ("c8cc66aa4576b6f9c70fc703e4852746741e7a9f2ec11850eb7c91a2cfcf6ce0" "01f042d2580d65d72957cf3b21ec1682f58bc457f0e7e898be6c36dbe3b82452" "5b20570781c33819c0b4bcb009305dbe5a9ed12fcedca10e29f1703b5b9d3f96" default)))
 '(package-selected-packages (quote (org auctex eyebrowse markdown-mode ##))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(menu-bar-mode -1)

(setq inhibit-startup-screen t)

(blink-cursor-mode 0)

(global-hl-line-mode t)
(set-face-underline-p 'hl-line nil)

(tool-bar-mode -1)

(scroll-bar-mode -1)

(fringe-mode -1)

(tooltip-mode -1)

(column-number-mode)

(global-unset-key (kbd "C-h"))
(global-set-key [?\C-h] 'delete-backward-char)

;;(global-display-line-numbers-mode)

(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
(load-theme 'gotham t)

(setq backup-by-copying t   ; don't clobber symlinks
      version-control t     ; use versioned backups
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2)

(setq backup-directory-alist '(("." . "~/.emacs.d/emacs-backup")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/emacs-backup/") t))

(desktop-save-mode 1)
(setq desktop-restore-eager 10)
(setq desktop-save t)

(global-set-key "\C-x\C-b" 'buffer-menu)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))
(setq-default c-basic-offset 4)

(setq ring-bell-function 'ignore)

;;(add-hook 'prog-mode-hook
;;          (lambda () (setq c-hungry-delete-key t)))

(setq TeX-auto-save t)
(setq TeX-parse-self t)

;;(add-hook 'python-mode-hook
;;		  (lambda ()
;;            (setq indent-tabs-mode nil)))

(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key [(meta p)]  'move-line-up)
(global-set-key [(meta n)]  'move-line-down)

(setq show-paren-delay 0)
(show-paren-mode 1)

(global-unset-key (kbd "C-x C-c"))

(define-key isearch-mode-map (kbd "C-h") 'isearch-del-char)

(setq help-window-select t)

(eyebrowse-mode t)
(eyebrowse-setup-opinionated-keys)

(global-unset-key (kbd "C-u"))
(global-set-key (kbd "C-u")(lambda ()
                              (interactive)
                              (kill-line 0)
                              (indent-according-to-mode)))

(add-to-list 'auto-mode-alist '("\\.\\(s\\)$" . nasm-mode))

(global-unset-key (kbd "C-w"))
(global-set-key (kbd "C-w")(lambda ()
                             (interactive)
                             (if (use-region-p)
                                 (kill-region (region-beginning) (region-end))
                               (backward-kill-word 1))))
