
;;; cperl-mode
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode)) ;;
;(setq auto-mode-alist (cons '("\\.\\([pP][Llm]\\|t\\)$" . perl-completion-mode) auto-mode-alist) )
(setq auto-mode-alist (cons '("\\.\\([pP][Llm]\\|psgi\\|t\\)$" . cperl-mode) auto-mode-alist) )
(defalias 'perl-mode 'cperl-mode)

(setq cperl-close-paren-offset -4)
(setq cperl-continued-statement-offset 4)
(setq cperl-indent-level 4)
(setq cperl-indent-parens-as-block t)
(setq cperl-label-offset -4)
(setq cperl-highlight-variables-indiscriminately t)

;; faces
;(set-face-bold-p 'cperl-array-face nil)
;(set-face-background 'cperl-array-face "blightblue")
;(set-face-bold-p 'cperl-hash-face nil)
;(set-face-italic-p 'cperl-hash-face nil)
;(set-face-background 'cperl-hash-face "blightblue")



;(setq cperl-indent-level 4)
;(setq cperl-indent-maybe-tab nil)
;(setq cperl-continued-statement-offset 4)
;(setq cperl-comment-column 40)

;(set-face-italic-p 'cperl-hash-face nil)
;(set-face-background 'cperl-hash-face nil)
;(set-face-background 'cperl-array-face nil)
;(setq cperl-array-face 'font-lock-variable-name-face)
;(setq cperl-hash-face 'font-variable-name-face)

(add-hook 'cperl-mode-hook
          '(lambda ()
             (setq indent-tabs-mode nil)
	     (setq cperl-font-lock t)
	     (cperl-set-style "PerlStyle")
	     ))


(add-hook  'cperl-mode-hook
           (lambda ()
             (require 'perl-completion)
             (add-to-list 'ac-sources 'ac-source-perl-completion)))
