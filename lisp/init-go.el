(when (maybe-require-package 'go-mode)

  (setenv "PATH" (concat "/usr/local/bin:/usr/bin:/bin" (getenv "PATH")))
  (setenv "GOPATH" (concat (getenv "HOME") "/go/"))
  (setq exenfc-path (append exec-path '("/usr/local/bin")))
  (add-to-list 'exec-path (concat (getenv "GOPATH") "/bin"))


  (require-package 'go-eldoc)
  ;; company-go is the atocomplete backend
  (require-package 'company-go)

  (after-load 'go-mode
    (add-hook 'go-mode-hook
              (lambda ()

                (let ((govet (flycheck-checker-get 'go-vet 'command)))
                  (when (equal (cadr govet) "tool")
                    (setf (cdr govet) (cddr govet))))

                (setq company-tooltip-limit 20)                      ; bigger popup window
                (setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
                (setq company-echo-delay 0)                          ; remove annoying blinking
                (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

                (go-eldoc-setup)
                (local-set-key (kbd "M-.") 'godef-jump)
                (add-hook 'before-save-hook 'gofmt-before-save)

                (sanityinc/local-push-company-backend 'company-go)
                (set (make-local-variable 'company-backends) '(company-go))
                (company-mode)
                )


              ))



  )




(provide 'init-go)
;;; init-go.el ends here
