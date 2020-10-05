# Git package management reminders

## Fresh install

```
rm -rf ~/.vim
cd ~/dotfiles
stow *
cd vim/.vim
git submodule init
git submodule update
```

## Install New Package that auto-starts
```
cd ~/.vim/pack/third-party/start
git submodule add https://github.com/ctrlp/ctrlp.vim
```

## Installing a package
Install a package as optional (will require `:packadd! fzf` command to load.

`packadd!` command means it will only load it --no-plugins arg was not
given in Vim's arglist at startup. Always use the '!' and just forget about
it.

```
cd ~/.vim/pack/third-party/opt
git submodule add https://github.com/junegunn/fzf.vim
echo 'packadd! fzf.vim' >> ~/.vimrc/vimrc
```

## Updating packages - (refreshing already installed packages)

```
cd ~/dotfiles/vim/.vim
git submodule update --remote --merge
```

## Removing packages

```
cd ~/dotfiles/vim/.vim
git submodule deinit pack/third-party/opt/fzf
git rm pack/completion/opt/fzf
rm -Rf .git/modules/pack/third-party/opt/fzf
git add -A
git commit -m 
```
