;; ;; Python-mode
;; (use-package python-mode :ensure t
;;   :config (add-hook 'python-mode-hook
;;           (function (lambda ()
;;                       (setq indent-tabs-mode nil
;;                             tab-width 2)))))
;; (use-package elpy :ensure t
;;   :init (elpy-enable))


(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable)
  (add-hook 'python-mode-hook
          (lambda ()
	    (define-key python-mode-map "\r" 'newline-and-indent)))
  (add-hook 'python-mode-hook '(lambda () 
				 (setq python-indent 4)))
  (setq elpy-shell-starting-directory 'current-directory)
  )

;; ====================================
;; Development Setup
;; ====================================
;; Enable elpy
(elpy-enable)

;; Enable Flycheck
(use-package flycheck :ensure t
  :init   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  :config   (add-hook 'elpy-mode-hook 'flycheck-mode))

(use-package python-pytest
  :custom
  (python-pytest-confirm t)
  (python-pytest-arguments
   '("--color"          ;; colored output in the buffer
     "--failed-first"   ;; run the previous failed tests first
     "--maxfail=5"))    ;; exit in 5 continuous failures in a run
  )

;; Set venv directory
(setenv "WORKON_HOME" "/home/shwetank/py-venv")

;; Set the PDB command
(add-hook 'python-mode-hook
       (lambda () (setq gud-pdb-command-name "python -m pdb")))
