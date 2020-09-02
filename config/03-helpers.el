;; Save desktop on exit
(desktop-save-mode 1)

;; Stop emacs from displaying start up message
(setq inhibit-startup-message t)
(set-fringe-mode '(1 . 1))

;; Set a way to revert buffer to what the file represents. (Not C-x C-v which deletes undo history) 
(global-set-key (kbd "C-M-g") 'revert-buffer)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; Remove toolbar, menubar, and scrollbar from display
(mapc (lambda (mode) (funcall mode -1)) '(tool-bar-mode menu-bar-mode scroll-bar-mode))

;; Set Highlight line mode. This highlights the line you're currently on
(global-hl-line-mode t)

;; Overwrite comment
(setq spacemacs-theme-comment-bg nil)

;; Set theme to spaceemacs-dark theme
(load-theme 'spacemacs-light t)

;; Overwrite global-hl-face color
(set-face-background hl-line-face "Gray")


(use-package which-key :ensure t
  :config (which-key-setup-minibuffer)
  (which-key-mode))


;; Enhance M-x to allow easier execution of commands
(use-package smex
  :ensure t
  ;; Using counsel-M-x for now. Remove this permanently if counsel-M-x works better.
  :disabled t
  :config
  (setq smex-save-file (concat user-emacs-directory ".smex-items"))
  (smex-initialize)
  :bind ("M-x" . smex))



;; Switch Windows in Specific direction using Shift+Arrow
(windmove-default-keybindings)

;; Jump to characters with Avy
(use-package avy :ensure t
	     :bind ("C-o" . avy-goto-char))

;; Alis yes-no to y-n
(defalias 'yes-or-no-p 'y-or-n-p)

;; stop autosaving
(setq auto-save-default nil
      visible-bell t)


;; Setting backup directory for buffer files (incase emacs shuts down unepectedly)
;; backup-directory-alist expects a list (as name suggests). The backquote ',' is there on purpose
(setq backup-directory-alist `(("." . ,(expand-file-name ".saves" user-emacs-directory))))
(setq make-backup-files t)

;; Expand Regin -> mapped to C-=
(use-package expand-region
  :ensure t
  :config (progn
	    (global-set-key (kbd "C-=") 'er/expand-region)))

;; Set column-number-mode globally
(setq column-number-mode 1)


;; Set this so you can overwrite a selected region
(delete-selection-mode 1)
