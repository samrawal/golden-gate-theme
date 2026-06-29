;;; golden-gate-dark-theme.el --- Dark Golden Gate theme -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Sam Rawal

;; Author: Sam Rawal
;; URL: https://github.com/samrawal/golden-gate-theme
;; Version: 0.1.0
;; Package-Requires: ((emacs "27.1"))
;; Keywords: faces, theme

;;; Commentary:

;; A dark Emacs theme based on the Golden Gate Bridge, bay water,
;; cypress trees, and a dark copper accent.

;;; Code:

(deftheme golden-gate-dark
  "A dark theme inspired by the Golden Gate.")

(let* ((class '((class color) (min-colors 89)))
       (bg "#10130f")
       (bg-alt "#181b16")
       (bg-soft "#20251d")
       (bg-strong "#2c3325")
       (fg "#eadfca")
       (fg-muted "#b7aa90")
       (fg-faint "#7d735f")
       (bridge "#d66a4d")
       (bridge-light "#ef8667")
       (bay "#5ca7c9")
       (bay-light "#87c4df")
       (bay-soft "#173142")
       (cypress "#8fa866")
       (cypress-light "#aac276")
       (copper "#c98243")
       (copper-light "#e19a5e")
       (copper-dark "#7f4a28")
       (cliff "#b7955a")
       (wood "#d0b88b")
       (rust-shadow "#bf7c66")
       (cyan "#65b8c7")
       (warning "#d08a4e"))
  (custom-theme-set-faces
   'golden-gate-dark

   ;; Core editor
   `(default ((,class (:background ,bg :foreground ,fg))))
   `(cursor ((,class (:background ,copper))))
   `(fringe ((,class (:background ,bg :foreground ,fg-faint))))
   `(vertical-border ((,class (:foreground ,bg-strong))))
   `(window-divider ((,class (:foreground ,bg-strong))))
   `(window-divider-first-pixel ((,class (:foreground ,bg-strong))))
   `(window-divider-last-pixel ((,class (:foreground ,bg-strong))))
   `(highlight ((,class (:background ,bay-soft))))
   `(hl-line ((,class (:background ,bg-soft))))
   `(region ((,class (:background "#33495a" :extend t))))
   `(secondary-selection ((,class (:background "#3a321f" :extend t))))
   `(trailing-whitespace ((,class (:background "#5b241e"))))
   `(escape-glyph ((,class (:foreground ,copper-light :weight bold))))
   `(homoglyph ((,class (:foreground ,copper-light :weight bold))))
   `(minibuffer-prompt ((,class (:foreground ,copper :weight bold))))
   `(link ((,class (:foreground ,bay-light :underline t))))
   `(link-visited ((,class (:foreground ,rust-shadow :underline t))))
   `(shadow ((,class (:foreground ,fg-faint))))
   `(success ((,class (:foreground ,cypress-light :weight bold))))
   `(warning ((,class (:foreground ,warning :weight bold))))
   `(error ((,class (:foreground ,bridge-light :weight bold))))
   `(match ((,class (:background "#354022" :foreground ,fg :weight bold))))
   `(lazy-highlight ((,class (:background "#3a2b20" :foreground ,fg))))
   `(isearch ((,class (:background ,copper :foreground ,bg :weight bold))))
   `(isearch-fail ((,class (:background ,bridge :foreground ,bg :weight bold))))

   ;; Lines and structural UI
   `(line-number ((,class (:background ,bg :foreground ,fg-faint))))
   `(line-number-current-line ((,class (:background ,bg-soft :foreground ,copper-light :weight bold))))
   `(show-paren-match ((,class (:background "#3a2b20" :foreground ,copper-light :weight bold))))
   `(show-paren-mismatch ((,class (:background ,bridge :foreground ,bg :weight bold))))
   `(header-line ((,class (:background ,bg-alt :foreground ,fg :box (:line-width -1 :color ,bg-strong)))))
   `(mode-line ((,class (:background ,copper-dark :foreground ,fg :box (:line-width -1 :color ,copper)))))
   `(mode-line-active ((,class (:background ,copper-dark :foreground ,fg :box (:line-width -1 :color ,copper)))))
   `(mode-line-inactive ((,class (:background ,bg-alt :foreground ,fg-muted :box (:line-width -1 :color ,bg-strong)))))
   `(mode-line-buffer-id ((,class (:foreground ,copper-light :weight bold))))

   ;; Syntax
   `(font-lock-builtin-face ((,class (:foreground ,copper))))
   `(font-lock-comment-face ((,class (:foreground ,fg-faint :slant italic))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,fg-faint :slant italic))))
   `(font-lock-constant-face ((,class (:foreground ,copper-light))))
   `(font-lock-doc-face ((,class (:foreground ,cypress-light :slant italic))))
   `(font-lock-function-name-face ((,class (:foreground ,bay-light :weight semi-bold))))
   `(font-lock-keyword-face ((,class (:foreground ,bridge-light :weight semi-bold))))
   `(font-lock-negation-char-face ((,class (:foreground ,bridge-light :weight bold))))
   `(font-lock-preprocessor-face ((,class (:foreground ,copper))))
   `(font-lock-regexp-grouping-backslash ((,class (:foreground ,bridge-light :weight bold))))
   `(font-lock-regexp-grouping-construct ((,class (:foreground ,copper-light :weight bold))))
   `(font-lock-string-face ((,class (:foreground ,cypress-light))))
   `(font-lock-type-face ((,class (:foreground ,cliff))))
   `(font-lock-variable-name-face ((,class (:foreground ,wood))))
   `(font-lock-warning-face ((,class (:foreground ,warning :weight bold))))

   ;; Built-in UI packages
   `(button ((,class (:foreground ,bay-light :underline t))))
   `(completions-common-part ((,class (:foreground ,copper-light :weight bold))))
   `(completions-first-difference ((,class (:foreground ,bridge-light :weight bold))))
   `(tooltip ((,class (:background ,bg-alt :foreground ,fg))))
   `(help-key-binding ((,class (:background ,bg-alt :foreground ,copper-light :box (:line-width -1 :color ,bg-strong)))))
   `(eldoc-highlight-function-argument ((,class (:foreground ,copper-light :weight bold))))

   ;; Dired
   `(dired-directory ((,class (:foreground ,bay-light :weight bold))))
   `(dired-flagged ((,class (:foreground ,bridge-light))))
   `(dired-header ((,class (:foreground ,copper-light :weight bold))))
   `(dired-ignored ((,class (:foreground ,fg-faint))))
   `(dired-mark ((,class (:foreground ,copper-light :weight bold))))
   `(dired-marked ((,class (:background ,bg-soft :foreground ,copper-light :weight bold))))
   `(dired-perm-write ((,class (:foreground ,fg-muted))))
   `(dired-symlink ((,class (:foreground ,cyan :weight bold))))
   `(dired-warning ((,class (:foreground ,warning :weight bold))))

   ;; Org and markdown
   `(org-level-1 ((,class (:foreground ,copper-light :height 1.18 :weight bold))))
   `(org-level-2 ((,class (:foreground ,bridge-light :height 1.12 :weight bold))))
   `(org-level-3 ((,class (:foreground ,bay-light :height 1.08 :weight bold))))
   `(org-level-4 ((,class (:foreground ,cypress-light :weight bold))))
   `(org-level-5 ((,class (:foreground ,cliff :weight bold))))
   `(org-level-6 ((,class (:foreground ,rust-shadow :weight bold))))
   `(org-block ((,class (:background ,bg-soft :foreground ,fg :extend t))))
   `(org-block-begin-line ((,class (:background ,bg-alt :foreground ,fg-faint :extend t))))
   `(org-block-end-line ((,class (:background ,bg-alt :foreground ,fg-faint :extend t))))
   `(org-code ((,class (:foreground ,copper-light))))
   `(org-date ((,class (:foreground ,bay-light :underline t))))
   `(org-done ((,class (:foreground ,cypress-light :weight bold))))
   `(org-document-title ((,class (:foreground ,copper-light :height 1.25 :weight bold))))
   `(org-link ((,class (:foreground ,bay-light :underline t))))
   `(org-quote ((,class (:background ,bg-soft :foreground ,fg-muted :slant italic :extend t))))
   `(org-special-keyword ((,class (:foreground ,fg-faint))))
   `(org-todo ((,class (:foreground ,bridge-light :weight bold))))
   `(org-verbatim ((,class (:foreground ,copper))))
   `(markdown-header-face-1 ((,class (:foreground ,copper-light :height 1.18 :weight bold))))
   `(markdown-header-face-2 ((,class (:foreground ,bridge-light :height 1.12 :weight bold))))
   `(markdown-header-face-3 ((,class (:foreground ,bay-light :height 1.08 :weight bold))))
   `(markdown-code-face ((,class (:background ,bg-soft :foreground ,copper-light))))
   `(markdown-blockquote-face ((,class (:foreground ,fg-muted :slant italic))))
   `(markdown-link-face ((,class (:foreground ,bay-light :underline t))))

   ;; Diff, vc, and Magit
   `(diff-added ((,class (:background "#1e3324" :foreground ,cypress-light :extend t))))
   `(diff-removed ((,class (:background "#3a201c" :foreground ,bridge-light :extend t))))
   `(diff-changed ((,class (:background "#3a2b20" :foreground ,copper-light :extend t))))
   `(diff-refine-added ((,class (:background "#29462d" :foreground ,cypress-light :weight bold))))
   `(diff-refine-removed ((,class (:background "#512a21" :foreground ,bridge-light :weight bold))))
   `(diff-header ((,class (:background ,bg-alt :foreground ,fg))))
   `(diff-file-header ((,class (:background ,bg-strong :foreground ,fg :weight bold))))
   `(vc-conflict-state ((,class (:foreground ,bridge-light :weight bold))))
   `(vc-edited-state ((,class (:foreground ,copper-light))))
   `(vc-up-to-date-state ((,class (:foreground ,cypress-light))))
   `(magit-section-heading ((,class (:foreground ,copper-light :weight bold))))
   `(magit-branch-current ((,class (:foreground ,bay-light :box t :weight bold))))
   `(magit-branch-local ((,class (:foreground ,bay-light))))
   `(magit-branch-remote ((,class (:foreground ,cypress-light))))
   `(magit-hash ((,class (:foreground ,fg-faint))))
   `(magit-diff-added ((,class (:background "#1e3324" :foreground ,cypress-light :extend t))))
   `(magit-diff-added-highlight ((,class (:background "#29462d" :foreground ,cypress-light :extend t))))
   `(magit-diff-removed ((,class (:background "#3a201c" :foreground ,bridge-light :extend t))))
   `(magit-diff-removed-highlight ((,class (:background "#512a21" :foreground ,bridge-light :extend t))))
   `(magit-diff-context ((,class (:foreground ,fg-muted :extend t))))
   `(magit-diff-context-highlight ((,class (:background ,bg-soft :foreground ,fg :extend t))))
   `(magit-diff-file-heading ((,class (:foreground ,fg :weight bold))))
   `(magit-diff-file-heading-highlight ((,class (:background ,bg-soft :weight bold))))
   `(magit-diff-hunk-heading ((,class (:background ,bg-alt :foreground ,fg-muted :extend t))))
   `(magit-diff-hunk-heading-highlight ((,class (:background ,bg-strong :foreground ,fg :extend t))))

   ;; Completion frameworks
   `(company-tooltip ((,class (:background ,bg-alt :foreground ,fg))))
   `(company-tooltip-selection ((,class (:background "#33495a" :foreground ,fg))))
   `(company-tooltip-common ((,class (:foreground ,copper-light :weight bold))))
   `(company-tooltip-annotation ((,class (:foreground ,fg-muted))))
   `(company-scrollbar-bg ((,class (:background ,bg-strong))))
   `(company-scrollbar-fg ((,class (:background ,fg-faint))))
   `(corfu-default ((,class (:background ,bg-alt :foreground ,fg))))
   `(corfu-current ((,class (:background "#33495a" :foreground ,fg))))
   `(vertico-current ((,class (:background "#33495a" :foreground ,fg))))
   `(orderless-match-face-0 ((,class (:foreground ,copper-light :weight bold))))
   `(orderless-match-face-1 ((,class (:foreground ,bridge-light :weight bold))))
   `(orderless-match-face-2 ((,class (:foreground ,bay-light :weight bold))))
   `(orderless-match-face-3 ((,class (:foreground ,cypress-light :weight bold))))
   `(ivy-current-match ((,class (:background "#33495a" :foreground ,fg :weight bold))))
   `(ivy-minibuffer-match-face-1 ((,class (:foreground ,fg))))
   `(ivy-minibuffer-match-face-2 ((,class (:foreground ,copper-light :weight bold))))
   `(ivy-minibuffer-match-face-3 ((,class (:foreground ,bridge-light :weight bold))))
   `(ivy-minibuffer-match-face-4 ((,class (:foreground ,cypress-light :weight bold))))
   `(which-key-key-face ((,class (:foreground ,copper-light :weight bold))))
   `(which-key-command-description-face ((,class (:foreground ,fg))))
   `(which-key-group-description-face ((,class (:foreground ,bridge-light))))
   `(which-key-separator-face ((,class (:foreground ,fg-faint))))

   ;; Whitespace and terminals
   `(whitespace-space ((,class (:background ,bg :foreground ,bg-strong))))
   `(whitespace-tab ((,class (:background ,bg-soft :foreground ,bg-strong))))
   `(whitespace-trailing ((,class (:background ,bridge :foreground ,bg))))
   `(term-color-black ((,class (:foreground ,bg :background ,bg))))
   `(term-color-red ((,class (:foreground ,bridge :background ,bridge))))
   `(term-color-green ((,class (:foreground ,cypress :background ,cypress))))
   `(term-color-yellow ((,class (:foreground ,copper :background ,copper))))
   `(term-color-blue ((,class (:foreground ,bay :background ,bay))))
   `(term-color-magenta ((,class (:foreground ,rust-shadow :background ,rust-shadow))))
   `(term-color-cyan ((,class (:foreground ,cyan :background ,cyan))))
   `(term-color-white ((,class (:foreground ,fg :background ,fg)))))

  (custom-theme-set-variables
   'golden-gate-dark
   `(ansi-color-names-vector [,bg ,bridge ,cypress ,copper ,bay ,rust-shadow ,cyan ,fg])
   `(fci-rule-color ,bg-strong)))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-directory load-file-name)))

(provide-theme 'golden-gate-dark)

;;; golden-gate-dark-theme.el ends here
