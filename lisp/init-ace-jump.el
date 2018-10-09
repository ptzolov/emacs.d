;; Use smex to handle M-x
(require-package 'ace-jump-mode)

(after-load 'ace-jump-mode
  (global-set-key (kbd "C-o") 'ace-jump-char-mode))

(provide 'init-ace-jump)
