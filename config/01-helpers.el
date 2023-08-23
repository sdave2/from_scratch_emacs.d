;; Stop emacs from displaying start up message
(setq inhibit-startup-message t)
(set-fringe-mode '(1 . 1))

;; Set a way to revert buffer to what the file represents. (Not C-x C-v which deletes undo history) 
(global-set-key (kbd "C-M-g") 'revert-buffer)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; Remove toolbar, menubar, and scrollbar from display
(mapc (lambda (mode) (funcall mode -1)) '(tool-bar-mode menu-bar-mode scroll-bar-mode))

;; Set Highlight line mode. This highlights the line you're currently on
;;(require 'hl-line+)
(use-package hl-line+
  :straight t
  :config
  (global-hl-line-mode 0)
  (toggle-hl-line-when-idle t) ; Highlight only when idle
  )

(use-package which-key
  :straight t
  :config (which-key-setup-minibuffer)
  (which-key-mode))

;; Switch Windows in Specific direction using Shift+Arrow
(windmove-default-keybindings)

;; Jump to characters with Avy
(use-package avy
:straight t
	     :bind ("C-o" . avy-goto-char))

;; Alis yes-no to y-n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Persist history over Emacs restarts.
;; Also helps completion (Vertico) as it can sort by history position.
(use-package savehist
  :init
  (savehist-mode))
