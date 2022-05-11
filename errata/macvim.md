# Macvim specific notes

## has('macvim\_gui') vs has('gui\_running')

Curiously, `mvim` the CLI app will report true for `:echo has('macvim_gui')`,
so guarding settings/options in a rc behind `if has('macvim_gui')` is not
foolproof enough.

If for example you run Terminal.app emulator and have termguicolors set like
this:

```vim
if has('macvim_gui')
    set termguicolors
endif
```

You're going to get wrong colours, because Terminal.app only supports 256
colours. This is because even when using CLI `mvim` it reports as having
`macvim_gui`. I guess this is because you can call `:gui` from the CLI to start
a gui session, so that kind of makes sense for that case.

To really guard macvim.app (GUI) settings, what you should do is:

```vim
if has('macvim_gui') && has('gui_running')
    " stuff here only runs when actual GUI is running, not mvim CLI from
    " /usr/local/bin/mvim which is just a symlink to something like:
    " /usr/local/Cellar/macvim/8.2-172_1/bin/mvim (if you've install macvim via
    " Homebrew with `brew install macvim`
endif
```

## Setting up /bin/zsh :terminal in MacVim.app GUI

There are a few unexpected things about using `:terminal` under the MacVim GUI.

### Call /bin/zsh correctly

macOS does things differently with the zsh startup files. Long story short:
we want to call zsh as a login shell, just like Terminal.app does on every new
window instance. The only time Terminal.app doesn't is when you call `zsh`
directly yourself from inside a running zsh session. The history of this, and
the same odd behaviour applies to `bash` as well, is unknown.

To emulate starting a fresh Terminal.app with `:terminal` we need to setup the
`shell` option correctly. 

In your `gvimrc`, for example, `$HOME/.vim/gvimrc` put:

```vim
if has('macvim_gui') && has('gui_running')
  set shell=/bin/zsh\ -l
endif
```

This will ensure that we mimic the default behaviour of Terminal.app.

### Set $TERM\_PROGRAM

MacVim.app `:terminal` does not set the `$TERM_PROGRAM` env variable.
Terminal.app sets this to `Apple\_Terminal` by default.  This is important
because there's a check in `/etc/zshrc` to source `/etc/zshrc_$TERM_PROGRAM`
and if `$TERM_PROGRAM` is empty, then it never gets sourced.

Why source this file? Well, you can open the file itself and see: it provides
features like OSC 7 escape sequence that emits when a directory is changed. If
this file is sourced, when you change a directory inside a `:terminal` instance
the `:pwd` of non-terminal buffers in the windows change.

Enable this behaviour with `set autoshelldir` in your vimrc/gvimrc.

To make sure `$TERM_PROGRAM` is set correctly, add the following to your
gvimrc:

```vim
if has('macvim_gui') && has('gui_running')
  set shell=/bin/zsh\ -l
  set $TERM_PROGRAM=Apple_Terminal
endif
```

## $PATH issues when passing :terminal commands directly

When you call `:terminal <command>`, your `$PATH` won't be setup yet, so take
this under consideration when calling something like `:terminal python
myfile.py`. To debug, try running a `which <command>`, for example, `which
ruby` as `:terminal which ruby` and you'll get result of `/usr/bin/ruby`, the
macOS ruby, regardless if your `$PATH` is defined in your zshrc to _NOT_ have
that be the first `ruby` binary found. This is because the zshrc files not been
sourced yet by the time the `which ruby` is ran in the `:terminal which ruby`
command.

To see the difference, run `:terminal` and then run `which ruby` manually in
the new terminal buffer. Mine now reports `/usr/local/opt/ruby@3.0/bin/ruby`.

