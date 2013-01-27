(when window-system (server-start))

(font-lock-add-keywords 'emacs-lisp-mode
 '(("\\(setq\\)" 1 font-lock-keyword-face)
   ("\\(load\\)" 1 font-lock-keyword-face)))

(setq ring-bell-function 'ignore)

(menu-bar-mode (if window-system 1 0))
(tool-bar-mode 0)
(scroll-bar-mode 0)

(setq shell-file-name "zsh")
(add-to-list 'exec-path "/usr/local/bin")

(global-auto-revert-mode t)

(ido-mode 1)
(setq ido-enanble-flex-matching t
      ido-everywhere t)

(defun select-text-in-quote ()
  "Select text between the nearest left and right delimiters.
Delimiters are paired characters:
 () [] {} «» ‹› “” 〖〗 【】 「」 『』 （） 〈〉 《》 〔〕 ⦗⦘ 〘〙 ⦅⦆ 〚〛 ⦃⦄
 For practical purposes, also: \"\", but not single quotes."
 (interactive)
 (let (p1)
   (skip-chars-backward "^<>([{“「『‹«（〈《〔【〖⦗〘⦅〚⦃\"")
   (setq p1 (point))
   (skip-chars-forward "^<>)]}”」』›»）〉》〕】〗⦘〙⦆〛⦄\"")
   (set-mark p1)
   )
 )

(global-set-key (kbd "M-*") 'select-text-in-quote)

(global-set-key (kbd "RET") 'newline-and-indent) ; was C-j
(global-set-key (kbd "C-j") 'join-line) ; more useful C-j
(global-set-key (kbd "C-h") 'delete-backward-char); C-h for backspace

(setq delete-by-moving-to-trash t)

(add-hook 'c-mode-hook
	  '(lambda ()
	     (flymake-mode t)))

(setq make-backup-files nil)
(setq auto-save-default nil)

(electric-pair-mode)
(show-paren-mode)
(require 'package)
(add-to-list 'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

(setq geiser-impl-installed-implementations '(guile))
(setq-default indent-tabs-mode nil)
(setq ruby-deep-indent-paren nil)
