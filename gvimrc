" GUI specific settings for Vim 8+
"
" Last Modified: 2019-04-08 11:19
" Turn off alt-{key} being used for menus allowing bindings on alt in GUI
" If you want to bind Alt-key for a menu use e.g., :simalt f<CR> for Alt-f
" F10 will still be menu key, unless bound by user.
set winaltkeys=no

" BUG: this is not working with gvim currently. I think because it only works
" for X11 and I'm using Wayland atm with Mint, so I'll have to test by switchin
" to x session once.
set guifont=JetBrainsMono-Regular:h14
set guifontwide=JetBrainsMono-Regular:h14

if has('mac')
  " mac osx-only option for fonts
  set antialias
endif

if has('win64') || has('win32')
  if has('gui_running')
    " got this value from manually going to Edit->Font and then
    " doing :set<CR> and copying the value gvim added for Hack font
    set guifont=JetBrainsMono-Regular:h13:cANSI:qDRAFT
  endif

endif
" Turn off blinking cursor in all modes
set guicursor=a:blinkon0

" 8.1 default = egmrLtT on windows, else aegimrLtT
" In Windows, don't run popup cmd.exe for external commands,
" use :term instead. See :h gui-shell-win32
set guioptions+=!
" Use console dialogs instead of native ones for simple choices
set guioptions+=c
" Use Vim icon in top-left corner
set guioptions+=i
" Toolbar off
set guioptions-=t
set guioptions-=T
" Right side scrollbar off
set guioptions-=r
" Left side scrollbar off
set guioptions-=L
" Bottom scrollbar off
set guioptions-=b

" Make Windows/*nix mouse behaviour consistent
behave xterm
