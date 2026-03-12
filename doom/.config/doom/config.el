;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; line-numbers
(setq display-line-numbers-type 'relative)

;; transparency
(set-frame-parameter (selected-frame) 'alpha '(97 . 97))
(add-to-list 'default-frame-alist '(alpha . (97 . 97)))

;; shortcuts for commonly visted dirs
(map! :leader
      (:prefix-map ("n" . "notes")
       :desc "notes"        "n" (lambda () (interactive) (dired "~/shared/shared_notes/notes/"))
       :desc "jot file"     "j" (lambda () (interactive) (find-file "~/shared/shared_notes/notes/jot.org"))
       :desc "school notes" "s" (lambda () (interactive) (dired "~/shared/shared_notes/school_notes/"))
       :desc "CST205"       "d" (lambda () (interactive) (dired "~/shared/shared_notes/school_notes/design_cst205/"))
       :desc "CST370"       "a" (lambda () (interactive) (dired "~/shared/shared_notes/school_notes/algorithms_cst370/"))
       :desc "config"       "P" (lambda () (interactive) (find-file "~/.config/doom/config.el"))))


(defun my/open-notes ()
  (interactive)
  (dired "~/shared/shared_notes/notes/"))

(add-hook 'doom-after-init-hook
  (lambda ()
    (add-to-list '+doom-dashboard-menu-sections
      '("Open notes"
        :icon (nerd-icons-faicon "nf-fa-folder_open" :face 'doom-dashboard-menu-title)
        :key "SPC n n"
        :face 'doom-dashboard-menu-title
        :action my/open-notes))))
