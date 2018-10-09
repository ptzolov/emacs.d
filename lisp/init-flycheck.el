(when (maybe-require-package 'flycheck)
  (add-hook 'after-init-hook 'global-flycheck-mode)
  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)

  ;; TOOD - Come back to this and figure out a better way to show errors other than highlighting the whole line
  ;; (when (maybe-require-package 'flycheck-color-mode-line)
  ;;   (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))
  )


(provide 'init-flycheck)
