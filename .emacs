(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; Hide the tool-bar
(tool-bar-mode -1)
; Hide the menu-bar
(menu-bar-mode -1)
; Hide the tooltip
(tooltip-mode -1)
; Show line number
(global-linum-mode t)

; Disable auto-save
(setq auto-save-default nil)
; Disable the creation of backup files
(setq make-backup-files nil)

; Disable the check for modified buffers when exiting
(defun my-kill-emacs ()
  (interactive)
  (save-some-buffers nil t)
  (kill-emacs))
(global-set-key (kbd "C-x C-c") 'my-kill-emacs)

; Auto-indentation
(define-key global-map (kbd "RET") 'newline-and-indent)
; No tabs
(setq-default indent-tabs-mode nil)

; Use K&R style
(setq c-default-style
      '((java-mode . "java")
	(awk-mode . "awk")
	(other . "k&r")))

; Keyboard scroll one line at a time
(setq scroll-step 1)
; Scrolling down the view
(global-set-key (kbd "M-n") (lambda () (interactive) (scroll-up 1)))
(global-set-key (kbd "M-<down>") (lambda () (interactive) (scroll-up 4)))
; Scrolling up the view
(global-set-key (kbd "M-p") (lambda () (interactive) (scroll-down 1)))
(global-set-key (kbd "M-<up>") (lambda () (interactive) (scroll-down 4)))

; Use /bin/zsh as explicit shell
(setq explicit-shell-file-name "/bin/zsh")

; Enable ElScreen
; [AUR] emacs-elscreen-emacs24-git
(load "elscreen" "ElScreen" t)
(elscreen-start)
(setq elscreen-tab-display-kill-screen nil)
(global-set-key (kbd "<C-tab>") 'elscreen-next)
(global-set-key (kbd "<header-line> <mouse-5>") 'elscreen-next)
(global-set-key (kbd "<C-S-iso-lefttab>") 'elscreen-previous)
(global-set-key (kbd "<header-line> <mouse-4>") 'elscreen-previous)

; C-z SPC
; Open all buffers in individual screens
(defun all-buffers-elscreen ()
  (interactive)
  (setq temp-list (buffer-list))
  (while temp-list
    (setq file-name (buffer-file-name (car temp-list)))
    (if file-name
        (elscreen-find-file file-name))
    (setq temp-list (cdr temp-list))))
(global-set-key (kbd "C-z SPC") 'all-buffers-elscreen)

; Enable ElScreen-dnd
; With ElScreen-dnd, new screens are automatically created for each file drag&dropped
(load "elscreen-dnd")
(setq elscreen-dnp-drag-n-drop t)

; Load Haskell Mode
; [Arch] emacs-haskell-mode
(require 'haskell-mode-autoloads)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

; Load Lua Mode
; [Arch] emacs-lua-mode
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))

; Load Python Mode
; [Arch] emacs-python-mode
(autoload 'python-mode "python-mode.el" "Python mode." t)
(setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist))

; Load Clojure Mode
; [AUR] emacs-clojure-mode-git
(require 'clojure-mode)

; Load Emmet Mode
; [AUR] emacs-emmet-mode-git
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)

; Load Idris Mode
; [AUR] emacs-idris-mode-git
(require 'idris-mode)

; Load Markdown Mode
; [AUR] emacs-markdown-mode
(autoload 'markdown-mode "markdown-mode" "Markdown mode" t)
(setq auto-mode-alist (cons '("\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\.markdown" . markdown-mode) auto-mode-alist))

; Load SML Mode
; [AUR] emacs-sml-mode
(require 'sml-mode)

; Load Whitespace Mode
; [AUR] emacs-whitespace-mode
(autoload 'whitespace-mode "whitespace-mode.el" "Whitespace editing mode." t)
(setq auto-mode-alist (cons '("\.ws$" . whitespace-mode) auto-mode-alist))

; Load YAML Mode
; [AUR] emacs-yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\.yml\'" . yaml-mode))
