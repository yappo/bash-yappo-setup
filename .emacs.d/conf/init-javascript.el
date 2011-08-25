;;(setq auto-mode-alist (cons '("\\.js$" . javascript-mode) auto-mode-alist) )
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-hook 'js2-mode-hook          '(lambda ()
             (setq js2-basic-offset 4
                   tab-width        4
                   indent-tabs-mode t
                   js2-cleanup-whitespace nil)))
