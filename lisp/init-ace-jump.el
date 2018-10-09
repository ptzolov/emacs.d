;; Use smex to handle M-x
(when (require-package 'ace-jump-mode)
  (global-set-key (kbd "C-o") 'ace-jump-char-mode))

(provide 'init-ace-jump)
