;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
(setq user-full-name "Christian Maher" ;; clients, file templates and snippets. It is optional.
      user-mail-address "maher.cs@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; https://github.com/emacs-evil/evil/blob/master/evil-maps.el


;; Allow C-l as a prefix
(define-prefix-command 'prefix-ctrl-l)
(global-set-key (kbd "C-l") 'prefix-ctrl-l)

(after! evil
  ;; enable evil movement in the ex commandline
  (setq evil-want-minibuffer t)
  (evil-select-search-module 'evil-search-module 'evil-search)
  (define-key evil-motion-state-map "*" 'csm-evil-search-word-forward)

  (map! :after evil
         :map evil-normal-state-map
          "n" #'evil-backward-char
          "e" #'evil-next-line
          "E" #'evil-join
          "o" #'evil-previous-line
          "i" #'evil-forward-char
          "k" #'evil-forward-word-end
          "K" #'evil-forward-WORD-end
          "h" #'evil-insert
          "H" #'evil-insert-line
          "j" #'evil-ex-search-next
          "J" #'evil-ex-search-previous
          "l" #'evil-open-below
          "L" #'evil-open-above

          "g z ." #'evil-mc-make-cursor-here
          "g z ;" #'evil-mc-pause-cursors
          "g z :" #'evil-mc-resume-cursors
          "g z e" #'evil-mc-make-cursor-move-next-line
          "g z o" #'evil-mc-make-cursor-move-prev-line)
  (map! :after evil
         :map evil-motion-state-map
          "n" #'evil-backward-char
          "e" #'evil-next-line
          "o" #'evil-previous-line
          "i" #'evil-forward-char
          "k" #'evil-forward-word-end
          "K" #'evil-forward-WORD-end
          "j" #'evil-ex-search-next
          "J" #'evil-ex-search-previous
          "l" #'evil-open-below
          "L" #'evil-open-above)
  (map! :after evil
         :map evil-visual-state-map
          "n" #'evil-backward-char
          "e" #'evil-next-line
          "o" #'evil-previous-line
          "i" #'evil-forward-char
          "k" #'evil-forward-word-end
          "K" #'evil-forward-WORD-end
          "h w" #'evil-inner-word
          "h W" #'evil-inner-WORD
          "j" #'evil-ex-search-next
          "J" #'evil-ex-search-previous
          "l" #'evil-open-below
          "L" #'evil-open-above

          "." #'evil-repeat)
  (map! :after evil
         :map evil-window-map
          "n" #'evil-window-left
          "e" #'evil-window-down
          "o" #'evil-window-up
          "i" #'evil-window-right))

(map! :leader
       "w n" #'evil-window-left
       "w e" #'evil-window-down
       "w o" #'evil-window-up
       "w i" #'evil-window-right

       "l r" #'csm-love-repl
       "l t" #'csm-love-test
       "l s" #'csm-love-sync-all

       "e y" #'csm-copy-to-clipboard
       "e p" #'csm-paste-from-clipboard
       "e c" #'comment-line
       "e s" #'sp-forward-slurp-sexp
       "e S" #'sp-backward-slurp-sexp
       "e b" #'sp-forward-barf-sexp
       "e B" #'sp-backward-barf-sexp
       ;; used to edit after exporting project search
       "e e" #'wgrep-change-to-wgrep-mode

       "b e" #'csm-switch-to-shell

       ;; not sure why this was lost
       "m e b" #'eval-buffer

       "b m" #'csm-show-message-log
       "=" 'csm-indent-buffer)

(map!
 "C-S-h" #'evil-window-split
 "C-S-p" #'csm-paste-from-clipboard
 "C-S-v" #'evil-window-vsplit
 "C-S-w" #'evil-window-delete
 "C-S-n" #'evil-window-left
 "C-S-e" #'evil-window-down
 "C-S-o" #'evil-window-up
 "C-S-i" #'evil-window-right

 "C-l C-e" #'csm-send-defun-to-shell
 "C-l C-r" #'csm-send-region-to-shell
 "C-l C-b" #'csm-send-buffer-to-shell
 "C-l C-d" #'eval-defun
 "C-l C-s" #'csm-fnl-hotswap-file
 "C-l C-m" #'mark-defun

 "C-M-n" #'pop-tag-mark
 "C-/" #'comment-line)

(after! lispy
  (defun csm-lispy-brackets ()
    (interactive "P")
    (lispy-pair "[" "]" 'lispy-brackets-preceding-syntax-alist))

  (lispy-define-key lispy-mode-map (kbd "n") #'lispy-backward)
  (lispy-define-key lispy-mode-map (kbd "e") #'lispy-down)
  (lispy-define-key lispy-mode-map (kbd "o") #'lispy-up)
  (lispy-define-key lispy-mode-map (kbd "i") #'lispy-forward)

  (lispy-define-key lispy-mode-map (kbd "E") #'lispy-outline-next)
  (lispy-define-key lispy-mode-map (kbd "O") #'lispy-outline-prev)

  (lispy-define-key lispy-mode-map (kbd "h") #'lispy-eval)
  (lispy-define-key lispy-mode-map (kbd "H") #'lispy-eval-and-insert)
  (lispy-define-key lispy-mode-map (kbd "l") #'lispy-tab)
  (lispy-define-key lispy-mode-map (kbd "L") #'lispy-shifttab)
  (lispy-define-key lispy-mode-map (kbd "j") #'lispy-new-copy)
  (lispy-define-key lispy-mode-map (kbd "J") #'lispy-oneline)
  (lispy-define-key lispy-mode-map (kbd "k") #'lispy-ace-symbol-replace)
  (lispy-define-key lispy-mode-map (kbd "K") #'lispy-kill)
  (lispy-define-key lispy-mode-map (kbd "D") #'lispy-kill-at-point)
  ;; TODO make these only activate in fennel-mode
  (setq lispy-colon-p nil))

(use-package! fennel-mode
   :hook
    rainbow-delimiters-mode)

(defun csm-evil-search-word-forward ()
   (interactive)
   (modify-syntax-entry ?: ". 14" fennel-mode-syntax-table)
   (modify-syntax-entry ?. ". 14" fennel-mode-syntax-table)
   (evil-search-word-forward)
   (modify-syntax-entry ?: "w" fennel-mode-syntax-table)
   (modify-syntax-entry ?. "w" fennel-mode-syntax-table))


;;* Custom Function

(defmacro ->> (&rest body)
  (let ((result (pop body)))
    (dolist (form body result)
      (setq result (append form (list result))))))

(defmacro -> (&rest body)
  (let ((result (pop body)))
    (dolist (form body result)
      (setq result (append (list (car form) result)
                           (cdr form))))))

(defun csm-wsl-copy (start end)
  (interactive "r")
  (shell-command-on-region start end "clip")
  (deactivate-mark))

(defun csm-wsl-paste ()
  (interactive)
  (let ((clipboard
         (shell-command-to-string "clip-paste 2> /dev/null")))
    (setq clipboard (substring clipboard 0 -1)) ; Remove newline added by Powershell
    (insert clipboard)))

(defun csm-paste-from-clipboard ()
  (interactive)
  (setq select-enable-clipboard t)
  (yank)
  (setq select-enable-clipboard nil))

(defun csm-copy-to-clipboard()
  (interactive)
  (setq select-enable-clipboard t)
  (kill-ring-save (region-beginning) (region-end))
  (setq select-enable-clipboard nil))

(defun csm-indent-buffer ()
  "Indents an entire buffer using the default intenting scheme."
  (interactive)
  (save-excursion
    (delete-trailing-whitespace)
    (indent-region (point-min) (point-max) nil)
    (untabify (point-min) (point-max))))

(defun csm-show-message-log ()
  "Show the message log bufffer. Print to log with (message ...)"
  (interactive)
  (switch-to-buffer " *Message-Log*"))

;; https://emacs.stackexchange.com/questions/48954/the-elisp-function-to-run-the-shell-command-in-specific-file-path/48968#48968?newreg=b86e9e5763734e37a1bee5a230d71551
;; Use "term /bin/zsh", *terminal* buffer and terminal process if you want to use zsh. It needs some work to be smooth though
(defun csm-sh-send-command (command &optional switch-buffer)
  "Send COMMAND to current shell process.
    Creates new shell process if none exists.
    See URL `https://stackoverflow.com/a/7053298/5065796'"
  (let ((proc (get-process "shell"))
        pbuf)
    (unless proc
      (let ((currbuff (current-buffer)))
        (shell)
        (switch-to-buffer currbuff)
        (setq proc (get-process "shell"))))
    (setq pbuff (process-buffer proc))
    (setq command-and-go (concat command "\n"))
    (with-current-buffer pbuff
      (goto-char (process-mark proc))
      (insert command-and-go)
      (move-marker (process-mark proc) (point)))
    (process-send-string proc command-and-go)
    (when switch-buffer
      (switch-to-buffer "*shell*"))))

(defun csm-love-repl ()
  (interactive)
  (save-some-buffers t)
  (csm-sh-send-command (concat "cd " (projectile-project-root) " && make run") t))

(defun csm-love-test ()
  (interactive)
  (save-some-buffers t)
  (csm-sh-send-command (concat "cd " (projectile-project-root) " && make test") t))

(defun csm-love-sync-all ()
  (interactive)
  (save-some-buffers t)
  (csm-sh-send-command "(love.game.sync-all)"))

;;** Send to shell
(defun csm-send-region-to-shell ()
  (interactive)
  (let ((sexp (buffer-substring-no-properties (region-beginning) (region-end))))
    (csm-sh-send-command sexp)))

(defun csm-send-defun-to-shell ()
  (interactive)
  (save-excursion
    (mark-defun)
    (csm-send-region-to-shell)
    (pop-mark)))

(defun csm-send-buffer-to-shell ()
  (interactive)
  (save-excursion
    (mark-page)
    (csm-send-region-to-shell)
    (pop-mark)))

(defun csm-fnl-hotswap-file ()
  "Hotswaps the current buffer. Relies on a directory structure of src/?.fnl;src/?/init.fnl"
  (interactive)
  (save-buffer)
  (let* ((modname (buffer-file-name))
         (from-src-pos (string-match ".*/src/\\(.*\\).fnl" modname))
         (modname (match-string 1 modname))
         (modname (replace-regexp-in-string "\\/" "." modname))
         (modname (replace-regexp-in-string ".init$" "" modname)))
    (csm-sh-send-command (concat "(dbg.hot :" modname ")"))))


(defun csm-switch-to-shell ()
  (interactive)
  (switch-to-buffer "*shell*"))
