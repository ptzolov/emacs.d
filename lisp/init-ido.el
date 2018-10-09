(when (maybe-require-package 'ido-completing-read+)
  (ido-mode 1)
  (ido-everywhere 1)
  (ido-ubiquitous-mode 1))

(provide 'init-ido)
