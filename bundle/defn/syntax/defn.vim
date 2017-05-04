runtime! syntax/sh.vim

unlet b:current_syntax
syntax include @Markdown syntax/markdown.vim
syntax region markdownComment matchgroup=shQuickComment start=/^# / end=/$/ contains=@Markdown

let b:current_syntax='defn'
