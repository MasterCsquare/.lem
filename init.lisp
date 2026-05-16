(in-package :lem-user)

(load-theme "lem-default")
(set-font :name "Inconsolata" :size 19)

(asdf:load-system :lem-pareto)
(add-hook lem-lisp-mode:*lisp-mode-hook* 'lem-paredit-mode:paredit-mode)
(add-hook lem-lisp-mode:*lisp-mode-hook* 'lem-pareto-mode:pareto-mode)

(define-key lem-lisp-mode:*lisp-mode-keymap* "F1" 'lem-lisp-mode:lisp-describe-symbol)

(add-hook (variable-value 'before-save-hook :global) 'delete-trailing-whitespace)

(add-hook *prompt-after-activate-hook*
          (lambda ()
            (call-command 'lem/prompt-window::prompt-completion nil)))

(add-hook *prompt-deactivate-hook*
          (lambda ()
            (lem/completion-mode:completion-end)))

(defvar *menu-keymap*
  (make-keymap)
  "Keymap for menu key.")
(define-keys *menu-keymap*
  ("h"  'move-to-beginning-of-buffer)
  ("n"  'move-to-end-of-buffer)
  ("f"  'select-buffer)
  (";"  'save-current-buffer)
  ("k"  'kill-buffer)
  ("b"  'mark-set-whole-buffer)
  ("g"  'revert-buffer)
  ("w"  'next-window)
  ("e"  'find-file)
  ("r"  'find-recent-file)
  ("0"  'delete-active-window)
  ("1"  'delete-other-windows)
  ("2"  'split-active-window-vertically)
  ("3"  'split-active-window-horizontally)
  ("Space" 'lem/legit:legit-status)
  ("ContextMenu"  'execute-command))

(define-key *global-keymap* "ContextMenu" *menu-keymap*)
