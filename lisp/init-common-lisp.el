;; See http://bc.tech.coop/blog/070927.html
(add-auto-mode 'lisp-mode "\\.cl\\'")
(add-hook 'lisp-mode-hook (lambda ()
                            (unless (featurep 'slime)
                              (require 'slime)
                              (normal-mode))))

(after-load 'slime
  (when (executable-find "sbcl")
    (add-to-list 'slime-lisp-implementations
                 '(sbcl ("sbcl") :coding-system utf-8-unix)))
  (when (executable-find "lisp")
    (add-to-list 'slime-lisp-implementations
                 '(cmucl ("lisp") :coding-system iso-latin-1-unix)))
  (when (executable-find "ccl")
    (add-to-list 'slime-lisp-implementations
                 '(ccl ("ccl") :coding-system utf-8-unix))))

;; From http://bc.tech.coop/blog/070515.html
(defun lispdoc ()
  "Searches lispdoc.com for SYMBOL, which is by default the symbol currently under the curser"
  (interactive)
  (let* ((word-at-point (word-at-point))
         (symbol-at-point (symbol-at-point))
         (default (symbol-name symbol-at-point))
         (inp (read-from-minibuffer
               (if (or word-at-point symbol-at-point)
                   (concat "Symbol (default " default "): ")
                 "Symbol (no default): "))))
    (if (and (string= inp "") (not word-at-point) (not
                                                   symbol-at-point))
        (message "you didn't enter a symbol!")
      (let ((search-type (read-from-minibuffer
                          "full-text (f) or basic (b) search (default b)? ")))
        (browse-url (concat "http://lispdoc.com?q="
                            (if (string= inp "")
                                default
                              inp)
                            "&search="
                            (if (string-equal search-type "f")
                                "full+text+search"
                              "basic+search")))))))


(defvar user-temporary-file-directory
  (concat temporary-file-directory user-login-name "/"))

(make-directory user-temporary-file-directory t)

(setq backup-by-copying t)

(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        (,tramp-file-name-regexp nil)))

(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))

(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))

(define-key lisp-mode-map (kbd "C-c l") 'lispdoc)


(provide 'init-common-lisp)
