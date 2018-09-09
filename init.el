
;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)
(package-initialize)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    markdown-mode
    zenburn-theme
    better-defaults
    smex
    flycheck
    company))

;;(setq package-selected-packages myPackages)

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------
(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'zenburn t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally
(delete-selection-mode t) ;; open selection mode open
(global-company-mode) ;; enable prompt
(global-hl-line-mode t) ;; highlight the selected line
(menu-bar-mode 0) ;; hide toolbar
(setq linum-format "%4d  ")
(setq make-backup-files nil) ;; close backup files
;; open recent mode
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 10)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ;; Can be omitted. This might cause a (minimal) delay when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)

;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(package-selected-packages (quote (company material-theme better-defaults)))
 '(custom-safe-themes
   (quote("89dd0329d536d389753111378f2425bd4e4652f892ae8a170841c3396f5ba2dd" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
