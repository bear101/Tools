
;;; BS - comfortable buffer selection
;(require 'bs)
;(global-set-key "\C-x\C-b" 'bs-show)

;;; ps-print - PostScript printing
;(require 'ps-print)

;;; printing - printing utilities
;(require 'printing)

;;; PCL-CVS - front end to CVS
;(load "pcl-cvs-startup")

;;Faver i emacs
(global-font-lock-mode t)

;;Tab size
;;(setq-default tab-width 4)

;; disable tabs
(setq-default indent-tabs-mode nil)

;COLOR
(set-foreground-color "Grey")
(set-background-color "Black")

;;Highlight the current line
;;(global-hl-line-mode 1)

;;regional
(set-language-environment 'Latin-1)
;;(standard-display-european 1)
(set-keyboard-coding-system 'iso-latin-1)

;;Scroll one line at the time
;;(setq scroll-step 1)

;; Scroll margin and stop-that-bloody-halfpage-jump
(setq scroll-margin 0)
(setq scroll-step 0)
(setq scroll-conservatively 100)

;; Show column-number in the mode line
(column-number-mode 1)

;disable backup
(setq make-backup-files nil)

;setup backup dir
(setq backup-directory-alist (list (cons ".*" (expand-file-name "~/.emacs.d/auto-save-list"))))

; Set default mode to be Text.
(setq default-major-mode 'text-mode)

;; this says the word wrap should take place at column ##
;;(setq fill-column 80)


; This turns on word wrap at end of line.
;(setq text-mode-hook 'turn-on-auto-fill)

(put 'upcase-region 'disabled nil)

(tool-bar-mode 0)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(case-fold-search t)
 '(current-language-environment "Latin-1")
 '(default-input-method "latin-1-prefix")
 '(delete-selection-mode nil)
 '(global-font-lock-mode t nil (font-lock))
 '(gnus-always-force-window-configuration t)
 '(gnus-use-full-window t)
 '(inhibit-startup-screen t)
 '(mark-even-if-inactive t)
 '(preview-default-option-list (quote ("displaymath" "floats" "graphics" "textmath" "sections")))
 '(preview-gs-options (quote ("-q" "-dSAFER" "-dDELAYSAFER" "-dNOPAUSE" "-DNOPLATFONTS")))
 '(scheme-program-name "mzscheme")
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t nil (paren))
 '(transient-mark-mode 1))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;;set default font
;(set-default-font "-adobe-courier-medium-r-normal--14-140-75-75-m-90-iso8859-1")

;;To disable the menu bar, place the following line in your .emacs file:
(menu-bar-mode -1)

;;To disable the scrollbar, use the following line:
(toggle-scroll-bar -1)



;; Scroll without moving cursor
(defun scroll-down-keep-cursor () 
;; the text one line down while keeping the cursor 
    (interactive) 
    (scroll-down 1))
(defun scroll-up-keep-cursor () 
    ;; Scroll the text one line up while keeping the cursor 
    (interactive) 
    (scroll-up 1))

;; VS mode
(defun vs-mode ()
  "Visual Studio mode."
  (interactive)
  (c++-mode)
  (c-set-style "k&r")
  (setq tab-width 4)
  (setq indent-tabs-mode 1)
  (setq c-basic-offset 4))

;;TIP mode

(defun tip-c-mode ()
  "C mode with defaults adjusted for the TIP project."
  (interactive)
  (c-mode)
  (c-set-style "k&r")
  (setq tab-width 8)
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4))

;;Make TIP mode my default C mode
(defun my-c-mode-common-hook ()
(c-set-style "k&r")
(setq tab-width 8)
(setq indent-tabs-mode nil)
(setq c-basic-offset 4))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; ========== Support Wheel Mouse Scrolling ==========
(mouse-wheel-mode t) 

;;Extension .h should default to c++-mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Pulled from JanBorsodi.emacs
(defvar c++-header-ext-regexp "\\.\\(hpp\\|h\\|\hh\\|H\\)$")
(defvar c++-source-ext-regexp "\\.\\(cpp\\|c\\|\cc\\|C\\|mm\\)$")
(defvar c++-default-header-ext "hpp")
(defvar c++-default-source-ext "cpp")
(defvar c++-source-extension-list '("c" "cc" "C" "cpp" "mm"))
(defvar c++-header-extension-list '("h" "hh" "H" "hpp"))
(defun toggle-source-header()
  "Switches to the source buffer if currently in the header buffer and vice versa."
  (interactive)
  (let ((buf (current-buffer))
	(name (file-name-nondirectory (buffer-file-name)))
	file
	offs)
    (setq offs (string-match c++-header-ext-regexp name))
    (if offs
	(let ((lst c++-source-extension-list)
	      (ok nil)
	      ext)
	  (setq file (substring name 0 offs))
	  (while (and lst (not ok))
	    (setq ext (car lst))
	    (if (file-exists-p (concat file "." ext))
		(setq ok t))
	    (setq lst (cdr lst)))
	  (if ok
	      (find-file (concat file "." ext))))
      (let ()
	(setq offs (string-match c++-source-ext-regexp name))
	(if offs
	    (let ((lst c++-header-extension-list)
		  (ok nil)
		  ext)
	      (setq file (substring name 0 offs))
	      (while (and lst (not ok))
		(setq ext (car lst))
		(if (file-exists-p (concat file "." ext))
		    (setq ok t))
		(setq lst (cdr lst)))
	      (if ok
		  (find-file (concat file "." ext)))))))))


;;Shortcuts
(global-set-key [end] 'end-of-line)
(global-set-key "\C-cc" 'comment-region)
(global-set-key "\C-cu" 'uncomment-region)
(global-set-key "\C-ci" 'indent-region)
(global-set-key '[C-M-up] 'scroll-down-keep-cursor)
(global-set-key '[C-M-down] 'scroll-up-keep-cursor)
(global-set-key '[C-up] 'scroll-down-keep-cursor)
(global-set-key '[C-down] 'scroll-up-keep-cursor)
(global-set-key [f3] 'bs-cycle-next)
(global-set-key [f4] 'bs-cycle-previous)
(global-set-key '[M-right] 'bs-cycle-next)
(global-set-key '[M-left] 'bs-cycle-previous)
(global-set-key '[C-v]    'pager-page-down)
(global-set-key [next]    'pager-page-down)
(global-set-key "\ev"     'pager-page-up)
(global-set-key [prior]   'pager-page-up)
(global-set-key [M-p]    'pager-row-up)
(global-set-key '[M-up]   'pager-row-up)
(global-set-key '[M-kp-8] 'pager-row-up)
(global-set-key '[M-n]    'pager-row-down)
(global-set-key '[M-down] 'pager-row-down)
(global-set-key '[M-kp-2] 'pager-row-down)
(global-set-key "\M--"    'tags-search)
(global-set-key "\M-n" 'hippie-expand)
(define-key global-map "\M-o" 'toggle-source-header)

;; Query Replace in open Buffers
(defun query-replace-in-open-buffers (arg1 arg2)
  "query-replace in open files"
  (interactive "sQuery Replace in open Buffers: \nsquery with: ")
  (mapcar
   (lambda (x)
     (find-file x)
     (save-excursion
       (beginning-of-buffer)
       (query-replace arg1 arg2)))
   (delq
    nil
    (mapcar
     (lambda (x)
       (buffer-file-name x))
     (buffer-list)))))

(defun revert-all-buffers ()
    "Refreshes all open buffers from their respective files."
    (interactive)
    (dolist (buf (buffer-list))
      (with-current-buffer buf
        (when (and (buffer-file-name) (file-exists-p (buffer-file-name)) (not (buffer-modified-p)))
          (revert-buffer t t t) )))
    (message "Refreshed open files.") )



;; Pager stuff (scroll uten aa flytte cursoren)
(load-file "~/.emacs.d/pager.el")
(require 'pager)

(load-file "~/.emacs.d/markdown-mode.el")
(load-file "~/.emacs.d/gud.el")

;; Don't include filename in annotate
(setq vc-git-annotate-switches '("-w"))

(server-start)

;; Emacs 25.0 complains about this...
;; (setq load-path (cons (expand-file-name "~/.emacs.d") load-path))
;;(require 'cmake-mode)
