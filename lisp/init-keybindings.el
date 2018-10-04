;; Make it hard to quit Emacs - C-x Really Quit
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(defun kill-buffer-and-frame ()
  (interactive)
  (kill-buffer)
  (delete-frame))
(global-set-key (kbd "C-x C-c") 'kill-buffer-and-frame)


;; Text size
(global-unset-key (kbd "C-x C-+")) ; don't zoom like this

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; moving around windows
(global-set-key (kbd "S-<right>") 'windmove-right)
(global-set-key (kbd "S-<left>") 'windmove-left)
(global-set-key (kbd "S-<up>") 'windmove-up)
(global-set-key (kbd "S-<down>") 'windmove-down)

(provide 'init-keybindings)
