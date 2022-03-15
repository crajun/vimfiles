" Name:         xterm
" Description:  light background xterm-256 palette colorscheme
set background=light

hi clear
let g:colors_name = 'habaurora'

" Background: light
" Color: color00     #262626        235            black
" Color: color08     #626262        241            darkgrey
" Color: color01     #AF0000        124            darkred
" Color: color09     #AF5F00        130            red
" Color: color02     #005F00        22             darkgreen
" Color: color10     #008700        28             darkgreen
" Color: color03     #875F00        94             darkyellow
" Color: color11     #D7D787        186            yellow
" Color: color04     #005FAF        25             darkblue
" Color: color12     #5F87AF        67             blue
" Color: color05     #870087        90             darkmagenta
" Color: color13     #AF5FAF        133            darkmagenta
" Color: color06     #008787        30             blue
" Color: color14     #5F8787        66             darkcyan
" Color: color07     #949494        246            grey
" Color: color15     #E4E4E4        254            white
" Color: colorLine   #DADADA        253            grey
" Color: colorB      #EEEEEE        255            grey
" Color: colorNonT   #B2B2B2        249            grey
" Color: colorC      #D7005F        161            red
" Color: colorlC     #0000FF        21             blue
" Color: colorV      #B3D0E7        66             darkcyan
" Color: bgDiffA     #CFE4CF        151            green
" Color: bgDiffD     #E4CFE4        182            magenta
" Color: bgDiffC     #E7E0CA        187            yellow
" Color: bgDiffT     #BFE4E4        152            cyan
" Color: fgDiff      #000000        16             black

highlight! Normal ctermfg=235 ctermbg=231 cterm=NONE
highlight! Terminal ctermfg=235 ctermbg=254 cterm=NONE
highlight! Statusline ctermfg=254 ctermbg=241 cterm=NONE
highlight! StatuslineTerm ctermfg=254 ctermbg=241 cterm=NONE
highlight! VertSplit ctermfg=246 ctermbg=246 cterm=NONE
highlight! TabLine ctermfg=NONE ctermbg=246 cterm=NONE
highlight! TabLineFill ctermfg=NONE ctermbg=246 cterm=NONE
highlight! TabLineSel ctermfg=NONE ctermbg=NONE cterm=NONE
highlight! ToolbarLine ctermfg=NONE ctermbg=NONE cterm=NONE
highlight! ToolbarButton ctermfg=235 ctermbg=249 cterm=NONE
highlight! QuickFixLine ctermfg=254 ctermbg=67 cterm=NONE
highlight! CursorLineNr ctermfg=161 ctermbg=NONE cterm=NONE
highlight! LineNr ctermfg=249 ctermbg=NONE cterm=NONE
highlight! LineNrAbove ctermfg=249 ctermbg=NONE cterm=NONE
highlight! LineNrBelow ctermfg=249 ctermbg=NONE cterm=NONE
highlight! NonText ctermfg=249 ctermbg=NONE cterm=NONE
highlight! FoldColumn ctermfg=249 ctermbg=NONE cterm=NONE
highlight! EndOfBuffer ctermfg=249 ctermbg=NONE cterm=NONE
highlight! SpecialKey ctermfg=249 ctermbg=NONE cterm=NONE
highlight! Pmenu ctermfg=NONE ctermbg=255 cterm=NONE
highlight! PmenuThumb ctermfg=NONE ctermbg=246 cterm=NONE
highlight! PmenuSbar ctermfg=NONE ctermbg=NONE cterm=NONE
highlight! PmenuSel ctermfg=235 ctermbg=186 cterm=NONE
highlight! SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
highlight! Error ctermfg=124 ctermbg=254 cterm=reverse
highlight! ErrorMsg ctermfg=124 ctermbg=254 cterm=reverse
highlight! ModeMsg ctermfg=235 ctermbg=186 cterm=NONE
highlight! MoreMsg ctermfg=22 ctermbg=NONE cterm=NONE
highlight! Question ctermfg=94 ctermbg=NONE cterm=NONE
highlight! WarningMsg ctermfg=130 ctermbg=NONE cterm=NONE
highlight! Todo ctermfg=186 ctermbg=235 cterm=reverse
highlight! MatchParen ctermfg=254 ctermbg=30 cterm=NONE
highlight! Search ctermfg=254 ctermbg=28 cterm=NONE
highlight! IncSearch ctermfg=254 ctermbg=161 cterm=NONE
highlight! WildMenu ctermfg=235 ctermbg=186 cterm=NONE
highlight! debugPC ctermfg=254 ctermbg=25 cterm=NONE
highlight! debugBreakpoint ctermfg=254 ctermbg=124 cterm=NONE
highlight! Visual ctermfg=254 ctermbg=66 cterm=NONE
highlight! StatuslineNC ctermfg=254 ctermbg=246 cterm=NONE
highlight! VisualNOS ctermfg=254 ctermbg=66 cterm=NONE
highlight! CursorLine ctermfg=NONE ctermbg=253 cterm=NONE
highlight! CursorColumn ctermfg=NONE ctermbg=253 cterm=NONE
highlight! Folded ctermfg=241 ctermbg=255 cterm=NONE
highlight! ColorColumn ctermfg=NONE ctermbg=255 cterm=NONE
highlight! SpellBad ctermfg=124 ctermbg=NONE cterm=underline
highlight! SpellCap ctermfg=25 ctermbg=NONE cterm=underline
highlight! SpellLocal ctermfg=22 ctermbg=NONE cterm=underline
highlight! SpellRare ctermfg=133 ctermbg=NONE cterm=underline
highlight! Comment ctermfg=246 ctermbg=NONE cterm=NONE
highlight! PreProc ctermfg=94 ctermbg=NONE cterm=NONE
highlight! Constant ctermfg=130 ctermbg=NONE cterm=NONE
highlight! String ctermfg=28 ctermbg=NONE cterm=NONE
highlight! Character ctermfg=22 ctermbg=NONE cterm=NONE
highlight! Identifier ctermfg=30 ctermbg=NONE cterm=NONE
highlight! Statement ctermfg=90 ctermbg=NONE cterm=NONE
highlight! Type ctermfg=25 ctermbg=NONE cterm=NONE
highlight! Special ctermfg=66 ctermbg=NONE cterm=NONE
highlight! Underlined ctermfg=67 ctermbg=NONE cterm=underline
highlight! Title ctermfg=94 ctermbg=NONE cterm=NONE
highlight! Directory ctermfg=25 ctermbg=NONE cterm=NONE
highlight! Conceal ctermfg=241 ctermbg=NONE cterm=NONE
highlight! Ignore ctermfg=NONE ctermbg=NONE cterm=NONE
highlight! Debug ctermfg=66 ctermbg=NONE cterm=NONE
highlight! DiffAdd ctermfg=16 ctermbg=151 cterm=NONE
highlight! DiffChange ctermfg=16 ctermbg=187 cterm=NONE
highlight! DiffText ctermfg=16 ctermbg=152 cterm=NONE
highlight! DiffDelete ctermfg=16 ctermbg=182 cterm=NONE

" vim: et ts=2 sw=2
