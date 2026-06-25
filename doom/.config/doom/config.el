;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 't)

;; Auto save buffer
(setq auto-save-visited-interval 1)
(auto-save-visited-mode +1)

;; Initial window boot size perfect for m1 macbook air
;; (setq initial-frame-alist
;;       '((top . 50)          ; Pixels from the top of the screen
;;         (left . 50)         ; Pixels from the left of the screen
;;         (width . 170)       ; Width in character columns
;;         (height . 50)))     ; Height in character rows
;;
;;
;; (defun frame-center ()
;;   "Center the current frame."
;;   (interactive)
;;   (let* ((dw (display-pixel-width))
;;          (dh (display-pixel-height))
;;          (f  (selected-frame))
;;          (fw (frame-pixel-width f))
;;          (fh (frame-pixel-height f))
;;          (x  (- (/ dw 2) (/ fw 2)))
;;          (y  (- (/ dh 2) (/ fh 2))))
;;     (message (format "dw %d dh %d fw %d fh %d x %d y %d" dw dh fw fh x y))
;;     (set-frame-position f x y)))

(defun frame-center ()
  ;; Someones's code using Polish notation that I modifed to recieve a scalar of two
  (interactive)
  (let* ((dw (display-pixel-width))
         (dh (display-pixel-height))
         (f  (selected-frame))
         ;; Force precision pixel sizing on macOS
         (_  (setq frame-resize-pixelwise t))
         ;; 1. Scale the width and height by 2 using Polish notation
         (fw (* (frame-pixel-width f) 2))
         (fh (* (frame-pixel-height f) 2))
         ;; 2. Set the frame size to the new doubled values
         (_  (set-frame-size f fw fh t))
         ;; 3. Calculate centering math based on the new doubled size
         (x  (- (/ dw 2) (/ fw 2)))
         (y  (- (/ dh 2) (/ fh 2))))
    (message (format "dw %d dh %d fw %d fh %d x %d y %d" dw dh fw fh x y))
    (set-frame-position f x y)))

(frame-center)

;; (add-hook 'doom-after-init-modules-hook #'frame-center)


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Transparency (This might be overrated as I always seem to add it and get rid of it after the fact)
;; (set-frame-parameter (selected-frame) 'alpha '(98. 98))
;; (add-to-list 'default-frame-alist '(alpha . (98. 98)))

;; Sort newest files first
;; Treemacs: newest modified files first.
;; (after! treemacs
;;   (setq treemacs-sorting 'mod-time-desc))

;; Dired lists newest modified files first
(after! dired
  (setq dired-listing-switches "-alht"))

;; Function to key stroke to add SPC n n to open my notes
(defvar my/notes-dir (expand-file-name "~/shared/notes/"))

(defun my/open-notes ()
  (interactive)
  (make-directory my/notes-dir t)
  (dired my/notes-dir))

(map! :leader
      :desc "Open notes directory"
      "n n" #'my/open-notes)
