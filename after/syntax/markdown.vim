" https://habamax.github.io/2019/03/07/vim-markdown-frontmatter.html
" Fixes tpope/vim-markdown ftplugin (shipped with vim in runtime files)
" creating a fold on YAML frontmatter '---' when in a markdown file, like
" jekyll liquid files, which are .md but contain YAML frontmatter.
"
" This will use YAML syntax in region between --- and ---, which is fine for
" me because I don't use that style headings in Markdown, and it only will
" appear at the top of my jekyll files. May cause issues in OTHER people's .md
" files, but the ---/=== heading variant is not nearly as popular as the hash
" ### style headings.
"
unlet b:current_syntax
syntax include @Yaml syntax/yaml.vim
syntax region yamlFrontmatter start=/\%^---$/ end=/^---$/ keepend contains=@Yaml

