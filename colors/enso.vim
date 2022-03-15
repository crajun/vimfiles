" Name: enso.vim
" Version: 1.0
" Maintainer: github.com/craigmac
" License: Same as Vim.
"
" A non-colorscheme using the xterm-256 color palette to maximize chances of
" portability and consistent look. Does not use the first 0-15 colorcodes
" because they tend to be slightly different between terminal emulators, and not
" the same as the ANSI 16 found here:
" https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
"
" The rest of the 256 colors (16-255) are typically much closer, as in the case
" of Terminal.app and iTerm on macOS.
"
" Anti-Features:
" * Uses 'notermguicolors' so works on non true-colour capable terminals, like
" Terminal.app on macOS.
" * No broken/sort-of-working-but-not syntax highlighting. Who needs Treesitter?
"
" Mis-features:
" * Because it is 'notermguicolors' compatible, we do not define
" 'g:terminal_ansi_colors', so it will also just use 16 ANSI colors of the
" underlying terminal. 
" * Mostly 4 shades, but some colour for Diff* groups and things like Search,
" Spelling/Errors, places where I think it should stick out more.
" * Simplified as much as possible - no functions, dynamically generated
" content/values, etc. 
" * No support or toggleable support for plugins, do this in your .vimrc file.
" * Only support the preferred highlighting groups
"
" Inspired by non-colorschemes like off.vim.
" TODO: pictures of iTerm2 with white colorscheme next to Terminal.app white
" colorscheme, etc. like Apprentice
" TODO: Philosophy section:
"   * why no colours? Q & A: Quick, when you open a Go file in Vim, what colour
"   are the keywords? The comments? How about the constants?
"   * Benefits of syntax highlighting:
"     * Colours look nice
"     * Colours can tell us when something isn't syntactically correct (biggest)
"   We can still get this second benefit with minimal highlighting by using just
"   enough variance. Examples of how this works in pictures.
"   Design:
"   * For UI elements: ANSI 8/#808080 background with 015/#ffffff foreground when selected/active,
"   otherwise it is 007/#c0c0c0 background with 000/#000000 black text.
"   Examples:

set background=light

highlight clear

let colors_name = 'enso'

" let s:enso_white = 231
" let s:enso_black = 232
" let s:enso_darkgray = 244
" let s:enso_lightgray = 255
" let s:enso_red = 196
" let s:enso_green = 114
" let s:enso_yellow = 226
" let s:enso_blue = 146
" let s:enso_magenta = 176
" let s:enso_cyan = 87

