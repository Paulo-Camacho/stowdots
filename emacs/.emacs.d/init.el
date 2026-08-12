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

;; Doom-style leader keys.  SPC is the leader in Evil states; M-SPC makes
;; the same bindings available while inserting text or in Emacs state.
(use-package which-key
  :config
  (which-key-mode 1))

(use-package recentf
  :ensure nil
  :config
  (recentf-mode 1))

(use-package general
  :after evil
  :config
  (general-create-definer my/leader
    :states '(normal visual motion)
    :keymaps 'override
    :prefix "SPC"
    :non-normal-prefix "M-SPC")

  (my/leader
    "SPC" '(execute-extended-command :which-key "M-x")
    "."   '(find-file :which-key "find file")
    ","   '(switch-to-buffer :which-key "switch buffer")
    "`"   '(mode-line-other-buffer :which-key "last buffer")

    "b"   '(:ignore t :which-key "buffer")
    "bb"  '(switch-to-buffer :which-key "switch buffer")
    "bd"  '(kill-current-buffer :which-key "kill buffer")
    "bk"  '(kill-current-buffer :which-key "kill buffer")
    "bn"  '(next-buffer :which-key "next buffer")
    "bp"  '(previous-buffer :which-key "previous buffer")
    "bS"  '(save-some-buffers :which-key "save all buffers")

    "c"   '(:ignore t :which-key "code")
    "ca"  '(eglot-code-actions :which-key "code action")
    "cd"  '(xref-find-definitions :which-key "definition")
    "cD"  '(xref-find-references :which-key "references")
    "cr"  '(eglot-rename :which-key "rename")
    "cf"  '(apheleia-format-buffer :which-key "format buffer")

    "f"   '(:ignore t :which-key "file")
    "ff"  '(find-file :which-key "find file")
    "fR"  '(rename-visited-file :which-key "rename file")
    "fr"  '(recentf-open-files :which-key "recent files")
    "fs"  '(save-buffer :which-key "save file")
    "fS"  '(save-some-buffers :which-key "save all files")
    "fe"  '(find-file :which-key "open file")

    "h"   '(:ignore t :which-key "help")
    "hf"  '(describe-function :which-key "function")
    "hk"  '(describe-key :which-key "key")
    "hm"  '(describe-mode :which-key "mode")
    "hv"  '(describe-variable :which-key "variable")

    "p"   '(:ignore t :which-key "project")
    "pp"  '(project-switch-project :which-key "switch project")
    "pf"  '(project-find-file :which-key "find file")
    "pd"  '(project-dired :which-key "dired")
    "pk"  '(project-kill-buffers :which-key "kill buffers")
    "ps"  '(project-find-regexp :which-key "search project")

    "q"   '(:ignore t :which-key "quit/session")
    "qq"  '(save-buffers-kill-emacs :which-key "quit Emacs")

    "w"   '(:ignore t :which-key "window")
    "w="  '(balance-windows :which-key "balance windows")
    "wc"  '(delete-window :which-key "close window")
    "wd"  '(delete-window :which-key "delete window")
    "wh"  '(windmove-left :which-key "window left")
    "wj"  '(windmove-down :which-key "window down")
    "wk"  '(windmove-up :which-key "window up")
    "wl"  '(windmove-right :which-key "window right")
    "ws"  '(split-window-below :which-key "split below")
    "wv"  '(split-window-right :which-key "split right")))

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

(add-hook 'dired-mode-hook
          (lambda ()
            (dired-hide-details-mode 1)))

(auto-save-visited-mode 1)
(setq auto-save-visited-interval 1)
(setq after-focus-change-function (lambda () (save-some-buffers t)))
;;; init.el ends here
