;; $DOOMDIR/config.el -*- lexical-binding: t; -*-


;; See 'C-h v doom-font' for documentation and more examples of what they


; line-numbers
(setq display-line-numbers-type 'relative)

;; transparency
(set-frame-parameter (selected-frame) 'alpha '(99 . 99)) (add-to-list 'default-frame-alist '(alpha . (95 . 95)))

;; adding notes to menu
(after! doom-dashboard
  (add-to-list '+doom-dashboard-menu-sections


    '("Open notes"
      :icon (nerd-icons-octicon "nf-oct-file_directory" :face 'doom-dashboard-menu-title)
      :key "SPC n n"
      :action (lambda () (dired "~/shared/shared_notes/notes/")))))

(map! :leader
      :desc "Open notes" "n n"
      (lambda () (interactive) (dired "~/shared/shared_notes/notes/")))

(map! :leader
      :desc "Search notes" "n n"
      (lambda () (interactive)(dired "~/shared/shared_notes/notes/")))
        ;; (consult-ripgrep "~/shared/shared_notes/notes/")))
(map! :leader
      :desc "Search notes" "s n"
      (lambda () (interactive)(dired "~/shared/shared_notes/school_notes/")))



;; collapse all headings of files
;; (setq org-startup-folded 'overview)

;; (add-to-list 'default-frame-alist '(undecorated . t))

; Start Doom Emacs in fullscreen on launch
; 
; (add-to-list 'initial-frame-alist '(fullscreen . maximized))
; ;; Ensure any new frames also open fullscreen
; (add-to-list 'default-frame-alist '(fullscreen . maximized))

;-------------------------------------------------------------

; (setq org-directory "~/org/")
;
;
;
; (defun my/revert-buffer-no-confirm ()
;   "Revert buffer without confirmation."
;   (interactive)
;   (when (buffer-file-name)
;     (revert-buffer :ignore-auto :noconfirm)))
;
; (add-hook 'server-after-make-frame-hook
;           (lambda ()
;             (my/revert-buffer-no-confirm)))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
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
