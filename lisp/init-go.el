(setenv "PATH" (concat "/usr/local/bin:/usr/bin:/bin" (getenv "PATH")))
(setenv "GOPATH" (concat (getenv "HOME") "/go/"))
(setq exec-path (append exec-path '("/usr/local/bin")))
(add-to-list 'exec-path (concat (getenv "GOPATH") "/bin"))


(when (maybe-require-package 'go-mode)
  (require-package 'go-eldoc)
  ;; company-go is the atocomplete backend
  (require-package 'company-go)

  (after-load 'go-mode
    (add-hook 'go-mode-hook
              (lambda ()
                (go-eldoc-setup)
                (local-set-key (kbd "M-.") 'godef-jump)
                (add-hook 'before-save-hook 'gofmt-before-save)
                (sanityinc/local-push-company-backend 'company-go)))))

(provide 'init-go)
;;; init-go.el ends here
