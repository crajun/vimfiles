" Name:         hub
" Description:  Inspired by GitHub light colorscheme circa 2021.
" Author:       Craig MacEachern (craigm@fastmail.com)
" Webpage:      https://github.com/craigmac/hub
" License: Vim License (see `:help license`)
" Last Change: 2021-04-03

hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "hub"

hi Normal guibg=#ffffff guifg=#24292e gui=NONE
hi NonText guibg=#ececec guifg=#959595 gui=NONE
hi LineNr guibg=#ececec guifg=#959595 gui=NONE
hi FoldColumn guibg=#ececec guifg=#80808 gui=NONE
hi Folded guibg=#ececec guifg=#80808 gui=NONE
hi MatchParen guibg=#cdcdfd guifg=#000000 gui=NONE
hi Comment guibg=NONE guifg=#6a737d gui=NONE
hi Constant guibg=NONE guifg=#177f80 gui=NONE
hi Identifier guibg=NONE guifg=#0086b3 gui=NONE
hi Ignore guibg=NONE guifg=#808080 gui=NONE
hi PreProc guibg=NONE guifg=#a0a0a0 gui=NONE
hi Special guibg=NONE guifg=#159828 gui=NONE
hi Statement guibg=NONE guifg=#000000 gui=NONE
hi String guibg=NONE guifg=#d81745 gui=NONE 
hi Todo guibg=#990000 guifg=#ffffff gui=NONE
hi Type guibg=NONE guifg=#445588 gui=NONE
hi Pmenu guibg=#808080 guifg=#ffffff gui=NONE
hi PmenuSbar guibg=#000000 guifg=#444444 gui=NONE 
hi PmenuSel guibg=#cdcdfd guifg=#000000 gui=NONE
hi PmenuThumb guibg=#aaaaaa guifg=#aaaaaa gui=NONE
hi ErrorMsg guibg=#f8f8ff guifg=#ff1100 gui=undercurl
hi WarningMsg guibg=NONE guifg=#ef5939 gui=NONE
hi Cursor guibg=#444454 guifg=#044289 gui=NONE
hi CursorColumn guibg=#d8d8dd guifg=NONE gui=NONE
hi CursorLine guibg=#d8d8dd guifg=NONE gui=NONE
hi StatusLine guibg=#bbbbbb guifg=#404040 gui=NONE
hi StatusLineNC guibg=#d4d4d4 guifg=#404040 gui=italic
hi Visual guibg=#3465a3 guifg=#8fafd7 gui=reverse
hi VisualNOS guibg=#204a87 guifg=#ffffff gui=underline
hi VertSplit guibg=#bbbbbb guifg=#bbbbbb gui=NONE
hi Function guibg=NONE guifg=#990000 gui=NONE
hi SpecialKey guibg=NONE guifg=#177f80 gui=italic
hi Title guibg=NONE guifg=#ef5939 gui=NONE
hi DiffAdd guibg=#ddffdd guifg=#003300 gui=NONE
hi DiffChange guibg=#ececec guifg=NONE gui=NONE
hi DiffDelete guibg=#ffdddd guifg=#ddcccc gui=NONE
hi DiffText guibg=#ddddff guifg=#000033 gui=NONE
hi Search guibg=#ffff8c guifg=#000000 gui=NONE
hi SpellBad guibg=NONE guifg=NONE gui=undercurl guisp=#fcaf3e
hi SpellCap guibg=NONE guifg=NONE gui=undercurl guisp=#73d216
hi SpellLocal guibg=NONE guifg=NONE gui=undercurl guisp=#fcaf3e
hi SpellRare guibg=NONE guifg=NONE gui=undercurl guisp=#729fcf
hi ColorColumn guibg=#e4e4e4 guifg=NONE gui=NONE

