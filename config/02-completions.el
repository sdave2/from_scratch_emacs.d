;; Vertico Setup Guide https://kristofferbalintona.me/posts/202202211546/

;; Buffer completions
(use-package company :straight t
  :hook
  (after-init . global-company-mode)
  :config (setq company-maximum-prefix-length 2
		;; company-idle-delay 0.2
		;; company-tooltip-flip-when-above t
		))

(use-package company-quickhelp :straight t
  :config (company-quickhelp-mode 1))


;; Enable vertico
;; (use-package vertico
;;   :demand t                             ; Otherwise won't get loaded immediately
;;   :straight (vertico :files (:defaults "extensions/*") ; Special recipe to load extensions conveniently
;;                      :includes (vertico-indexed
;;                                 vertico-flat
;;                                 vertico-grid
;;                                 vertico-mouse
;;                                 vertico-quick
;;                                 vertico-buffer
;;                                 vertico-repeat
;;                                 vertico-reverse
;;                                 vertico-directory
;;                                 vertico-multiform
;;                                 vertico-unobtrusive
;;                                 ))
;;   :bind  (:map vertico-map
;; 	       ;; Set manually otherwise setting `vertico-quick-insert' overrides this
;; 	       ("<tab>" . vertico-insert)
;; 	       ("<escape>" . minibuffer-keyboard-quit)
;; 	       ("?" . minibuffer-completion-help)
;; 	       ("C-M-n" . vertico-next-group)
;; 	       ("C-M-p" . vertico-previous-group)
;; 	       ;; Multiform toggles
;; 	       ("<backspace>" . vertico-directory-delete-char)
;; 	       ("C-w" . vertico-directory-delete-word)
;; 	       ("C-<backspace>" . vertico-directory-delete-word)
;; 	       ("RET" . vertico-directory-enter)
;; 	       ("C-i" . vertico-quick-insert)
;; 	       ("C-o" . vertico-quick-exit)
;; 	       ("M-o" . kb/vertico-quick-embark)
;; 	       ("M-G" . vertico-multiform-grid)
;; 	       ("M-F" . vertico-multiform-flat)
;; 	       ("M-R" . vertico-multiform-reverse)
;; 	       ("M-U" . vertico-multiform-unobtrusive)
;; 	       ("C-l" . kb/vertico-multiform-flat-toggle)
;; 	       )
;;   :hook (; Clean up file path when typing
;; 	 (rfn-eshadow-update-overlay . vertico-directory-tidy)
;; 	 ; Make sure vertico state is saved
;;          (minibuffer-setup . vertico-repeat-save)
;;          )
;;   :custom
;;   (vertico-count 13)
;;   (vertico-resize t)
;;   (vertico-cycle nil)
;;   ;; Extensions
;;   (vertico-grid-separator "       ")
;;   (vertico-grid-lookahead 50)
;;   (vertico-buffer-display-action '(display-buffer-reuse-window))
;;   (vertico-multiform-categories
;;    '((file reverse)
;;      (consult-grep buffer)
;;      (consult-location)
;;      (imenu buffer)
;;      (library reverse indexed)
;;      (org-roam-node reverse indexed)
;;      (t reverse)
;;      ))
;;   (vertico-multiform-commands
;;    '(("flyspell-correct-*" grid reverse)
;;      (org-refile grid reverse indexed)
;;      (consult-yank-pop indexed)
;;      (consult-flycheck)
;;      (consult-lsp-diagnostics)
;;      ))
;;   :init
;;   (defun kb/vertico-multiform-flat-toggle ()
;;     "Toggle between flat and reverse."
;;     (interactive)
;;     (vertico-multiform--display-toggle 'vertico-flat-mode)
;;     (if vertico-flat-mode
;;         (vertico-multiform--temporary-mode 'vertico-reverse-mode -1)
;;       (vertico-multiform--temporary-mode 'vertico-reverse-mode 1)))
;;   (defun kb/vertico-quick-embark (&optional arg)
;;     "Embark on candidate using quick keys."
;;     (interactive)
;;     (when (vertico-quick-jump)
;;       (embark-act arg)))

;;   ;; Workaround for problem with `tramp' hostname completions. This overrides
;;   ;; the completion style specifically for remote files! See
;;   ;; https://github.com/minad/vertico#tramp-hostname-completion
;;   (defun kb/basic-remote-try-completion (string table pred point)
;;     (and (vertico--remote-p string)
;;          (completion-basic-try-completion string table pred point)))
;;   (defun kb/basic-remote-all-completions (string table pred point)
;;     (and (vertico--remote-p string)
;;          (completion-basic-all-completions string table pred point)))
;;   (add-to-list 'completion-styles-alist
;;                '(basic-remote           ; Name of `completion-style'
;;                  kb/basic-remote-try-completion kb/basic-remote-all-completions nil))
;;   :config
;;   (vertico-mode)
;;   ;; Extensions
;;   (vertico-multiform-mode)

;;   ;; Prefix the current candidate with “» ”. From
;;   ;; https://github.com/minad/vertico/wiki#prefix-current-candidate-with-arrow
;;   (advice-add #'vertico--format-candidate :around
;;               (lambda (orig cand prefix suffix index _start)
;;                 (setq cand (funcall orig cand prefix suffix index _start))
;;                 (concat
;;                  (if (= vertico--index index)
;;                      (propertize "» " 'face 'vertico-current)
;;                    "  ")
;;                  cand)))
;;   )

