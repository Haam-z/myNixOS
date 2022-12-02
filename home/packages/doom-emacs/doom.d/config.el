(setq user-full-name "Haam"
      user-mail-address "hamzazarouk@gmail.com")

(setq ispell-program-name "/usr/bin/hunspell")
(setq doom-theme 'doom-tokyo-night)
(setq display-line-numbers-type t)
(setq doom-font (font-spec :family "Fira Code Nerd Font" :size 18 :weight 'bold)
      doom-variable-pitch-font (font-spec :family "DejaVu Sans" :size 13))
(add-hook 'org-mode-hook 'org-indent-mode)
(setq org-directory "~/Org/"
      org-agenda-files '("~/Org/agenda.org")
      org-default-notes-file (expand-file-name "notes.org" org-directory)
      org-ellipsis " ▼ "
      org-log-done 'time
      org-journal-dir "~/Org/journal/"
      org-journal-date-format "%B %d, %Y (%A) "
      org-journal-file-format "%Y-%m-%d.org"
      org-hide-emphasis-markers t)
(setq org-src-preserve-indentation nil
      org-src-tab-acts-natively t
      org-edit-src-content-indentation 0)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-src-fontify-natively t
    org-src-tab-acts-natively t
    org-confirm-babel-evaluate nil
    org-edit-src-content-indentation 0)

  (cl-loop for file in '("/usr/local/bin/fish" "/bin/fish")
	   when (file-exists-p file)
	   do (progn
		(setq shell-file-name file)
		(cl-return)))
  (setenv "SHELL" shell-file-name)

(setq-default bidi-display-reordering 'left-to-right
              bidi-paragraph-direction 'left-to-right)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-hook 'pdf-tools-enabled-hook 'pdf-view-midnight-minor-mode)
(map! :leader
      :desc "Get me in ranger"
      "e" #'ranger)
(setq display-line-numbers-type 'relative)
(setq fancy-splash-image "./EmacsIcon.png")
