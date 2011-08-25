

;;; cperl-mode
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode)) ;;
(setq auto-mode-alist (cons '("\\.\\([pP][Llm]\\|t\\)$" . cperl-mode) auto-mode-alist) )
(defalias 'perl-mode 'cperl-mode)

(setq cperl-indent-level 4)
(setq cperl-indent-maybe-tab nil)
(setq cperl-continued-statement-offset 4)
(setq cperl-comment-column 40)

(set-face-italic-p 'cperl-hash-face nil)
(set-face-background 'cperl-hash-face nil)
(set-face-background 'cperl-array-face nil)
(setq cperl-array-face 'font-lock-variable-name-face)
(setq cperl-hash-face 'font-variable-name-face)

(define-key cperl-mode-map "\C-c\C-c"  'cperl-comment-region) ;; C-c C-cでコメントアウト
(define-key cperl-mode-map "\C-u\C-c\C-c"  'uncomment-region) ;; cperl-uncomment-region is buggy



(add-hook 'cperl-mode-hook
          '(lambda ()
             (setq indent-tabs-mode nil)))


