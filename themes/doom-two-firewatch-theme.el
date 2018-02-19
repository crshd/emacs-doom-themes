;;; doom-two-firewatch-theme.el --- inspired by Atom Two-Firewatch Dark
(require 'doom-themes)

;;
(defgroup doom-two-firewatch-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-two-firewatch-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-two-firewatch-theme
  :type 'boolean)

(defcustom doom-two-firewatch-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-two-firewatch-theme
  :type 'boolean)

(defcustom doom-two-firewatch-comment-bg doom-two-firewatch-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-two-firewatch-theme
  :type 'boolean)

(defcustom doom-two-firewatch-padded-modeline nil
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-two-firewatch-theme
  :type '(or integer boolean))

;;
(def-doom-theme doom-two-firewatch
  "A dark theme inspired by Vim Two-Firewatch Dark"

  ;; name        default   256       16
  ((bg         '("#282c34" nil       nil            ))
   (bg-alt     '("#21242b" nil       nil            ))
   (base0      '("#2c323c" "black"   "black"        ))
   (base1      '("#3e4452" "#1e1e1e" "brightblack"  ))
   (base2      '("#5c6370" "#2e2e2e" "brightblack"  ))
   (base3      '("#636d83" "#262626" "brightblack"  ))
   (base4      '("#d1cec7" "#3f3f3f" "brightblack"  ))
   (base5      '("#e5ddcb" "#525252" "brightblack"  ))
   (base6      '("#eae1d2" "#6b6b6b" "brightblack"  ))
   (base7      '("#f3efe7" "#979797" "brightblack"  ))
   (base8      '("#faf8f5" "#dfdfdf" "white"        ))
   (fg         '("#abb2bf" "#bfbfbf" "brightwhite"  ))
   (fg-alt     '("#56b6c2" "#2d2d2d" "white"        ))

   (uno_1      '("#d6e9ff"))
   (uno_2      '("#abb2bf"))
   (uno_3      '("#6e88a6"))
   (uno_4      '("#55606d"))

   (duo_1      '("#c8ae9d"))
   (duo_2      '("#e06c75"))
   (duo_3      '("#dd672c"))

   (red        '("#e88388" "#ff6655" "red"))
   (yellow     '("#ebca8d" "#ffbb66" "yellow"))
   (green      '("#a7cc8c" "#99bb66" "green"))

   (grey       base4)
   (orange     '("#da8548" "#dd8844" "brightred"    ))
   (teal       '("#4db5bd" "#44b9b1" "brightgreen"  )) ; unused
   (blue       '("#51afef" "#51afef" "brightblue"   ))
   (dark-blue  '("#2257A0" "#2257A0" "blue"         ))
   (magenta    '("#c678dd" "#c678dd" "magenta"      ))
   (violet     '("#a9a1e1" "#a9a1e1" "brightmagenta"))
   (cyan       '("#46D9FF" "#46D9FF" "brightcyan"   ))
   (dark-cyan  '("#5699AF" "#5699AF" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      fg-alt)
   (vertical-bar   (doom-darken base1 0.1))
   (selection      fg-alt)
   (builtin        duo_2)
   (comments       uno_4)
   (doc-comments   (doom-lighten (if doom-two-firewatch-brighter-comments dark-cyan base5) 0.25))
   (constants      duo_2)
   (functions      uno_2)
   (keywords       uno_1)
   (methods        uno_2)
   (operators      fg-alt)
   (type           duo_1)
   (strings        duo_1)
   (variables      duo_3)
   (numbers        duo_2)
   (region         `(,(doom-lighten (car bg-alt) 0.15) ,@(doom-lighten (cdr base0) 0.35)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    yellow)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "base01" "base01"))
   (-modeline-bright doom-two-firewatch-brighter-modeline)
   (-modeline-pad
    (when doom-two-firewatch-padded-modeline
      (if (integerp doom-two-firewatch-padded-modeline) doom-two-firewatch-padded-modeline 4)))

   (modeline-fg     nil)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        (doom-darken uno_1 0.475)
      `(,(doom-darken (car bg-alt) 0.15) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        (doom-darken uno_1 0.45)
      `(,(doom-darken (car bg-alt) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive   (doom-darken bg-alt 0.1))
   (modeline-bg-inactive-l `(,(car bg-alt) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)

   (font-lock-comment-face
    :foreground comments
    :background (if doom-two-firewatch-comment-bg (doom-lighten bg 0.05)))
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
   (css-proprietary-property :foreground uno_4)
   (css-property             :foreground uno_3)
   (css-selector             :foreground uno_1)

   ;; markdown-mode
   (markdown-markup-face :foreground uno_3)
   (markdown-header-face :inherit 'bold :foreground duo_3)
   (markdown-code-face :background (doom-lighten base3 0.05))

   ;; org-mode
   (org-hide :foreground hidden)
   (solaire-org-hide-face :foreground hidden))


  ;; --- extra variables ---------------------
  ;; ()
  )

;;; doom-two-firewatch-theme.el ends here
