(in-package :lem-user)

(load-theme "lem-default")
(set-font :name "Inconsolata" :size 19)

(asdf:load-system :lem-pareto)
(add-hook lem-lisp-mode:*lisp-mode-hook* 'lem-paredit-mode:paredit-mode)
(add-hook lem-lisp-mode:*lisp-mode-hook* 'lem-pareto-mode:pareto-mode)

(define-key lem-lisp-mode:*lisp-mode-keymap* "F1" 'lem-lisp-mode:lisp-describe-symbol)

(add-hook (variable-value 'before-save-hook :global) 'delete-trailing-whitespace)
