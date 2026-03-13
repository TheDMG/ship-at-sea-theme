;;; ship-at-sea-theme.el --- A high contrast dark theme with warm earthy tones -*- lexical-binding: t -*-

;; Copyright (C) 2026 TheDMG

;; Author: Marzouk <marzouk.dev@gmail.com>
;; URL: https://github.com/TheDMG/ship-at-sea-theme
;; Version: 0.1.0
;; Package-Requires: ((emacs "27.1"))
;; Keywords: ship-at-sea, sailor-at-sea, emacs-theme, faces, theme, dark, nautical
;; SPDX-License-Identifier: MIT

;; This file is not part of GNU Emacs.

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

;;; Commentary:

;; To use this theme, add it to your load-path and call:
;;   (load-theme 'ship-at-sea t)

;;; Credits:

;; Thanks to Rikkarth for the original "Sailor at Sea" VS Code theme,
;; which this theme is based on:
;; https://github.com/rikkarth/ship-at-sea

;;; Code:

(deftheme ship-at-sea
  "A high contrast dark theme with warm earthy tones.")

(let* ((class '((class color) (min-colors 89)))

       ;; --- Backgrounds ---
       (bg           "#070707")   ; editor.background       — near black
       (bg-medium    "#231e1a")   ; editor.lineHighlight    — dark wood
       (bg-light     "#261b12")   ; list.activeSelection    — warmer wood
       (bg-alt       "#1a1512")   ; subtle variant

       ;; --- Foreground ---
       (fg           "#eaeaea")   ; editor.foreground       — off-white
       (fg-dim       "#bfafa4")   ; sideBar.foreground      — weathered rope
       (fg-faint     "#6e625a")   ; lineNumber.foreground   — old timber

       ;; --- Accent ---
       (orange       "#f07e1b")   ; focusBorder / lantern glow
       (orange-light "#f5b56a")   ; gitDecoration.untracked — pale flame
       (orange-muted "#f28e43")   ; button.hover            — ember

       ;; --- Syntax tokens (from tokenColors) ---
       (red          "#ea6962")   ; Keyword
       (rust-orange  "#e78a4e")   ; Storage / Operator
       (yellow       "#d8a657")   ; String
       (green        "#a9b665")   ; Function / String escape
       (aqua         "#89b482")   ; Preproc / Modules / Label
       (teal         "#7daea3")   ; Type / Class
       (purple       "#d3869b")   ; Number / Boolean / Constant
       (warm-white   "#d4be98")   ; Identifier / Property / Delimiter
       (grey         "#928374")   ; Comment / punctuation grey
       (error-red    "#e64528")   ; gitDecoration.deleted / debug

       ;; --- UI ---
       (border       "#231e1a")
       (selection    "#604127")   ; editor.selectionBackground
       (cursor       "#eaeaea")

       ;; --- Diff (faithful to VS Code gitDecoration colors) ---
       (diff-add-bg  "#1a1711")
       (diff-add-fg  orange-light) ; gitDecoration.addedResourceForeground
       (diff-chg-bg  "#261b12")
       (diff-chg-fg  orange)
       (diff-rem-bg  "#241110")
       (diff-rem-fg  error-red))

  (custom-theme-set-faces
   'ship-at-sea

   ;; --- Base typography ---
   `(bold                        ((,class (:weight bold))))
   `(bold-italic                 ((,class (:weight bold :slant italic))))
   `(italic                      ((,class (:slant italic))))
   `(underline                   ((,class (:underline t))))

   ;; --- Core ---
   `(default                     ((,class (:background ,bg :foreground ,fg))))
   `(cursor                      ((,class (:background ,cursor))))
   `(fringe                      ((,class (:background ,bg :foreground ,fg-faint))))
   `(region                      ((,class (:background ,selection :extend t))))
   `(highlight                   ((,class (:background ,bg-medium))))
   `(secondary-selection         ((,class (:background ,bg-alt :extend t))))
   `(trailing-whitespace         ((,class (:background ,error-red))))
   `(vertical-border             ((,class (:foreground ,border))))
   `(window-divider              ((,class (:foreground ,border))))
   `(window-divider-first-pixel  ((,class (:foreground ,border))))
   `(window-divider-last-pixel   ((,class (:foreground ,border))))
   `(line-number                 ((,class (:background ,bg :foreground ,fg-faint))))
   `(line-number-current-line    ((,class (:background ,bg-medium :foreground ,orange :bold t))))
   `(hl-line                     ((,class (:background ,bg-medium))))
   `(minibuffer-prompt           ((,class (:foreground ,orange :weight semi-bold))))
   `(link                        ((,class (:foreground ,teal :underline t))))
   `(link-visited                ((,class (:foreground ,purple :underline t))))
   `(shadow                      ((,class (:foreground ,grey))))
   `(success                     ((,class (:foreground ,orange-light :weight semi-bold))))
   `(warning                     ((,class (:foreground ,orange :weight semi-bold))))
   `(error                       ((,class (:foreground ,red :weight semi-bold))))
   `(escape-glyph                ((,class (:foreground ,green))))
   `(homoglyph                   ((,class (:foreground ,error-red))))
   `(widget-field                ((,class (:background ,bg-medium :foreground ,fg
                                           :box (:line-width -1 :color ,border)))))

   ;; --- Header & mode line ---
   `(header-line                 ((,class (:background ,bg-medium :foreground ,fg
                                           :box (:line-width -1 :color ,border)))))
   `(mode-line                   ((,class (:background ,bg-medium :foreground ,fg
                                           :box (:line-width -1 :color ,border)))))
   `(mode-line-active            ((,class (:inherit mode-line))))
   `(mode-line-inactive          ((,class (:background ,bg :foreground ,fg-dim
                                           :box (:line-width -1 :color ,border)))))
   `(mode-line-buffer-id         ((,class (:foreground ,orange :weight semi-bold))))
   `(mode-line-emphasis          ((,class (:foreground ,orange-light :weight semi-bold))))
   `(mode-line-highlight         ((,class (:foreground ,yellow))))

   ;; --- Tab bar ---
   `(tab-bar                     ((,class (:background ,bg :foreground ,fg-dim))))
   `(tab-bar-tab                 ((,class (:background ,bg-medium :foreground ,fg :weight semi-bold))))
   `(tab-bar-tab-inactive        ((,class (:background ,bg :foreground ,fg-dim))))

   ;; --- Font Lock (syntax highlighting) ---
   `(font-lock-comment-face           ((,class (:foreground ,grey :slant italic))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,grey :slant italic))))
   `(font-lock-doc-face               ((,class (:foreground ,yellow))))
   `(font-lock-string-face            ((,class (:foreground ,yellow))))
   `(font-lock-keyword-face           ((,class (:foreground ,red :weight semi-bold))))
   `(font-lock-builtin-face           ((,class (:foreground ,green))))
   `(font-lock-function-name-face     ((,class (:foreground ,green))))
   `(font-lock-variable-name-face     ((,class (:foreground ,warm-white))))
   `(font-lock-type-face              ((,class (:foreground ,teal))))
   `(font-lock-constant-face          ((,class (:foreground ,purple))))
   `(font-lock-preprocessor-face      ((,class (:foreground ,aqua))))
   `(font-lock-negation-char-face     ((,class (:foreground ,rust-orange))))
   `(font-lock-warning-face           ((,class (:foreground ,error-red :weight bold))))
   `(font-lock-operator-face          ((,class (:foreground ,rust-orange))))
   `(font-lock-delimiter-face         ((,class (:foreground ,warm-white))))
   `(font-lock-number-face            ((,class (:foreground ,purple))))
   `(font-lock-escape-face            ((,class (:foreground ,green))))
   `(font-lock-regexp-grouping-backslash ((,class (:foreground ,yellow :weight bold))))
   `(font-lock-regexp-grouping-construct ((,class (:foreground ,rust-orange :weight bold))))

   ;; --- Search ---
   `(isearch                     ((,class (:background ,orange :foreground ,bg :weight bold))))
   `(isearch-fail                ((,class (:background ,error-red :foreground ,bg))))
   `(lazy-highlight              ((,class (:background ,orange-muted :foreground ,bg))))
   `(match                       ((,class (:background ,orange :foreground ,bg :weight bold))))
   `(query-replace               ((,class (:inherit isearch))))

   ;; --- Completions ---
   `(completions-common-part          ((,class (:foreground ,orange :weight semi-bold))))
   `(completions-first-difference     ((,class (:foreground ,purple :weight semi-bold))))
   `(icomplete-first-match            ((,class (:foreground ,green :weight semi-bold))))

   ;; --- Parentheses ---
   `(show-paren-match            ((,class (:background ,teal :foreground ,bg :weight bold))))
   `(show-paren-mismatch         ((,class (:background ,error-red :foreground ,fg :weight bold))))

   ;; --- Whitespace ---
   `(whitespace-tab              ((,class (:background ,bg :foreground ,border))))
   `(whitespace-space            ((,class (:background ,bg :foreground ,border))))
   `(whitespace-trailing         ((,class (:background ,error-red :foreground ,bg))))
   `(whitespace-newline          ((,class (:foreground ,border))))

   ;; --- Diffs ---
   `(diff-added                  ((,class (:background ,diff-add-bg :foreground ,diff-add-fg))))
   `(diff-removed                ((,class (:background ,diff-rem-bg :foreground ,diff-rem-fg))))
   `(diff-changed                ((,class (:background ,diff-chg-bg :foreground ,diff-chg-fg))))
   `(diff-refine-added           ((,class (:background ,bg-medium :foreground ,diff-add-fg :weight bold))))
   `(diff-refine-removed         ((,class (:background ,bg-medium :foreground ,diff-rem-fg :weight bold))))
   `(diff-refine-changed         ((,class (:background ,bg-medium :foreground ,diff-chg-fg :weight bold))))
   `(diff-header                 ((,class (:background ,bg-medium :foreground ,fg-dim))))
   `(diff-file-header            ((,class (:background ,bg-medium :foreground ,fg :weight bold))))
   `(diff-hunk-header            ((,class (:background ,bg-alt :foreground ,rust-orange))))

   ;; --- diff-hl (gutter indicators) ---
   `(diff-hl-change              ((,class (:foreground ,orange :background ,bg-alt))))
   `(diff-hl-insert              ((,class (:foreground ,orange-light :background ,bg-alt))))
   `(diff-hl-delete              ((,class (:foreground ,error-red :background ,bg-alt))))

   ;; --- Compilation ---
   `(compilation-info            ((,class (:foreground ,green))))
   `(compilation-warning         ((,class (:foreground ,orange))))
   `(compilation-error           ((,class (:foreground ,error-red))))
   `(compilation-mode-line-exit  ((,class (:foreground ,green :weight bold))))
   `(compilation-mode-line-fail  ((,class (:foreground ,error-red :weight bold))))

   ;; --- Flymake / Flycheck ---
   `(flymake-error               ((,class (:underline (:style wave :color ,error-red)))))
   `(flymake-warning             ((,class (:underline (:style wave :color ,orange)))))
   `(flymake-note                ((,class (:underline (:style wave :color ,teal)))))
   `(flycheck-error              ((,class (:underline (:style wave :color ,error-red)))))
   `(flycheck-warning            ((,class (:underline (:style wave :color ,orange)))))
   `(flycheck-info               ((,class (:underline (:style wave :color ,teal)))))

   ;; --- Eldoc ---
   `(eldoc-highlight-function-argument ((,class (:foreground ,yellow :weight bold))))

   ;; --- Company ---
   `(company-tooltip             ((,class (:background ,bg-medium :foreground ,fg))))
   `(company-tooltip-selection   ((,class (:background ,bg-light :foreground ,fg))))
   `(company-tooltip-common      ((,class (:foreground ,orange :weight bold))))
   `(company-tooltip-annotation  ((,class (:foreground ,fg-dim))))
   `(company-scrollbar-bg        ((,class (:background ,bg-medium))))
   `(company-scrollbar-fg        ((,class (:background ,fg-faint))))

   ;; --- Vertico / Corfu / Orderless ---
   `(vertico-current             ((,class (:background ,bg-light :foreground ,fg))))
   `(corfu-current               ((,class (:background ,bg-light :foreground ,fg))))
   `(orderless-match-face-0      ((,class (:foreground ,red :weight bold))))
   `(orderless-match-face-1      ((,class (:foreground ,rust-orange :weight bold))))
   `(orderless-match-face-2      ((,class (:foreground ,teal :weight bold))))
   `(orderless-match-face-3      ((,class (:foreground ,purple :weight bold))))

   ;; --- Org Mode ---
   `(org-document-title          ((,class (:foreground ,fg :weight bold :height 1.2))))
   `(org-document-info-keyword   ((,class (:foreground ,grey))))
   `(org-level-1                 ((,class (:foreground ,red         :weight bold :height 1.1))))
   `(org-level-2                 ((,class (:foreground ,rust-orange :weight semi-bold))))
   `(org-level-3                 ((,class (:foreground ,yellow      :weight semi-bold))))
   `(org-level-4                 ((,class (:foreground ,green       :weight semi-bold))))
   `(org-level-5                 ((,class (:foreground ,teal))))
   `(org-level-6                 ((,class (:foreground ,purple))))
   `(org-block                   ((,class (:background ,bg-medium :extend t))))
   `(org-block-begin-line        ((,class (:background ,bg-alt :foreground ,grey :extend t))))
   `(org-block-end-line          ((,class (:inherit org-block-begin-line))))
   `(org-code                    ((,class (:foreground ,yellow))))
   `(org-verbatim                ((,class (:foreground ,orange-light))))
   `(org-date                    ((,class (:foreground ,teal :underline t))))
   `(org-tag                     ((,class (:foreground ,grey))))
   `(org-special-keyword         ((,class (:foreground ,grey))))
   `(org-todo                    ((,class (:foreground ,error-red :weight bold))))
   `(org-done                    ((,class (:foreground ,green :weight semi-bold))))
   `(org-headline-done           ((,class (:foreground ,fg-faint))))
   `(org-link                    ((,class (:foreground ,purple :underline t))))

   ;; --- Markdown ---
   `(markdown-header-face-1      ((,class (:foreground ,red         :weight bold))))
   `(markdown-header-face-2      ((,class (:foreground ,rust-orange :weight bold))))
   `(markdown-header-face-3      ((,class (:foreground ,yellow      :weight bold))))
   `(markdown-header-face-4      ((,class (:foreground ,green       :weight semi-bold))))
   `(markdown-header-face-5      ((,class (:foreground ,teal        :weight semi-bold))))
   `(markdown-header-face-6      ((,class (:foreground ,purple      :weight semi-bold))))
   `(markdown-code-face          ((,class (:background ,bg-medium :foreground ,green))))
   `(markdown-inline-code-face   ((,class (:foreground ,yellow))))
   `(markdown-link-face          ((,class (:foreground ,teal :underline t))))
   `(markdown-list-face          ((,class (:foreground ,red))))
   `(markdown-quote-face         ((,class (:foreground ,grey :slant italic))))

   ;; --- Magit ---
   `(magit-section-heading       ((,class (:foreground ,orange :weight bold))))
   `(magit-section-highlight     ((,class (:background ,bg-medium))))
   `(magit-diff-added            ((,class (:background ,diff-add-bg :foreground ,diff-add-fg))))
   `(magit-diff-removed          ((,class (:background ,diff-rem-bg :foreground ,diff-rem-fg))))
   `(magit-diff-added-highlight  ((,class (:background ,bg-medium :foreground ,diff-add-fg))))
   `(magit-diff-removed-highlight ((,class (:background ,bg-medium :foreground ,diff-rem-fg))))
   `(magit-diff-context-highlight ((,class (:background ,bg-medium :foreground ,fg-dim))))
   `(magit-branch-local          ((,class (:foreground ,teal :weight bold))))
   `(magit-branch-remote         ((,class (:foreground ,green :weight bold))))
   `(magit-hash                  ((,class (:foreground ,fg-faint))))
   `(magit-log-author            ((,class (:foreground ,yellow))))
   `(magit-filename              ((,class (:foreground ,warm-white))))

   ;; --- vc-state / dired ---
   `(vc-state-base               ((,class (:foreground ,fg-dim))))

   ;; --- Terminal: ansi-color (vterm, eshell, compilation) ---
   `(ansi-color-black            ((,class (:background ,bg-medium  :foreground ,bg-medium))))
   `(ansi-color-red              ((,class (:background ,error-red  :foreground ,error-red))))
   `(ansi-color-green            ((,class (:background ,orange-light :foreground ,orange-light))))
   `(ansi-color-yellow           ((,class (:background ,orange     :foreground ,orange))))
   `(ansi-color-blue             ((,class (:background "#d0a46c"   :foreground "#d0a46c"))))
   `(ansi-color-magenta          ((,class (:background ,orange-muted :foreground ,orange-muted))))
   `(ansi-color-cyan             ((,class (:background ,fg-dim     :foreground ,fg-dim))))
   `(ansi-color-white            ((,class (:background ,fg         :foreground ,fg))))
   ;; --- Terminal: term-color (ansi-term) ---
   `(term-color-black            ((,class (:foreground ,bg-medium  :background ,bg-medium))))
   `(term-color-red              ((,class (:foreground ,error-red  :background ,error-red))))
   `(term-color-green            ((,class (:foreground ,orange-light :background ,orange-light))))
   `(term-color-yellow           ((,class (:foreground ,orange     :background ,orange))))
   `(term-color-blue             ((,class (:foreground "#d0a46c"   :background "#d0a46c"))))
   `(term-color-magenta          ((,class (:foreground ,orange-muted :background ,orange-muted))))
   `(term-color-cyan             ((,class (:foreground ,fg-dim     :background ,fg-dim))))
   `(term-color-white            ((,class (:foreground ,fg         :background ,fg)))))

  (custom-theme-set-variables
   'ship-at-sea
   `(ansi-color-names-vector [,bg-medium ,error-red ,orange-light ,orange
                                         "#d0a46c" ,orange-muted ,fg-dim ,fg])))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'ship-at-sea)
;;; ship-at-sea-theme.el ends here