" original cc color. cursorlinenr, cursorline, statuslineNC, Pmenu
highlight! ColorColumn ctermbg=255 ctermfg=NONE cterm=NONE
highlight! Conceal ctermbg=231 ctermfg=232 cterm=NONE
" TODO: Cursor doesn't seem to work?
highlight! Cursor ctermbg=176 ctermfg=NONE cterm=NONE
highlight! CursorColumn ctermbg=255 ctermfg=255 cterm=NONE
highlight! CursorLine ctermbg=255 cterm=NONE
highlight! CursorLineNr ctermbg=255 ctermfg=232 cterm=NONE
highlight! Directory ctermbg=231 ctermfg=232 cterm=NONE
highlight! DiffAdd ctermbg=114 ctermfg=232 cterm=NONE
highlight! DiffDelete ctermbg=196 ctermfg=232 cterm=NONE
highlight! DiffChange ctermbg=146 ctermfg=232 cterm=NONE
highlight! DiffText ctermbg=176 ctermfg=232 cterm=NONE
highlight! link EndOfBuffer NonText
highlight! ErrorMsg ctermbg=231 ctermfg=196 cterm=NONE
highlight! VertSplit ctermbg=232 ctermfg=232 cterm=NONE
highlight! Folded ctermbg=255 ctermfg=232 cterm=NONE
highlight! link FoldColumn LineNr
highlight! link SignColumn LineNr
highlight! IncSearch ctermbg=176 ctermfg=232 cterm=NONE
highlight! LineNr ctermbg=231 ctermfg=232 cterm=NONE
highlight! link LineNrAbove LineNr
highlight! link LineNrBelow LineNr
highlight! link CursorLineNr CursorLine
highlight! link CursorLineSign CursorLine
highlight! link CursorLineFold CursorLine
highlight! MatchParen ctermbg=232 ctermfg=231 cterm=NONE
highlight! ModeMsg ctermbg=231 ctermfg=232 cterm=NONE
highlight! MoreMsg ctermbg=231 ctermfg=232 cterm=NONE
highlight! NonText ctermbg=231 ctermfg=255 cterm=NONE
highlight! Normal ctermbg=231 ctermfg=232 cterm=NONE
highlight! Pmenu ctermbg=255 ctermfg=232 cterm=NONE
highlight! PmenuSel ctermbg=232 ctermfg=231 cterm=NONE
highlight! PmenuSbar ctermbg=255 ctermfg=232 cterm=NONE
highlight! PmenuThumb ctermbg=232 ctermfg=231 cterm=NONE
highlight! Question ctermbg=231 ctermfg=232 cterm=NONE
highlight! link QuickFixLine Search
highlight! Search ctermbg=226 ctermfg=232 cterm=NONE
highlight! SpecialKey ctermbg=231 ctermfg=255 cterm=NONE
highlight! SpellBad cterm=underline ctermbg=231 ctermfg=196 cterm=NONE
highlight! link SpellCap SpellBad
highlight! link SpellLocal SpellBad
highlight! link SpellRare SpellBad
highlight! StatusLine ctermbg=232 ctermfg=231 cterm=NONE
highlight! StatusLineNC ctermbg=255 ctermfg=232 cterm=NONE
highlight! link StatusLineTerm StatusLine
highlight! link StatusLineTermNC StatusLineNC
highlight! Tabline ctermbg=255 ctermfg=232 cterm=NONE
highlight! TabLineFill ctermbg=231 ctermfg=231 cterm=NONE
highlight! TabLineSel ctermbg=232 ctermfg=231 cterm=NONE
highlight! Title ctermbg=231 ctermfg=232 cterm=NONE
highlight! Visual ctermbg=244 ctermfg=231 cterm=NONE
highlight! VisualNOS ctermbg=244 ctermfg=231 cterm=NONE
highlight! WarningMsg ctermbg=231 ctermfg=196 cterm=NONE
highlight! link WildMenu PmenuSel

" Preferred groups
highlight! Comment ctermbg=231 ctermfg=244 cterm=NONE
highlight! Constant ctermbg=231 ctermfg=244 cterm=NONE
highlight! Identifier ctermbg=231 ctermfg=232 cterm=NONE
highlight! Statement ctermbg=231 ctermfg=232 cterm=NONE
highlight! PreProc ctermbg=231 ctermfg=232 cterm=NONE
highlight! Type ctermbg=231 ctermfg=232 cterm=NONE
highlight! Special ctermbg=231 ctermfg=255 cterm=NONE 
highlight! Underlined cterm=underline ctermfg=231 ctermbg=232 cterm=NONE
highlight! Ignore ctermbg=231 ctermfg=232 cterm=NONE
highlight! Error ctermbg=196 ctermfg=231 cterm=NONE
highlight! Todo ctermbg=255 ctermfg=232 cterm=NONE
highlight! SignColumn ctermbg=231 cterm=NONE


" &ft = 'help'
highlight! helpHyperTextEntry cterm=underline
highlight! helpHyperTextJump cterm=underline
highlight! link helpSpecial Normal

" &ft = 'vim'
highlight! link vimMapMod Normal
highlight! link vimMapModKey Normal
highlight! link vimNotation Normal
highlight! link vimBracket Normal
