;; (use-package cider-eval-sexp-fu
;;   :defer t)

;; (use-package paredit
;;   :defer t)

;; (use-package clj-refactor
;;   :defer t
;;   :straight t
;;   :diminish clj-refactor-mode
;;   :config (cljr-add-keybindings-with-prefix "C-c C-m"))

;; (use-package smartparens
;;   :defer t
;;   :straight t
;;   :diminish smartparens-mode
;;   :init
;;   (setq sp-override-key-bindings
;;         '(("C-<right>" . nil)
;;           ("C-<left>" . nil)
;;           ("C-)" . sp-forward-slurp-sexp)
;;           ("M-<backspace>" . nil)
;;           ("C-(" . sp-forward-barf-sexp)))
;;   :config
;;   (use-package smartparens-config)
;;   (sp-use-smartparens-bindings)
;;   (sp--update-override-key-bindings)
;;   :commands (smartparens-mode show-smartparens-mode))

;; (use-package clojure-mode
;;   :straight t
;;   :mode (("\\.clj\\'" . clojure-mode)
;;          ("\\.edn\\'" . clojure-mode))
;;   :init
;;   (add-hook 'clojure-mode-hook #'yas-minor-mode)         
;;   (add-hook 'clojure-mode-hook #'linum-mode)             
;;   (add-hook 'clojure-mode-hook #'subword-mode)           
;;   (add-hook 'clojure-mode-hook #'smartparens-mode)       
;;   (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
;;   (add-hook 'clojure-mode-hook #'eldoc-mode)             
;;   (add-hook 'clojure-mode-hook #'idle-highlight-mode)
;;   (add-hook 'clojure-mode-hook #'paredit-mode)
;;   :config
;;   (enable-paredit-mode))

;; (use-package cider
;;   :straight t
;;   :defer t
;;   :hook (cider-mode-hook .  clj-refactor-mode)
;;   :diminish subword-mode
;;   :config
;;   (setq nrepl-log-messages t                  
;;         cider-repl-display-in-current-window t
;;         cider-repl-use-clojure-font-lock t    
;;         cider-prompt-save-file-on-load 'always-save
;;         cider-font-lock-dynamically '(macro core function var)
;;         nrepl-hide-special-buffers t            
;;         cider-overlays-use-font-lock t)         
;;   (cider-repl-toggle-pretty-printing))
