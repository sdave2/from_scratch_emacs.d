;; Add Packages Source
(require 'package)
(setq package-enable-at-startup nil)
(setq package-user-dir "~/.emacs.d/elpa/")
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(push "/home/shwetank/bin/" exec-path)

;; Bootstrap 'use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(unless (package-installed-p 'spacemacs-theme)
  (package-refresh-contents)
  (package-install 'spacemacs-theme))


;; Add custom config files in a different directory
(let ((custom-file (expand-file-name "emacs-custom.el" user-emacs-directory))
      (user-config-file (expand-file-name (concat user-login-name ".el") user-emacs-directory)))
  (when (file-exists-p custom-file) (load custom-file))
  (dolist (dir (list "lisp" "config" user-login-name))
    (let ((config-dir (expand-file-name dir user-emacs-directory)))
      (when (file-exists-p config-dir)
        (add-to-list 'load-path config-dir)
        (mapc 'load (directory-files config-dir nil "^[^#].*el$")))))
  (when (file-exists-p user-config-file) (load user-config-file)))





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-rpc-python-command "python3")
 '(package-selected-packages
   (quote
    (slime-company python-pytest flyceck elpy json-mode yaml-mode clj-refactor org-mode multiple-cursors company-quickhelp cider aggressive-indent aggressive-indent-mode rainbow-delimiters rainbow-delimiters-mode rainbow-mode clojure-mode hydra git-gutter-fringe git-gutter expand-region undo-tree avy counsel swiper ivy smartparens which-key magit company flycheck spacemacs-theme)))
 '(python-pytest-arguments (quote ("--color" "--failed-first" "--maxfail=5")))
 '(python-pytest-confirm t)
 '(python-shell-interpreter "python3"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
