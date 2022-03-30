;;(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

;; Prettify symbols in emasc lisp files
(add-hook 'emacs-lisp-mode-hook (lambda () (prettify-symbols-mode +1)))

(setenv   "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")
;; slime setup
(use-package slime
  :ensure t
  :pin melpa-stable
  ;;  :init (load (expand-file-name "~/.quicklisp/slime-helper.el"))
  :bind (("<C-M-backspace>" . 'backward-kill-sexp))
  :config
  (setq slime-lisp-implementations
	'((sbcl  ("/usr/bin/sbcl" "--dynamic-space-size" "2GB") :coding-system utf-8-unix))
	slime-net-coding-system 'utf-8-unix
	slime-export-save-file t
	slime-contribs '(slime-fancy slime-repl slime-scratch slime-trace-dialog slime-tramp)
	lisp-simple-loop-indentation  1
	lisp-loop-keyword-indentation 6
	lisp-loop-forms-indentation   6)
  (global-set-key "\C-z" 'slime-selector)
  (autoload 'paredit-mode "paredit" "Minor mode for structurally editing Lisp code." t)
  (add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
  (add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
  (add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
  (add-hook 'scheme-mode-hook           (lambda () (paredit-mode +1)))
  (add-hook 'slime-repl-mode-hook       (lambda () (paredit-mode +1)))
  (add-hook 'slime-load-hook            (lambda () (require 'slime-fancy)))
  (add-hook 'enable-paredit-mode        (lambda () (paredit-mode +1)))
  (add-hook 'slime-repl-mode-hook       'override-slime-repl-bindings-with-paredit)
  (add-hook 'lisp-mode-hook (lambda () (prettify-symbols-mode +1)))
  (add-hook 'slime-repl-mode-hook (lambda () (prettify-symbols-mode +1)))
  (show-paren-mode 1))



;; Stop SLIME's REPL from grabbing DEL, which is annoying when
;; backspacing over a '('
(defun override-slime-repl-bindings-with-paredit ()
  (define-key slime-repl-mode-map
    (read-kbd-macro paredit-backward-delete-key) nil))

(use-package slime-docker
  :ensure t
  :custom
  (slime-docker-program "sbcl"))


