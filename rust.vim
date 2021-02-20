" Better (more minimal) syntax file for Rust.
" Made by Aodhanit Etain <aodhneine(at)protonmail(dot)ch>.

" Comment when you want to disable this file.
"finish

if exists("b:current_syntax")
  finish
endif

if !exists("g:rust_syntax_keywords")
  let g:rust_syntax_keywords = 1
endif

if !exists("g:rust_syntax_escape_sequences")
  let g:rust_syntax_escape_sequences = 1
endif

if g:rust_syntax_keywords
  syn keyword rustKeyword fn unsafe if else for while return struct enum union const extern continue break loop let mut static pub impl use match type box
  hi def link rustKeyword Statement
endif

if g:rust_syntax_escape_sequences
  syn match rustStringEscapeSequence /\v\\("|n|r|x[0-9a-f]+)/
  syn region rustString start=/"/ end=/"/ skip=/\v\\"/ contains=rustStringEscapeSequence
  hi def link rustStringEscapeSequence Special
else
  syn region rustString start=/"/ end=/"/ skip=/\\"/
endif

syn region rustComment start="/\*" end="\*/" extend
syn match rustLineComment "\v//.*$"

hi def link rustComment Comment
hi def link rustLineComment Comment
hi def link rustString String

let b:current_syntax = "rust"

" vim:sw=2:ts=2
