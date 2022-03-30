(use-package rainbow-mode :ensure t)
(use-package rainbow-delimiters :ensure t)
(use-package aggressive-indent :ensure t)

(use-package clojure-mode :ensure t
  :config (progn
	    (add-hook 'clojure-mode-hook #'smartparens-strict-mode)
	    (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
	    (add-hook 'clojure-mode-hook #'aggressive-indent-mode)))

(use-package cider :ensure t)

;; Add clj refactor
(defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m"))

(use-package clj-refactor :ensure t
  :config (progn
	    (add-hook 'clojure-mode-hook #'my-clojure-mode-hook)))
