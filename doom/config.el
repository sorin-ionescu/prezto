;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Christian Maher"
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

(define-prefix-command 'prefix-ctrl-l)
(global-set-key (kbd "C-l") 'prefix-ctrl-l)

(after! evil
        ;; enable evil movement in the ex commandline
        (setq evil-want-minibuffer t)
        (evil-select-search-module 'evil-search-module 'evil-search)

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
      ;; "w n" #'evil-window-left
      ;; "w e" #'evil-window-down
      ;; "w o" #'evil-window-up
      ;; "w i" #'evil-window-right

      "e y" #'csm-copy-to-clipboard
      "e p" #'csm-paste-from-clipboard
      "e c" #'comment-line
      ;; "e s" #'sp-forward-slurp-sexp
      ;; "e S" #'sp-backward-slurp-sexp
      ;; "e b" #'sp-forward-barf-sexp
      ;; "e B" #'sp-backward-barf-sexp
      ;; used to edit after exporting project search
      "e e" #'wgrep-change-to-wgrep-mode

      ;; "b e" #'csm-switch-to-shell

      "b L" #'csm-show-message-log
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
