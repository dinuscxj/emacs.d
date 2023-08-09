
;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(require 'use-package)
(require 'cc-mode)

;; (when (not package-archive-contents)
;;  (package-refresh-contents))

;; (defvar myPackages
;;  '(better-defaults
;;    markdown-mode
;;    zenburn-theme
;;    better-defaults
;;    smex
;;    hungry-delete
;;    flycheck
;;    company))

;;(setq package-selected-packages myPackages)

;;(mapc #'(lambda (package)
;;	  (unless (package-installed-p package)
;;	    (package-install package)))
;;      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------
(setq inhibit-startup-message t) ;; hide the startup message
(setq mode-require-final-newline nil) ;; remove final line limit
(load-theme 'monokai t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally
(delete-selection-mode t) ;; open selection mode open

;; enable prompt
(global-company-mode) 
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

(global-hl-line-mode t) ;; highlight the selected line
(menu-bar-mode 0) ;; hide toolbar
(setq linum-format "%4d  ")
(setq make-backup-files nil) ;; close backup files
;; open recent mode
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 10)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;; support M-x prompt
(require 'smex) ;; Not needed if you use package.el
(smex-initialize) ;; Can be omitted. This might cause a (minimal) delay when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
;; support delete multi blank
(require 'hungry-delete)
(global-hungry-delete-mode)
;; open agenda mode
(global-set-key (kbd "C-c a") 'org-agenda)
;; cursor auto move to the new window
(require 'popwin)
(popwin-mode 1)
;; format code
;; support skip between window by numbering
(window-numbering-mode 1)
;; org mode
(setq org-startup-indented t)
(setq org-indent-mode t)
(setq org-link-abbrev-alist
     '(("google" . "http://www.google.com/search?q=")
       ("baidu" . "https://www.baidu.com/s?wd=%s")))
(setq org-plantuml-jar-path
      (expand-file-name "~/EmacsSpace/Tools/jar/plantuml.jar"))
;; active Org-babel languages, support generate png!
(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; other Babel languages
   (plantuml . t)))
;; plantuml
(setq plantuml-jar-path
      (expand-file-name "~/EmacsSpace/Tools/jar/plantuml.jar"))
;; java config
(use-package lsp-mode
  :ensure t
  :init (setq lsp-eldoc-render-all nil
              lsp-highlight-symbol-at-point nil))
(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-ui-sideline-update-mode 'point))

(use-package dap-mode
  :ensure t
  :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(use-package dap-java
  :after 'lsp-java)

(use-package lsp-java
  :ensure t
  :requires (lsp-ui-flycheck lsp-ui-sideline)
  :config
  (add-hook 'java-mode-hook  'lsp-java-enable)
  (add-hook 'java-mode-hook  'flycheck-mode)
  (add-hook 'java-mode-hook  'company-mode)
  (add-hook 'java-mode-hook  (lambda () (lsp-ui-flycheck-enable t)))
  (add-hook 'java-mode-hook  'lsp-ui-mode))
;; shell config
(require 'lsp-sh)
(add-hook 'sh-mode-hook #'lsp-sh-enable)

;; BASIC FUNCTION
;; ---------------------------------
(defun term-split()
  (interactive)
  (split-window-horizontally)
  (other-window 1)
  (term "bash/zsh"))

(defun shell-split()
  (interactive)
  (split-window-horizontally)
  (other-window 1)
  (eshell))

;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("89dd0329d536d389753111378f2425bd4e4652f892ae8a170841c3396f5ba2dd" default)))
 '(org-agenda-files (quote ("~/EmacsSpace/Work/agenda.org")))
 '(package-selected-packages
   (quote
    (magit company-shell direx monokai-pro-theme monokai-theme hc-zenburn-theme helm-lsp dap-mode auto-indent-mode htmlize flycheck-plantuml plantuml-mode company-lsp dash dash-functional epl use-package lsp-ui lsp-sh lsp-javacomp lsp-mode lsp-java window-numbering popwin hungry-delete markdown-mode zenburn-theme better-defaults smex flycheck company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
