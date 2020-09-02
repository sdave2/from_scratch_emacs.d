(use-package company :ensure t
  :config (setq company-maximum-prefix-length 2
		company-idle-delay 0.2
		company-tooltip-flip-when-above t)
  (global-company-mode t))

(use-package company-quickhelp :ensure t
  :config (company-quickhelp-mode 1))
