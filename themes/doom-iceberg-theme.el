;;; doom-iceberg-theme.el --- inspired by Atom One Dark
(require 'doom-themes)

;;
(defgroup doom-iceberg-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-iceberg-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-iceberg-theme
  :type 'boolean)

(defcustom doom-iceberg-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-iceberg-theme
  :type 'boolean)

(defcustom doom-iceberg-comment-bg doom-iceberg-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-iceberg-theme
  :type 'boolean)

(defcustom doom-iceberg-padded-modeline nil
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-iceberg-theme
  :type '(or integer boolean))

;;
(def-doom-theme doom-iceberg
  "A dark theme inspired by Atom One Dark"

  ;; name        default   256       16
  ((bg         '("#161821" nil       nil            ))
   (bg-alt     '("#272c42" nil       nil            ))
   (base0      '("#0d122b" "black"   "black"        ))
   (base1      '("#222532" "#1e1e1e" "brightblack"  ))
   (base2      '("#272c42" "#2e2e2e" "brightblack"  ))
   (base3      '("#333644" "#262626" "brightblack"  ))
   (base4      '("#3d425b" "#3f3f3f" "brightblack"  ))
   (base5      '("#5d6279" "#525252" "brightblack"  ))
   (base6      '("#6f78a1" "#6b6b6b" "brightblack"  ))
   (base7      '("#7c83a1" "#979797" "brightblack"  ))
   (base8      '("#8289ad" "#dfdfdf" "white"        ))
   (fg         '("#c6c8d1" "#bfbfbf" "brightwhite"  ))
   (fg-alt     '("#6b7089" "#2d2d2d" "white"        ))

   (grey       base4)
   (red        '("#e27878" "#ff6655" "red"          ))
   (orange     '("#aa6e6e" "#dd8844" "brightred"    ))
   (green      '("#b4be82" "#99bb66" "green"        ))
   (teal       '("#898f6d" "#44b9b1" "brightgreen"  ))
   (yellow     '("#e4aa80" "#ECBE7B" "yellow"       ))
   (blue       '("#84a0c6" "#51afef" "brightblue"   ))
   (dark-blue  '("#6f7f95" "#2257A0" "blue"         ))
   (magenta    '("#a093c7" "#c678dd" "magenta"      ))
   (violet     '("#7f7895" "#a9a1e1" "brightmagenta"))
   (cyan       '("#89b8c2" "#46D9FF" "brightcyan"   ))
   (dark-cyan  '("#718b92" "#5699AF" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (doom-darken base1 0.1))
   (selection      dark-blue)
   (builtin        magenta)
   (comments       (if doom-iceberg-brighter-comments dark-cyan base5))
   (doc-comments   (doom-lighten (if doom-iceberg-brighter-comments dark-cyan base5) 0.25))
   (constants      violet)
   (functions      magenta)
   (keywords       blue)
   (methods        cyan)
   (operators      blue)
   (type           yellow)
   (strings        green)
   (variables      (doom-lighten magenta 0.4))
   (numbers        orange)
   (region         `(,(doom-lighten (car bg-alt) 0.15) ,@(doom-lighten (cdr base0) 0.35)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-iceberg-brighter-modeline)
   (-modeline-pad
    (when doom-iceberg-padded-modeline
      (if (integerp doom-iceberg-padded-modeline) doom-iceberg-padded-modeline 4)))

   (modeline-fg     nil)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        (doom-darken blue 0.475)
      `(,(doom-darken (car bg-alt) 0.15) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        (doom-darken blue 0.45)
      `(,(doom-darken (car bg-alt) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive   (doom-darken bg-alt 0.1))
   (modeline-bg-inactive-l `(,(car bg-alt) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   (evil-goggles-default-face :inherit 'region :background (doom-blend region bg 0.5))

   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)

   (font-lock-comment-face
    :foreground comments
    :background (if doom-iceberg-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)

   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   (markdown-code-face :background (doom-lighten base3 0.05))

   ;; org-mode
   (org-hide :foreground hidden)
   (solaire-org-hide-face :foreground hidden))


  ;; --- extra variables ---------------------
  ;; ()
  )

;;; doom-iceberg-theme.el ends here
