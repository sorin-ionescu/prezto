(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((eval setq-local inferior-lisp-program
           (concat "love "
                   (locate-dominating-file default-directory dir-locals-file)
                   "/build"))
     (eval setq-local inferior-lisp-program
           (concat "love "
                   (locate-dominating-file default-directory dir-locals-file)))
     (inferior-lisp-program . "love ."))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
