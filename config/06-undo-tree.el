(use-package undo-tree :ensure t
  :init (global-undo-tree-mode)
  :config (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo"))))
