;;; golden-gate-light-theme.el --- Warm light theme inspired by the Golden Gate -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Sam Rawal

;; Author: Sam Rawal
;; URL: https://github.com/samrawal/golden-gate-theme
;; Version: 0.1.0
;; Package-Requires: ((emacs "27.1"))
;; Keywords: faces, theme

;;; Commentary:

;; A warm light Emacs theme based on the Golden Gate Bridge, bay water,
;; cypress trees, and dry coastal sand.

;;; Code:

(deftheme golden-gate-light
  "A warm light theme inspired by the Golden Gate.")

(let* ((class '((class color) (min-colors 89)))
       (bg "#f7f1e6")
       (bg-alt "#eae0cf")
       (bg-soft "#f2eadc")
       (bg-strong "#d6ccb6")
       (fg "#2b2f29")
       (fg-muted "#625c4f")
       (fg-faint "#8a7e6d")
       (bridge "#a84732")
       (bridge-light "#c95d45")
       (bay "#1e668e")
       (bay-light "#cfe1ee")
       (bay-soft "#dcecf5")
       (cypress "#4f6d2f")
       (cypress-light "#6f8a40")
       (earth "#7d5412")
       (cliff "#7a5b2e")
       (wood "#4f463c")
       (rust-shadow "#7b4b3e")
       (cyan "#2b7a8e")
       (warning "#9a6a12"))
  (custom-theme-set-faces
   'golden-gate-light

   ;; Core editor
   `(default ((,class (:background ,bg :foreground ,fg))))
   `(cursor ((,class (:background ,bridge))))
   `(fringe ((,class (:background ,bg :foreground ,fg-faint))))
   `(vertical-border ((,class (:foreground ,bg-strong))))
   `(window-divider ((,class (:foreground ,bg-strong))))
   `(window-divider-first-pixel ((,class (:foreground ,bg-strong))))
   `(window-divider-last-pixel ((,class (:foreground ,bg-strong))))
   `(highlight ((,class (:background ,bay-soft))))
   `(hl-line ((,class (:background ,bg-soft))))
   `(region ((,class (:background ,bay-light :extend t))))
   `(secondary-selection ((,class (:background ,bg-alt :extend t))))
   `(trailing-whitespace ((,class (:background ,bridge-light))))
   `(escape-glyph ((,class (:foreground ,bridge :weight bold))))
   `(homoglyph ((,class (:foreground ,bridge :weight bold))))
   `(minibuffer-prompt ((,class (:foreground ,bay :weight bold))))
   `(link ((,class (:foreground ,bay :underline t))))
   `(link-visited ((,class (:foreground ,rust-shadow :underline t))))
   `(shadow ((,class (:foreground ,fg-faint))))
   `(success ((,class (:foreground ,cypress :weight bold))))
   `(warning ((,class (:foreground ,warning :weight bold))))
   `(error ((,class (:foreground ,bridge :weight bold))))
   `(match ((,class (:background "#dbe6c8" :weight bold))))
   `(lazy-highlight ((,class (:background "#e6d7b3" :foreground ,fg))))
   `(isearch ((,class (:background ,bridge :foreground ,bg :weight bold))))
   `(isearch-fail ((,class (:background ,bridge-light :foreground ,bg))))

   ;; Lines and structural UI
   `(line-number ((,class (:background ,bg :foreground ,fg-faint))))
   `(line-number-current-line ((,class (:background ,bg-soft :foreground ,fg :weight bold))))
   `(show-paren-match ((,class (:background ,bay-light :foreground ,fg :weight bold))))
   `(show-paren-mismatch ((,class (:background ,bridge :foreground ,bg :weight bold))))
   `(header-line ((,class (:background ,bg-alt :foreground ,fg :box (:line-width -1 :color ,bg-strong)))))
   `(mode-line ((,class (:background ,bg-strong :foreground ,fg :box (:line-width -1 :color ,fg-faint)))))
   `(mode-line-active ((,class (:background ,bg-strong :foreground ,fg :box (:line-width -1 :color ,fg-faint)))))
   `(mode-line-inactive ((,class (:background ,bg-alt :foreground ,fg-muted :box (:line-width -1 :color ,bg-strong)))))
   `(mode-line-buffer-id ((,class (:foreground ,bay :weight bold))))

   ;; Syntax
   `(font-lock-builtin-face ((,class (:foreground ,earth))))
   `(font-lock-comment-face ((,class (:foreground ,fg-muted :slant italic))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,fg-faint :slant italic))))
   `(font-lock-constant-face ((,class (:foreground ,rust-shadow))))
   `(font-lock-doc-face ((,class (:foreground ,cypress-light :slant italic))))
   `(font-lock-function-name-face ((,class (:foreground ,bay :weight semi-bold))))
   `(font-lock-keyword-face ((,class (:foreground ,bridge :weight semi-bold))))
   `(font-lock-negation-char-face ((,class (:foreground ,bridge :weight bold))))
   `(font-lock-preprocessor-face ((,class (:foreground ,cliff))))
   `(font-lock-regexp-grouping-backslash ((,class (:foreground ,bridge :weight bold))))
   `(font-lock-regexp-grouping-construct ((,class (:foreground ,earth :weight bold))))
   `(font-lock-string-face ((,class (:foreground ,cypress))))
   `(font-lock-type-face ((,class (:foreground ,cliff))))
   `(font-lock-variable-name-face ((,class (:foreground ,wood))))
   `(font-lock-warning-face ((,class (:foreground ,bridge :weight bold))))

   ;; Built-in UI packages
   `(button ((,class (:foreground ,bay :underline t))))
   `(completions-common-part ((,class (:foreground ,bay :weight bold))))
   `(completions-first-difference ((,class (:foreground ,bridge :weight bold))))
   `(tooltip ((,class (:background ,bg-alt :foreground ,fg))))
   `(help-key-binding ((,class (:background ,bg-alt :foreground ,bay :box (:line-width -1 :color ,bg-strong)))))
   `(eldoc-highlight-function-argument ((,class (:foreground ,bridge :weight bold))))

   ;; Dired
   `(dired-directory ((,class (:foreground ,bay :weight bold))))
   `(dired-flagged ((,class (:foreground ,bridge))))
   `(dired-header ((,class (:foreground ,bridge :weight bold))))
   `(dired-ignored ((,class (:foreground ,fg-faint))))
   `(dired-mark ((,class (:foreground ,earth :weight bold))))
   `(dired-marked ((,class (:background ,bg-alt :foreground ,bridge :weight bold))))
   `(dired-perm-write ((,class (:foreground ,fg-muted))))
   `(dired-symlink ((,class (:foreground ,cyan :weight bold))))
   `(dired-warning ((,class (:foreground ,warning :weight bold))))

   ;; Org and markdown
   `(org-level-1 ((,class (:foreground ,bridge :height 1.18 :weight bold))))
   `(org-level-2 ((,class (:foreground ,bay :height 1.12 :weight bold))))
   `(org-level-3 ((,class (:foreground ,cypress :height 1.08 :weight bold))))
   `(org-level-4 ((,class (:foreground ,earth :weight bold))))
   `(org-level-5 ((,class (:foreground ,rust-shadow :weight bold))))
   `(org-level-6 ((,class (:foreground ,cliff :weight bold))))
   `(org-block ((,class (:background ,bg-soft :foreground ,fg :extend t))))
   `(org-block-begin-line ((,class (:background ,bg-alt :foreground ,fg-faint :extend t))))
   `(org-block-end-line ((,class (:background ,bg-alt :foreground ,fg-faint :extend t))))
   `(org-code ((,class (:foreground ,rust-shadow))))
   `(org-date ((,class (:foreground ,bay :underline t))))
   `(org-done ((,class (:foreground ,cypress :weight bold))))
   `(org-document-title ((,class (:foreground ,bridge :height 1.25 :weight bold))))
   `(org-link ((,class (:foreground ,bay :underline t))))
   `(org-quote ((,class (:background ,bg-soft :foreground ,fg-muted :slant italic :extend t))))
   `(org-special-keyword ((,class (:foreground ,fg-faint))))
   `(org-todo ((,class (:foreground ,bridge :weight bold))))
   `(org-verbatim ((,class (:foreground ,earth))))
   `(markdown-header-face-1 ((,class (:foreground ,bridge :height 1.18 :weight bold))))
   `(markdown-header-face-2 ((,class (:foreground ,bay :height 1.12 :weight bold))))
   `(markdown-header-face-3 ((,class (:foreground ,cypress :height 1.08 :weight bold))))
   `(markdown-code-face ((,class (:background ,bg-soft :foreground ,rust-shadow))))
   `(markdown-blockquote-face ((,class (:foreground ,fg-muted :slant italic))))
   `(markdown-link-face ((,class (:foreground ,bay :underline t))))

   ;; Diff, vc, and Magit
   `(diff-added ((,class (:background "#e2ebd0" :foreground ,cypress :extend t))))
   `(diff-removed ((,class (:background "#f0d8cf" :foreground ,bridge :extend t))))
   `(diff-changed ((,class (:background "#eadfbe" :foreground ,earth :extend t))))
   `(diff-refine-added ((,class (:background "#cfddb7" :foreground ,cypress :weight bold))))
   `(diff-refine-removed ((,class (:background "#e5c1b6" :foreground ,bridge :weight bold))))
   `(diff-header ((,class (:background ,bg-alt :foreground ,fg))))
   `(diff-file-header ((,class (:background ,bg-strong :foreground ,fg :weight bold))))
   `(vc-conflict-state ((,class (:foreground ,bridge :weight bold))))
   `(vc-edited-state ((,class (:foreground ,earth))))
   `(vc-up-to-date-state ((,class (:foreground ,cypress))))
   `(magit-section-heading ((,class (:foreground ,bridge :weight bold))))
   `(magit-branch-current ((,class (:foreground ,bay :box t :weight bold))))
   `(magit-branch-local ((,class (:foreground ,bay))))
   `(magit-branch-remote ((,class (:foreground ,cypress))))
   `(magit-hash ((,class (:foreground ,fg-faint))))
   `(magit-diff-added ((,class (:background "#e2ebd0" :foreground ,cypress :extend t))))
   `(magit-diff-added-highlight ((,class (:background "#d8e5c2" :foreground ,cypress :extend t))))
   `(magit-diff-removed ((,class (:background "#f0d8cf" :foreground ,bridge :extend t))))
   `(magit-diff-removed-highlight ((,class (:background "#e9cbbf" :foreground ,bridge :extend t))))
   `(magit-diff-context ((,class (:foreground ,fg-muted :extend t))))
   `(magit-diff-context-highlight ((,class (:background ,bg-soft :foreground ,fg :extend t))))
   `(magit-diff-file-heading ((,class (:foreground ,fg :weight bold))))
   `(magit-diff-file-heading-highlight ((,class (:background ,bg-soft :weight bold))))
   `(magit-diff-hunk-heading ((,class (:background ,bg-alt :foreground ,fg-muted :extend t))))
   `(magit-diff-hunk-heading-highlight ((,class (:background ,bg-strong :foreground ,fg :extend t))))

   ;; Completion frameworks
   `(company-tooltip ((,class (:background ,bg-alt :foreground ,fg))))
   `(company-tooltip-selection ((,class (:background ,bay-light :foreground ,fg))))
   `(company-tooltip-common ((,class (:foreground ,bay :weight bold))))
   `(company-tooltip-annotation ((,class (:foreground ,fg-muted))))
   `(company-scrollbar-bg ((,class (:background ,bg-strong))))
   `(company-scrollbar-fg ((,class (:background ,fg-faint))))
   `(corfu-default ((,class (:background ,bg-alt :foreground ,fg))))
   `(corfu-current ((,class (:background ,bay-light :foreground ,fg))))
   `(vertico-current ((,class (:background ,bay-light :foreground ,fg))))
   `(orderless-match-face-0 ((,class (:foreground ,bay :weight bold))))
   `(orderless-match-face-1 ((,class (:foreground ,bridge :weight bold))))
   `(orderless-match-face-2 ((,class (:foreground ,cypress :weight bold))))
   `(orderless-match-face-3 ((,class (:foreground ,earth :weight bold))))
   `(ivy-current-match ((,class (:background ,bay-light :foreground ,fg :weight bold))))
   `(ivy-minibuffer-match-face-1 ((,class (:foreground ,fg))))
   `(ivy-minibuffer-match-face-2 ((,class (:foreground ,bay :weight bold))))
   `(ivy-minibuffer-match-face-3 ((,class (:foreground ,bridge :weight bold))))
   `(ivy-minibuffer-match-face-4 ((,class (:foreground ,cypress :weight bold))))
   `(which-key-key-face ((,class (:foreground ,bay :weight bold))))
   `(which-key-command-description-face ((,class (:foreground ,fg))))
   `(which-key-group-description-face ((,class (:foreground ,bridge))))
   `(which-key-separator-face ((,class (:foreground ,fg-faint))))

   ;; Whitespace and terminals
   `(whitespace-space ((,class (:background ,bg :foreground ,bg-strong))))
   `(whitespace-tab ((,class (:background ,bg-soft :foreground ,bg-strong))))
   `(whitespace-trailing ((,class (:background ,bridge-light :foreground ,bg))))
   `(term-color-black ((,class (:foreground ,fg :background ,fg))))
   `(term-color-red ((,class (:foreground ,bridge :background ,bridge))))
   `(term-color-green ((,class (:foreground ,cypress :background ,cypress))))
   `(term-color-yellow ((,class (:foreground ,earth :background ,earth))))
   `(term-color-blue ((,class (:foreground ,bay :background ,bay))))
   `(term-color-magenta ((,class (:foreground ,rust-shadow :background ,rust-shadow))))
   `(term-color-cyan ((,class (:foreground ,cyan :background ,cyan))))
   `(term-color-white ((,class (:foreground ,bg :background ,bg)))))

  (custom-theme-set-variables
   'golden-gate-light
   `(ansi-color-names-vector [,fg ,bridge ,cypress ,earth ,bay ,rust-shadow ,cyan ,bg])
   `(fci-rule-color ,bg-strong)))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-directory load-file-name)))

(provide-theme 'golden-gate-light)

;;; golden-gate-light-theme.el ends here
