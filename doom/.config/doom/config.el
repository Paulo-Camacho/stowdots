;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

(setq doom-font
      (font-spec :family "Iosevka Nerd Font Mono"
                 :size 14
                 :weight 'normal))

(setq doom-theme 'doom-one)

;; Auto save visited files every 1 second
(setq auto-save-visited-interval 1
      auto-save-no-message t)

(auto-save-visited-mode 1)

(setq frame-resize-pixelwise t)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(set-frame-parameter nil 'fullscreen 'maximized)

;; If you use `org' and don't want your org files in the default location below,
(setq org-directory "~/org/")

;; maps
;; I defined a var then defined a function, then a map that calls that function
;; (defvar my/notes-dir
;;   (expand-file-name "~/shared/notes/"))
(defun my/open-notes ()
  "Open the notes directory in Dired."
  (interactive)
  (make-directory "~/shared/notes/" t)
  (dired "~/shared/notes/"))
(map! :leader
      :desc "Open notes directory"
      "n n" #'my/open-notes)

;; displaying file tree ascending to oldest
(after! treemacs
  (setq treemacs-sorting 'mod-time-desc))

(after! elfeed-org
  (setq rmh-elfeed-org-files (list "~/org/elfeed.org")))

;; turns off the prompt asking if you really want to quit
(setq confirm-kill-emacs nil)

;; turned on, this hides the details such as permissions and dates inside of dired. turn back on with the ( key
(after! dirvish
;; dired lists newest to oldest
  (setq dirvish-hide-details t))
;; fallback for ordinary Dired buffers
(after! dired
  (setq dired-listing-switches "-Alht")
  (add-hook 'dired-mode-hook
            (lambda ()
              (dired-hide-details-mode 1))
            t))

;; macOs dired grouping
(setq ls-lisp-use-insert-directory-program nil
      ls-lisp-dirs-first t)

;; traversing wraped lines
(after! evil
  (setq evil-respect-visual-line-mode t))

;; line wrapping
(global-visual-line-mode 1)

;; optimizing emacs*
;; Increase line length and file size limits before disabling features
(setq large-file-warning-threshold 10000000) ; 10MB
;; Automatically turn off heavy features for large buffers
(add-hook 'find-file-hook
          (lambda ()
            (when (> (buffer-size) 10000) ; 1MB threshold
              ;; (hl-line-mode -1)
              ;; (font-lock-mode -1)
              ;; (lsp-disconnect)
              ;; (flycheck-mode -1)
              ))
          )

(setq display-line-numbers-type 't)
(global-so-long-mode 1)
