(display-time)
(setq make-backup-files nil)
(setq scroll-step 1)


;; 引数をload-pathへ追加する
(defun add-to-load-path (&rest paths)
  (mapc '(lambda (path)
           (add-to-list 'load-path path))
        (mapcar 'expand-file-name paths)))

;; elispと設定ファイルのディレクトリをload-pathに追加
(add-to-load-path "~/.emacs.d/elisp"
                  "~/.emacs.d/conf")

(require 'anything-config)
(require 'perl-completion)
(perl-completion-mode t)
(require 'auto-complete)
(global-auto-complete-mode t)


;;(autoload 'javascript-mode "javascript-mode" "JavaScript mode" t)
;;(autoload 'c-mode "c-mode" "C mode" t)
(autoload 'js2-mode "js2-mode" nil t)
(autoload 'php-mode "php-mode" "PHP mode" t)

(load "init-siteconf")
(load "init-perl")
(load "init-javascript")
(load "init-php")
(load "init-actionscript")

(defun my-insert-date ()
  (interactive)
  (insert (format-time-string "%Y-%m-%dT%R:%S+09:00" (current-time))))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(safe-local-variable-values (quote ((c-indentation-style . bsd)))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; package を入力するやつ
(defun perl-insert-package ()
  (interactive)
  (require 'perl-completion)
  (cond
   ((null buffer-file-truename) (error "no buffer-file-truename"))
   (t
    (let* ((s (replace-regexp-in-string
               (rx-to-string `(and bol ,(plcmp--get-lib-path) (? "/")))
               ""
               (expand-file-name buffer-file-truename)))
           (s (file-name-sans-extension (replace-regexp-in-string (rx "/") "::" (replace-regexp-in-string "^.+/lib/" "" s)))))
      (insert "package " s ";")))))

;;Color
(if window-system (progn
   (set-background-color "Black")
   (set-foreground-color "Gray")
   (set-cursor-color "Gray")
 ))
