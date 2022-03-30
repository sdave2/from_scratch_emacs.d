
;; Use Magit status
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

;; Use Hydra package
(use-package hydra :ensure t)

;;; Git Gutter
;;Git gutter is great for giving visual feedback on changes, but it doesn't play well
;;with org-mode using org-indent. So I don't use it globally.
(use-package git-gutter
  :ensure t
  :init (global-git-gutter-mode +1)
  :config
  (setq git-gutter:update-interval 1
        git-gutter:window-width 2
        git-gutter:ask-p nil)
  (defhydra hydra-git-gutter (:body-pre (git-gutter-mode 1)
                         :hint nil)
   "
 Git gutter:
   _j_: next hunk        _s_tage hunk     _q_uit
   _k_: previous hunk    _r_evert hunk    _Q_uit and deactivate git-gutter
   ^ ^                   _p_opup hunk
   _h_: first hunk
   _l_: last hunk        set start _R_evision
 "
 ("j" git-gutter:next-hunk)
 ("k" git-gutter:previous-hunk)
 ("h" (progn (goto-char (point-min))
             (git-gutter:next-hunk 1)))
 ("l" (progn (goto-char (point-min))
             (git-gutter:previous-hunk 1)))
 ("s" git-gutter:stage-hunk)
 ("r" git-gutter:revert-hunk)
 ("p" git-gutter:popup-hunk)
 ("R" git-gutter:set-start-revision)
 ("q" nil :color blue)
 ("Q" (progn (git-gutter-mode -1)
             ;; git-gutter-fringe doesn't seem to
             ;; clear the markup right away
             (sit-for 0.1)
             (git-gutter:clear))
             :color blue)))

(use-package git-gutter-fringe
  :pin melpa-stable
  :diminish git-gutter-mode
  :after git-gutter
  :demand fringe-helper
  :config
  ;; subtle diff indicators in the fringe
  ;; places the git gutter outside the margins.
  (setq-default fringes-outside-margins t))




