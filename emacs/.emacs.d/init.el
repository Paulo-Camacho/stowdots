;;; init.el --- Personal Emacs configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; Small, modern Emacs setup with Evil plus JS/TS/TSX/JSON tooling.

;;; Code:

;; GUI Emacs on macOS may not inherit shell PATH.
(dolist (path '("/opt/homebrew/bin" "/usr/local/bin"))
  (when (file-directory-p path)
    (add-to-list 'exec-path path)
    (setenv "PATH" (concat path path-separator (getenv "PATH")))))

(require 'package)

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(require 'use-package)
(setq use-package-always-ensure t)

;; Vim motions.
(use-package evil
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; Fast, precise syntax highlighting via built-in tree-sitter modes.
(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (global-treesit-auto-mode))

(dolist (mapping '(("\\.js\\'" . js-ts-mode)
                   ("\\.mjs\\'" . js-ts-mode)
                   ("\\.cjs\\'" . js-ts-mode)
                   ("\\.jsx\\'" . js-ts-mode)
                   ("\\.ts\\'" . typescript-ts-mode)
                   ("\\.tsx\\'" . tsx-ts-mode)
                   ("\\.json\\'" . json-ts-mode)
                   ("\\.jsonc\\'" . json-ts-mode)))
  (add-to-list 'auto-mode-alist mapping))

;; Language-server intelligence: diagnostics, go-to-definition, rename, hover.
(use-package eglot
  :ensure nil
  :hook (((js-ts-mode typescript-ts-mode tsx-ts-mode) . my/eglot-ensure-typescript)
         (json-ts-mode . my/eglot-ensure-json))
  :config
  (add-to-list 'eglot-server-programs
               '((js-ts-mode typescript-ts-mode tsx-ts-mode)
                 . ("typescript-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs
               '(json-ts-mode . ("vscode-json-language-server" "--stdio")))

  (defun my/eglot-ensure-typescript ()
    "Start Eglot only when TypeScript language server exists."
    (when (executable-find "typescript-language-server")
      (eglot-ensure)))

  (defun my/eglot-ensure-json ()
    "Start Eglot only when JSON language server exists."
    (when (executable-find "vscode-json-language-server")
      (eglot-ensure))))

;; ESLint/Flycheck linting. Uses project-local eslint when available.
(use-package flycheck
  :hook ((js-ts-mode typescript-ts-mode tsx-ts-mode json-ts-mode) . flycheck-mode)
  :custom
  (flycheck-check-syntax-automatically '(save mode-enabled)))

;; Format-on-save. Uses Prettier for JS, TS, TSX, JSON.
(use-package apheleia
  :config
  (setf (alist-get 'prettier apheleia-formatters)
        '("prettier" "--stdin-filepath" filepath))
  (dolist (mode '(js-ts-mode typescript-ts-mode tsx-ts-mode json-ts-mode))
    (setf (alist-get mode apheleia-mode-alist) 'prettier))
  (apheleia-global-mode 1))

;; Modern completion UI.
(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-cycle t)
  :init
  (global-corfu-mode))

(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-file))

(global-display-line-numbers-mode 1)

;; (set-face-attribute 'default nil :font "Fira Code-12")
(set-face-attribute 'default nil :font "Iosevka Nerd Font Mono-15")

;; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/atom-one-dark-theme")
(load-theme 'atom-one-dark t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