;; (use-package vertico
;;   :straight (vertico :files (:defaults "extensions/*")
;;                      :includes (vertico-indexed
;;                                 vertico-flat
;;                                 vertico-grid
;;                                 vertico-mouse
;;                                 vertico-quick
;;                                 vertico-buffer
;;                                 vertico-repeat
;;                                 vertico-reverse
;;                                 vertico-directory
;;                                 vertico-multiform
;;                                 vertico-unobtrusive
;;                                 ))
;;   :bind (:map vertico-map
;; 		  ("<tab>" . vertico-insert)  ; Insert selected candidate into text area
;; 		  ("<escape>" . minibuffer-keyboard-quit) ; Close minibuffer
;; 		  ;; NOTE 2022-02-05: Cycle through candidate groups
;; 		  ("C-M-n" . vertico-next-group)
;; 		  ("C-M-p" . vertico-previous-group))
;;   :init
;;   (vertico-mode)

;;   ;; Different scroll margin
;;   ;; (setq vertico-scroll-margin 0)

;;   ;; Show more candidates
;;   ;; (setq vertico-count 20)

;;   ;; Grow and shrink the Vertico minibuffer
;;   (setq vertico-resize t)

;;   ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
;;   (setq vertico-cycle t)
;;   )

;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

;; Optionally use the `orderless' completion style.
;; (use-package orderless
;;   :straight t
;;   :custom
;;   (completion-styles '(orderless))
;;   (completion-category-defaults nil)    ; I want to be in control!
;;   (completion-category-overrides
;;    '((file (styles basic-remote ; For `tramp' hostname completion with `vertico'
;;                    orderless))))

;;   (orderless-component-separator 'orderless-escapable-split-on-space)
;;   (orderless-matching-styles
;;    '(orderless-literal
;;      orderless-prefixes
;;      orderless-initialism
;;      orderless-regexp
;;      ;; orderless-flex
;;      ;; orderless-strict-leading-initialism
;;      ;; orderless-strict-initialism
;;      ;; orderless-strict-full-initialism
;;      ;; orderless-without-literal          ; Recommended for dispatches instead
;;      ))
;;   (orderless-style-dispatchers
;;    '(prot-orderless-literal-dispatcher
;;      prot-orderless-strict-initialism-dispatcher
;;      prot-orderless-flex-dispatcher
;;      ))
;;   :init
;;   (defun orderless--strict-*-initialism (component &optional anchored)
;;     "Match a COMPONENT as a strict initialism, optionally ANCHORED.
;; The characters in COMPONENT must occur in the candidate in that
;; order at the beginning of subsequent words comprised of letters.
;; Only non-letters can be in between the words that start with the
;; initials.

;; If ANCHORED is `start' require that the first initial appear in
;; the first word of the candidate.  If ANCHORED is `both' require
;; that the first and last initials appear in the first and last
;; words of the candidate, respectively."
;;     (orderless--separated-by
;;         '(seq (zero-or-more alpha) word-end (zero-or-more (not alpha)))
;;       (cl-loop for char across component collect `(seq word-start ,char))
;;       (when anchored '(seq (group buffer-start) (zero-or-more (not alpha))))
;;       (when (eq anchored 'both)
;;         '(seq (zero-or-more alpha) word-end (zero-or-more (not alpha)) eol))))

;;   (defun orderless-strict-initialism (component)
;;     "Match a COMPONENT as a strict initialism.
;; This means the characters in COMPONENT must occur in the
;; candidate in that order at the beginning of subsequent words
;; comprised of letters.  Only non-letters can be in between the
;; words that start with the initials."
;;     (orderless--strict-*-initialism component))

;;   (defun prot-orderless-literal-dispatcher (pattern _index _total)
;;     "Literal style dispatcher using the equals sign as a suffix.
;; It matches PATTERN _INDEX and _TOTAL according to how Orderless
;; parses its input."
;;     (when (string-suffix-p "=" pattern)
;;       `(orderless-literal . ,(substring pattern 0 -1))))

;;   (defun prot-orderless-strict-initialism-dispatcher (pattern _index _total)
;;     "Leading initialism  dispatcher using the comma suffix.
;; It matches PATTERN _INDEX and _TOTAL according to how Orderless
;; parses its input."
;;     (when (string-suffix-p "," pattern)
;;       `(orderless-strict-initialism . ,(substring pattern 0 -1))))

;;   (defun prot-orderless-flex-dispatcher (pattern _index _total)
;;     "Flex  dispatcher using the tilde suffix.
;; It matches PATTERN _INDEX and _TOTAL according to how Orderless
;; parses its input."
;;     (when (string-suffix-p "." pattern)
;;       `(orderless-flex . ,(substring pattern 0 -1))))
;;   )

;; marginalia for minibuffer annotations, i.e., auxiliary candidate information
;; (use-package marginalia
;;   :straight t
;;   ;; Here I am binding to a key-map not defined by marginalia
;;   ;; Not sure this is the best way (maybe I should use bind-key)
;;   :bind (:map minibuffer-local-map
;; 	      ("M-A" . marginalia-cycle))
;;   :custom
;;   (marginalia-max-relative-age 0)
;;   (marginalia-align 'right)
;;   :init
;;   (marginalia-mode))

	

;; (use-package all-the-icons-completion
;;   :straight t
;;   :after (marginalia all-the-icons)
;;   :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
;;   :init
;;   (all-the-icons-completion-mode))



