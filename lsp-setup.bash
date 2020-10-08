#!/bin/bash

# Install LSP servers globally (requires Nodejs 10+ and python3)
npm install --global typescript
# binary is called 'typescript-language-server'
npm install --global typescript-language-server
# binary is called 'bash-language-server'
npm install --global bash-language-server
# binary is called 'css-languageserver'
npm install --global vscode-css-languageserver-bin
# binary is called 'html-languageserver'
npm install --global vscode-html-languageserver-bin
# binary is called 'docker-langserver'
npm install --global dockerfile-language-server-nodejs
# binary is called 'vim-language-server'
npm install --global vim-language-server
# binary is called 'pyls'
pip3 install --user 'python-language-server[all]'


