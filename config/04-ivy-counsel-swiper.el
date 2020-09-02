(use-package ivy :ensure t
  :init (setq ivy-use-virtual-buffers t
	      enable-recursive-minibuffers t)
  :config (progn (ivy-mode 1)))

(use-package swiper :ensure t
  :config (progn
	    (global-set-key "\C-s" 'swiper)))

(use-package counsel :ensure t
  :disabled t
  :config (progn
	    (counsel-mode)
	    (add-hook 'counsel-mode-hook 'company-mode)))

;; For dried mode.
;; The following code is a temperory hack. It should be replaced in Emacs 27 version by
;; 
;;    make-empty-file
;;    dired-create-empty-file

(eval-after-load 'dired
  '(progn
     (define-key dired-mode-map (kbd "C-c n") 'my-dired-create-file)
     (defun my-dired-create-file (file)
       "Create a file called FILE.
If FILE already exists, signal an error."
       (interactive
        (list (read-file-name "Create file: " (dired-current-directory))))
       (let* ((expanded (expand-file-name file))
              (try expanded)
              (dir (directory-file-name (file-name-directory expanded)))
              new)
         (if (file-exists-p expanded)
             (error "Cannot create file %s: file exists" expanded))
         ;; Find the topmost nonexistent parent dir (variable `new')
         (while (and try (not (file-exists-p try)) (not (equal new try)))
           (setq new try
                 try (directory-file-name (file-name-directory try))))
         (when (not (file-exists-p dir))
           (make-directory dir t))
         (write-region "" nil expanded t)
         (when new
           (dired-add-file new)
           (dired-move-to-filename))))))
