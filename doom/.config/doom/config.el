;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; line-numbers
(setq display-line-numbers-type 'relative)

;; shortcuts for commonly visted dirs
(map! :leader
      (:prefix-map ("n" . "notes")
       :desc "notes files"  "n" (lambda () (interactive) (dired "~/shared/shared_notes/notes/"))
       :desc "jot note"     "j" (lambda () (interactive) (find-file "~/shared/shared_notes/notes/jot.org"))
       :desc "todo notes"   "t" (lambda () (interactive) (find-file "~/shared/shared_notes/notes/todo.org"))
       :desc "emacs notes"  "e" (lambda () (interactive) (find-file "~/shared/shared_notes/notes/jot.org"))
       :desc "school files" "s" (lambda () (interactive) (dired "~/shared/shared_notes/school_notes/"))
       :desc "CST205"       "d" (lambda () (interactive) (dired "~/shared/shared_notes/school_notes/design_cst205/"))
       :desc "CST370"       "a" (lambda () (interactive) (dired "~/shared/shared_notes/school_notes/algorithms_cst370/"))
       :desc "config"       "P" (lambda () (interactive) (find-file "~/.config/doom/config.el"))))

;; removes "Open project" from the splash screen
(assoc-delete-all "Open project" +doom-dashboard-menu-sections)

;; this function calls of the definition below it to add notes to the splashscreen
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

;; this function calls of the definition below it to add emacs to the splashscreen
(defun my/open-emacs-notes ()
  (interactive)
  (find-file "~/shared/shared_notes/notes/emacs.org"))

(add-hook 'doom-after-init-hook
  (lambda ()
    (add-to-list '+doom-dashboard-menu-sections
      '("Open emacs notes"
        :icon (nerd-icons-devicon"nf-dev-emacs" :face 'doom-dashboard-menu-title)
        :key "SPC n e"
        :face 'doom-dashboard-menu-title
        :action my/open-emacs-notes))))

;; this adds rainbow delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

