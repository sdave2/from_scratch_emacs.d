(defun evaulate-confirmation (lang body)
  "This function needs to return nil"
  (not (member lang '("lisp" "python"))))

(use-package uuidgen
  :ensure t)

(use-package org :ensure t
  :init (progn (setq org-confirm-babel-evaluate 'evaulate-confirmation)
	       (setq org-src-window-setup 'split-window-below))
  :config (progn
	    (org-babel-do-load-languages
	     'org-babel-load-languages
	     '((lisp . t)
	       (emacs-lisp . t)
	       (python . t)))
	    (add-to-list 'org-structure-template-alist '("L" . "src lisp \n"))
	    (add-to-list 'load-path "~/.emacs.d/external-packages/ob-elixir"))
  :bind (:map org-mode-map
	      ("C-<right>" . org-shiftright)
	      ("<C-S-right>" . org-shiftright) 
	      ("<C-S-left>" . org-shiftleft)
	      ("<S-right>" . nil)
	      ("<S-left>" . nil)
	      ("<S-up>" . nil)
	      ("<S-down>" . nil)
	      ("C-c l" . (lambda () (interactive) (org-insert-structure-template "src lisp\n")))
	      ("C-c e" . (lambda () (interactive) (org-insert-structure-template "src elixir\n"))))
  :hook ((org-mode . org-indent-mode)
	 (org-mode . (lambda () (visual-line-mode 1)))))

;; (use-package org-roam
;;   :ensure t
;;   ;; :pin melpa-stable
;;   :hook (after-init . org-roam-mode)
;;   :init (setq org-roam-v2-ack t)
;;   :custom
;;   (org-roam-directory "~/OrgRoam/notes")
;;   (org-roam-completion-everywhere t)
;;   (org-roam-capture-templates
;;    '(("d" "default" plain "%?"
;;       :target (file+head "${slug}.org"
;;                          "#+title: ${title}\n")
;;       :unnarrowed t)
;;      ("c" "chapter note" plain
;;       "* %?\t\t:important:\n\n\n** Functions Covered\n\n\n** Exercises\n\n\n"
;;       :target (file "%<%Y%m%d%H%M%S>-${slug}.org")
;;       :head "#+title: ${title}\n"
;;       :unnarrowed t)))
;;   :bind ((:map org-roam-mode-map
;;                ("C-c n l"   . org-roam)
;;                ("C-c n f"   . org-roam-node-find)
;;                ("C-c n d"   . org-roam-dailies-find-date)
;;                ("C-c n c"   . org-roam-dailies-capture-today)
;;                ("C-c n C r" . org-roam-dailies-capture-tomorrow)
;;                ("C-c n t"   . org-roam-dailies-find-today)
;;                ("C-c n y"   . org-roam-dailies-find-yesterday)
;;                ("C-c n r"   . org-roam-dailies-find-tomorrow)
;;                ("C-c n g"   . org-roam-graph)
;; 	       ("C-<right>" . org-shiftright)
;; 	       ("<C-S-right>" . org-shiftright) 
;; 	       ("<C-S-left>" . org-shiftleft)
;; 	       ("<S-right>" . nil)
;; 	       ("<S-left>" . nil)
;; 	       ("<S-up>" . nil)
;; 	       ("<S-down>" . nil)
;; 	       ("C-c l" . (lambda () (interactive) (org-insert-structure-template "src lisp\n")))
;;                :map org-mode-map
;;                (("C-c n i" . org-roam-insert))
;;                (("C-c n I" . org-roam-insert-immediate))))
;;   :config
;;   (org-roam-setup))


(use-package org-roam
  :ensure t
  :hook (after-init . org-roam-mode)
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/OrgRoam/notes")
  (org-roam-completion-everywhere t)
  (org-roam-capture-templates
   '(("d" "default" plain "%?"
      :target (file+head "${slug}.org"
                         "#+title: ${title}\n")
      :unnarrowed t)
     ("c" "chapter note" plain
      "* %?\t\t:important:\n** References\n- Previous Chapter:\n- Next Chapter\n** Functions Covered\n** Exercises\n"
      :target (file "${slug}-%<%Y%m%d%H%M%S>.org")
      :head "#+title: ${title}\n"
      :unnarrowed t)))
  :bind (("C-c n l"   . org-roam)
         ("C-c n f"   . org-roam-node-find)
         ("C-c n d"   . org-roam-dailies-find-date)
         ("C-c n c"   . org-roam-dailies-capture-today)
         ("C-c n C r" . org-roam-dailies-capture-tomorrow)
         ("C-c n t"   . org-roam-dailies-find-today)
         ("C-c n y"   . org-roam-dailies-find-yesterday)
         ("C-c n r"   . org-roam-dailies-find-tomorrow)
         ("C-c n g"   . org-roam-graph)
	 ("C-<right>" . org-shiftright)
	 ("<C-S-right>" . org-shiftright) 
	 ("<C-S-left>" . org-shiftleft)
	 ("C-c l" . (lambda () (interactive) (org-insert-structure-template "src lisp\n")))
         :map org-mode-map
         (("C-c n i"   . org-roam-node-insert))
         (("C-c n I" . org-roam-insert-immediate)))
  ;; :bind (("C-c n l" . org-roam-buffer-toggle)
  ;;        ("C-c n f" . org-roam-node-find)
  ;;        ("C-c n i" . org-roam-node-insert)
  ;;        :map org-mode-map
  ;;        ("C-M-i"    . completion-at-point))
  :config
  (org-roam-setup))

(use-package org-roam-ui
  :ensure t
  :after org-roam
  ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
  ;;         a hookable mode anymore, you're advised to pick something yourself
  ;;         if you don't care about startup time, use
  ;;  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
	org-roam-ui-open-on-start nil))


(require 'ob-elixir nil t)
