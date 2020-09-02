;; (use-package org-mode :ensure t
;;   :config (progn
;; 	    (add-hook 'org-mode-hook 'org-indent-mode-hook))
;;   :bind (:map org-mode-map
;; 	      ("C-<right> . org-shiftright")))


;;(add-hook 'org-mode-hook '(lambda () (define-key org-mode-map "S-<right>" nil)))

(require 'org)
(add-hook 'org-mode-hook 'org-indent-mode)

(define-key org-mode-map (kbd "<C-S-right>") 'org-shiftright)
(define-key org-mode-map (kbd "<C-S-left>") 'org-shiftleft)
(define-key org-mode-map (kbd "<S-right>") 'nil)
(define-key org-mode-map (kbd "<S-left>") 'nil)
(define-key org-mode-map (kbd "<S-up>") 'nil)
(define-key org-mode-map (kbd "<S-down>") 'nil)


;; (define-key org-mode-map (kbd "<M-S-up>") nil)
;; (define-key org-mode-map (kbd "<M-S-down>") nil)
;; (define-key org-mode-map (kbd "<M-up>") nil)
;; (define-key org-mode-map (kbd "<M-down>") nil)
;; (define-key org-mode-map (kbd "<M-S-left>") nil)
;; (define-key org-mode-map (kbd "<M-S-right>") nil)
;; (define-key org-mode-map (kbd "<M-left>") nil)
;; (define-key org-mode-map (kbd "<S-left>") nil)
;; (define-key org-mode-map (kbd "<S-right>") nil)
;; (define-key org-mode-map (kbd "<S-up>") nil)
;; (define-key org-mode-map (kbd "<S-down>") nil)
;; (define-key org-mode-map (kbd "<M-right>") nil) 
;; (define-key org-mode-map (kbd "C-<tab>") nil)
;; (define-key org-mode-map (kbd "C-S-<tab>") nil)
;; (define-key org-mode-map (kbd "<C-up>") nil)
;; (define-key org-mode-map (kbd "<C-down>") nil)


