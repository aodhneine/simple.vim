" Better (more minimal) syntax file for Python.
" Made by Aodhanit Etain <aodhneine(at)protonmail(dot)ch>.

if exists("b:current_syntax")
  finish
endif

syn keyword pyKeyword def pass for in class yield return break else if elif not continue and or is with as assert
syn match pyStringEscapeSequence /\v\\('|n|r|x[0-9a-f]+)/
syn match pyStringInterpolation "\v\{[^\}]+\}"
syn region pyTripleString start=/"""/ end=/"""/
syn region pyString start=/"/ end=/"/ skip=/\v\\"/ contains=pyStringEscapeSequence,pyStringInterpolation
syn region pySingleString start=/'/ end=/'/ skip=/\v\\'/ contains=pyStringEscapeSequence,pyStringInterpolation
syn match pyComment "\v\#.*$" keepend

syn sync fromstart

hi def link pyKeyword Statement
hi def link pyTripleString String
hi def link pyString String
hi def link pySingleString String
hi def link pyStringEscapeSequence Special
hi def link pyStringInterpolation Special
hi def link pyComment Comment

let b:current_syntax = "python"

" vim:sw=2:ts=2
