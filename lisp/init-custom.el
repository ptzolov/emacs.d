(defun quick-nav (project)
  (interactive
   (list
    (completing-read "Choose one: "
                     (directory-files "/Users/ptzolov/go/src/github.com/accedian/"))))
  (find-file (concat "/Users/ptzolov/go/src/github.com/accedian/" project)))

(global-set-key (kbd "C-c C-l") 'quick-nav)

(provide 'init-custom)
