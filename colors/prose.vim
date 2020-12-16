" prose.vim -- Vim color scheme.
" Author:      C.D. MacEachern (craigm@fastmail.com)
" Webpage:     https://github.com/craigmac/prose.vim
" Description: Minimalist light colourscheme with a philosophy.
" Last Change: 2020-12-16

hi clear

if exists("syntax_on")
  syntax reset
endif

set background=light
let colors_name = "prose"

highlight Normal ctermbg=15 ctermfg=8 cterm=NONE
highlight NonText ctermbg=15 ctermfg=8 cterm=NONE
highlight Comment ctermbg=15 ctermfg=9 cterm=NONE
highlight Constant ctermbg=15 ctermfg=8 cterm=NONE
highlight Error ctermbg=15 ctermfg=9 cterm=NONE
highlight Identifier ctermbg=15 ctermfg=8 cterm=NONE
highlight Ignore ctermbg=15 ctermfg=8 cterm=NONE
highlight PreProc ctermbg=15 ctermfg=8 cterm=NONE
highlight Special ctermbg=15 ctermfg=8 cterm=NONE
highlight Statement ctermbg=15 ctermfg=8 cterm=bold
highlight String ctermbg=15 ctermfg=8 cterm=NONE
highlight Todo ctermbg=15 ctermfg=9 cterm=NONE
highlight Type ctermbg=15 ctermfg=8 cterm=NONE
highlight Underlined ctermbg=15 ctermfg=8 cterm=NONE
highlight StatusLine ctermbg=8 ctermfg=15 cterm=NONE
highlight StatusLineNC ctermbg=7 ctermfg=8 cterm=NONE
highlight VertSplit ctermbg=15 ctermfg=8 cterm=NONE
highlight TabLine ctermbg=7 ctermfg=8 cterm=NONE
highlight TabLineFill ctermbg=15 ctermfg=15 cterm=NONE
highlight TabLineSel ctermbg=8 ctermfg=15 cterm=NONE
highlight Title ctermbg=15 ctermfg=8 cterm=NONE
highlight CursorLine ctermbg=15 ctermfg=8 cterm=NONE
highlight LineNr ctermbg=15 ctermfg=8 cterm=NONE
highlight CursorLineNr ctermbg=15 ctermfg=8 cterm=NONE
highlight helpLeadBlank ctermbg=15 ctermfg=8 cterm=NONE
highlight helpNormal ctermbg=15 ctermfg=8 cterm=NONE
highlight Visual ctermbg=7 ctermfg=15 cterm=NONE
highlight VisualNOS ctermbg=7 ctermfg=15 cterm=NONE
highlight Pmenu ctermbg=8 ctermfg=15 cterm=NONE
highlight PmenuSbar ctermbg=15 ctermfg=8 cterm=NONE
highlight PmenuSel ctermbg=15 ctermfg=8 cterm=NONE
highlight PmenuThumb ctermbg=15 ctermfg=8 cterm=NONE
highlight FoldColumn ctermbg=15 ctermfg=8 cterm=NONE
highlight Folded ctermbg=15 ctermfg=8 cterm=NONE
highlight WildMenu ctermbg=15 ctermfg=8 cterm=NONE
highlight SpecialKey ctermbg=15 ctermfg=8 cterm=NONE
highlight DiffAdd ctermbg=15 ctermfg=8 cterm=NONE
highlight DiffChange ctermbg=15 ctermfg=8 cterm=NONE
highlight DiffDelete ctermbg=15 ctermfg=8 cterm=NONE
highlight DiffText ctermbg=15 ctermfg=8 cterm=NONE
highlight IncSearch ctermbg=7 ctermfg=0 cterm=NONE
highlight Search ctermbg=7 ctermfg=0 cterm=NONE
highlight Directory ctermbg=15 ctermfg=8 cterm=NONE
highlight MatchParen ctermbg=15 ctermfg=8 cterm=NONE
highlight SpellBad ctermbg=NONE ctermfg=9 cterm=underline
highlight SpellCap ctermbg=15 ctermfg=8 cterm=NONE
highlight SpellLocal ctermbg=15 ctermfg=8 cterm=NONE
highlight SpellRare ctermbg=15 ctermfg=8 cterm=NONE
highlight ColorColumn ctermbg=7 ctermfg=8 cterm=NONE
highlight SignColumn ctermbg=15 ctermfg=8 cterm=NONE
highlight ErrorMsg ctermbg=7 ctermfg=0 cterm=NONE
highlight ModeMsg ctermbg=15 ctermfg=8 cterm=NONE
highlight MoreMsg ctermbg=15 ctermfg=8 cterm=NONE
highlight Question ctermbg=15 ctermfg=8 cterm=NONE
highlight Cursor ctermbg=15 ctermfg=8 cterm=NONE
highlight CursorColumn ctermbg=15 ctermfg=8 cterm=NONE
highlight QuickFixLine ctermbg=15 ctermfg=8 cterm=NONE
highlight Conceal ctermbg=15 ctermfg=8 cterm=NONE
highlight ToolbarLine ctermbg=15 ctermfg=8 cterm=NONE
highlight ToolbarButton ctermbg=15 ctermfg=8 cterm=NONE
highlight debugPC ctermbg=15 ctermfg=8 cterm=NONE
highlight debugBreakpoint ctermbg=15 ctermfg=8 cterm=NONE

highlight link EndOfBuffer NonText
highlight link Number Constant
highlight link StatusLineTerm StatusLine
highlight link StatusLineTermNC StatusLineNC
highlight link WarningMsg Error
highlight link CursorIM Cursor
highlight link Terminal Normal

let g:terminal_ansi_colors = [
  \ '#000000',
  \ '#800000',
  \ '#008000',
  \ '#808000',
  \ '#000080',
  \ '#800080',
  \ '#008080',
  \ '#c0c0c0',
  \ '#808080',
  \ '#ff0000',
  \ '#00ff00',
  \ '#ffff00',
  \ '#0000ff',
  \ '#ff00ff',
  \ '#00ffff',
  \ '#ffffff',
\ ]
