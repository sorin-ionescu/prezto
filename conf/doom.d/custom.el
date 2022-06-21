(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((eval font-lock-add-keywords 'fennel-mode
           `((,(rx word-start
                   (group
                    (or "class" "locals" "requires" "all" "any" "filter" "foreach" "head" "map" "nth" "nthrest" "reduce" "range" "tail" "to-list" "to-map" "extend" "keys" "push" "unpack"))
                   word-end)
              1 'font-lock-keyword-face)))
     (eval font-lock-add-keywords 'fennel-mode
           `((,(rx word-start
                   (group
                    (or "class" "locals" "loop" "requires" "all" "any" "filter" "foreach" "head" "map" "nth" "nthrest" "reduce" "range" "tail" "to-list" "to-map" "extend" "keys" "push" "unpack"))
                   word-end)
              1 'font-lock-keyword-face)))
     (eval font-lock-add-keywords 'fennel-mode
           `((,(rx word-start
                   (group
                    (or "class" "locals" "loop" "requires"))
                   word-end)
              1 'font-lock-keyword-face)))
     (eval setq-local inferior-lisp-program
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
