(use-package reformatter
  :ensure t
  :config
  ; Adds a reformatter configuration called "+elixir-format"
  ; This uses "mix format -"
  (reformatter-define +elixir-format
    :program "mix"
    :args '("format" "-"))
  ; defines a function that looks for the .formatter.exs file used by mix format
  (defun +set-default-directory-to-mix-project-root (original-fun &rest args)
    (if-let* ((mix-project-root (and buffer-file-name
                                     (locate-dominating-file buffer-file-name
                                                             ".formatter.exs"))))
        (let ((default-directory mix-project-root))
          (apply original-fun args))
      (apply original-fun args)))
  ; adds an advice to the generated function +elxir-format-region that sets the proper root dir
  ; mix format needs to be run from the root directory otherwise it wont use the formatter configuration
  (advice-add '+elixir-format-region :around #'+set-default-directory-to-mix-project-root)
  ; Adds a hook to the major-mode that will add the generated function +elixir-format-on-save-mode
  ; So, every time we save an elixir file it will try to find a .formatter.exs and then run mix format from
  ; that file's directory
  (add-hook 'elixir-mode-hook #'+elixir-format-on-save-mode))

;; (use-package inf-elixir
;;   :pin melpa-stable
;;   :ensure t
;;   :bind (("C-c i i" . 'inf-elixir)
;;          ("C-c i p" . 'inf-elixir-project)
;;          ("C-c i l" . 'inf-elixir-send-line)
;;          ("C-c i r" . 'inf-elixir-send-region)
;;          ("C-c i b" . 'inf-elixir-send-buffer)))

;; (use-package lsp-mode
;;   :commands lsp
;;   :pin melpa-stable
;;   :ensure t
;;   :diminish lsp-mode
;;   :hook
;;   (elixir-mode . lsp)
;;   :init
;;   (add-to-list 'exec-path "/home/shwetank/sandbox/language-servers/elixir/elixir-ls/release"))

;; (use-package lsp-mode
;;   :ensure t
;;   :defer t
;;   :commands (lsp lsp-deferred)
;;   :hook (lsp-mode . efs/lsp-mode-setup)
;;   :init
;;   (setq lsp-keep-workspace-alive nil
;;         lsp-signature-doc-lines 5
;;         lsp-idle-delay 0.5
;;         lsp-prefer-capf t
;;         lsp-client-packages nil
;; 	lsp-keymap-prefix "s-j")
;;   (add-to-list 'exec-path "/home/shwetank/sandbox/language-servers/elixir/elixir-ls/release")
;;   :config
;;   (define-key lsp-mode-map (kbd "s-j") lsp-command-map)
;;   (lsp-enable-which-key-integration t))

(use-package inf-elixir
  :ensure t
  :quelpa
  (smartparens
   :fetcher github
   :repo "J3RN/inf-elixir"
   :commit "141d1288021c28db2684eeb90ee79bd6b1340335"))

;; (use-package elixir-mode
;;   :ensure t
;;   :hook (elixir-mode . lsp-deferred)
;;   :init
;;   (add-hook 'elixir-mode-hook
;;             (lambda ()
;;               (push '(">=" . ?\u2265) prettify-symbols-alist)
;;               (push '("<=" . ?\u2264) prettify-symbols-alist)
;;               (push '("!=" . ?\u2260) prettify-symbols-alist)
;;               (push '("==" . ?\u2A75) prettify-symbols-alist)
;;               (push '("=~" . ?\u2245) prettify-symbols-alist)
;;               (push '("<-" . ?\u2190) prettify-symbols-alist)
;;               (push '("->" . ?\u2192) prettify-symbols-alist)
;;               (push '("<-" . ?\u2190) prettify-symbols-alist)
;;               (push '("|>" . ?\u25B7) prettify-symbols-alist))))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  (add-to-list 'exec-path "/home/shwetank/sandbox/language-servers/elixir/elixir-ls/release")
  :config
  (lsp-enable-which-key-integration t))

(use-package lsp-ui
  :ensure t
  :hook (lsp-ui . lsp-deferred)
  :bind (("M-." . 'lsp-ui-peek-find-definitions)
	 ("M-?" . 'lsp-ui-peek-find-references))
  :config
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-show-with-mouse t))

(use-package elixir-mode
  :mode (("\\.ex\\'" . elixir-mode))
  :ensure t
  :hook (elixir-mode . lsp-deferred)
  :config 'lsp-ui-doc-mode
  :init
  (add-hook 'elixir-mode-hook
            (lambda ()
              (push '(">=" . ?\u2265) prettify-symbols-alist)
              (push '("<=" . ?\u2264) prettify-symbols-alist)
              (push '("!=" . ?\u2260) prettify-symbols-alist)
              (push '("==" . ?\u2A75) prettify-symbols-alist)
              (push '("=~" . ?\u2245) prettify-symbols-alist)
              (push '("<-" . ?\u2190) prettify-symbols-alist)
              (push '("->" . ?\u2192) prettify-symbols-alist)
              (push '("<-" . ?\u2190) prettify-symbols-alist)
              (push '("|>" . ?\u25B7) prettify-symbols-alist))))


;; (use-package elixir-mode
;;   :hook (elixir-mode . lsp-deferred))


(add-to-list 'load-path "/home/shwetank/.emacs.d/non-melpa-packages/ob-elixir")

;; load ob-elixir feature (org-babel for org-mode )
(require 'ob-elixir nil t)