"TODO: 
"hi Conceal ctermbg=NONE ctermfg=250 cterm=NONE guibg=NONE guifg=#bcbcbc gui=NONE
"hi SignColumn ctermbg=234 ctermfg=242 cterm=NONE guibg=#1c1c1c guifg=#6c6c6c gui=NONE
"hi Error ctermbg=NONE ctermfg=131 cterm=reverse guibg=NONE guifg=#af5f5f gui=reverse
"hi Underlined ctermbg=NONE ctermfg=66 cterm=underline guibg=NONE guifg=#5f8787 gui=underline
"hi ModeMsg ctermbg=108 ctermfg=235 cterm=NONE guibg=#87af87 guifg=#262626 gui=NONE
"hi MoreMsg ctermbg=NONE ctermfg=66 cterm=NONE guibg=NONE guifg=#5f8787 gui=NONE
"hi Question ctermbg=NONE ctermfg=108 cterm=NONE guibg=NONE guifg=#87af87 gui=NONE
"hi TabLine ctermbg=238 ctermfg=101 cterm=NONE guibg=#444444 guifg=#87875f gui=NONE
"hi TabLineFill ctermbg=238 ctermfg=238 cterm=NONE guibg=#444444 guifg=#444444 gui=NONE
"hi TabLineSel ctermbg=101 ctermfg=235 cterm=NONE guibg=#87875f guifg=#262626 gui=NONE
"hi ToolbarLine ctermbg=234 ctermfg=NONE cterm=NONE guibg=#1c1c1c guifg=NONE gui=NONE
"hi ToolbarButton ctermbg=240 ctermfg=250 cterm=NONE guibg=#585858 guifg=#bcbcbc gui=NONE
"hi CursorLineNr ctermbg=236 ctermfg=73 cterm=NONE guibg=#303030 guifg=#5fafaf gui=NONE
"hi helpLeadBlank ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
"hi helpNormal ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
"hi StatusLineTerm ctermbg=101 ctermfg=235 cterm=NONE guibg=#87875f guifg=#262626 gui=NONE
"hi StatusLineTermNC ctermbg=238 ctermfg=101 cterm=NONE guibg=#444444 guifg=#87875f gui=NONE
"hi WildMenu ctermbg=110 ctermfg=235 cterm=NONE guibg=#8fafd7 guifg=#262626 gui=NONE
"hi IncSearch ctermbg=131 ctermfg=235 cterm=NONE guibg=#af5f5f guifg=#262626 gui=NONE
"hi EndOfBuffer ctermbg=NONE ctermfg=240 cterm=NONE guibg=NONE guifg=#585858 gui=NONE
"hi Directory ctermbg=NONE ctermfg=73 cterm=NONE guibg=NONE guifg=#5fafaf gui=NONE
"hi debugPC ctermbg=67 ctermfg=NONE cterm=NONE guibg=#5f87af guifg=NONE gui=NONE
"hi debugBreakpoint ctermbg=131 ctermfg=NONE cterm=NONE guibg=#af5f5f guifg=NONE gui=NONE

hi link Terminal Normal
hi link Number Constant
hi link CursorIM Cursor
hi link Boolean Constant
hi link Character Constant
hi link Conditional Statement
hi link Debug Special
hi link Define PreProc
hi link Delimiter Special
hi link Exception Statement
hi link Float Number
hi link HelpCommand Statement
hi link HelpExample Statement
hi link Include PreProc
hi link Keyword Statement
hi link Label Statement
hi link Macro PreProc
hi link Number Constant
hi link Operator Statement
hi link PreCondit PreProc
hi link Repeat Statement
hi link SpecialChar Special
hi link SpecialComment Special
hi link StorageClass Type
hi link Structure Type
hi link Tag Special
hi link Terminal Normal
hi link Typedef Type
hi link htmlTagName Statement
hi link htmlEndTag htmlTagName
hi link htmlLink Function
hi link htmlSpecialTagName htmlTagName
hi link htmlTag htmlTagName
hi link htmlBold Normal
hi link htmlItalic Normal
hi link htmlArg htmlTagName
hi link xmlTag Statement
hi link xmlTagName Statement
hi link xmlEndTag Statement
hi link markdownItalic Preproc
hi link asciidocQuotedEmphasized Preproc
hi link diffBDiffer WarningMsg
hi link diffCommon WarningMsg
hi link diffDiffer WarningMsg
hi link diffIdentical WarningMsg
hi link diffIsA WarningMsg
hi link diffNoEOL WarningMsg
hi link diffOnly WarningMsg
hi link diffRemoved WarningMsg
hi link diffAdded String
hi link QuickFixLine Search

let g:terminal_ansi_colors = [
        \ '#1c1c1c',
        \ '#af5f5f',
        \ '#5f875f',
        \ '#87875f',
        \ '#5f87af',
        \ '#5f5f87',
        \ '#5f8787',
        \ '#6c6c6c',
        \ '#444444',
        \ '#ff8700',
        \ '#87af87',
        \ '#ffffaf',
        \ '#8fafd7',
        \ '#8787af',
        \ '#5fafaf',
        \ '#ffffff',
        \ ]

" vim: fdm=indent fdl=0 nowrap
