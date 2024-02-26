(in-package :lem-user)

(load-theme "onedark")

(asdf:load-system :lem-pareto)
(add-hook lem-lisp-mode:*lisp-mode-hook* 'lem-paredit-mode:paredit-mode)
(add-hook lem-lisp-mode:*lisp-mode-hook* 'lem-pareto-mode:pareto-mode)

(define-key lem-lisp-mode:*lisp-mode-keymap* "F1" 'lem-lisp-mode:lisp-describe-symbol)

(add-hook (variable-value 'before-save-hook :global) 'delete-trailing-whitespace)

(lem-sdl2/display:change-font (lem-sdl2/display:current-display)
 (lem-sdl2/font:make-font-config
  :size 18
  :latin-normal-file "/usr/share/fonts/TTF/Inconsolata-Regular.ttf"
  :latin-bold-file "/usr/share/fonts/TTF/Inconsolata-Bold.ttf"
  :cjk-normal-file "/usr/share/fonts/wenquanyi/wqy-zenhei/wqy-zenhei.ttc"
  :cjk-bold-file "/usr/share/fonts/wenquanyi/wqy-zenhei/wqy-zenhei.ttc"))
