" Better (more minimal) syntax file for C.
" Made by Aodhanit Etain <aodhneine(at)protonmail(dot)ch>.

if exists("b:current_syntax")
  finish
endif

if !exists("g:c_syntax_keywords")
  let g:c_syntax_keywords = 0
endif

if !exists("g:c_syntax_preprocessor")
  let g:c_syntax_preprocessor = 1
endif

if !exists("g:c_syntax_escape_sequences")
  let g:c_syntax_escape_sequences = 1
endif

if g:c_syntax_keywords
  syn keyword cKeyword if else for while do return typedef sizeof struct enum union const volatile auto register extern continue break case switch
  hi def link cKeyword Statement
endif

if g:c_syntax_escape_sequences
  syn match cStringEscapeSequence /\v\\("|n|r|x[0-9a-f]+)/
  syn region cString start=/"/ end=/"/ skip=/\v\\"/ contains=cStringEscapeSequence
  hi def link cStringEscapeSequence Special
else
  syn region cString start=/"/ end=/"/ skip=/\\"/
endif

if g:c_syntax_preprocessor
  syn match cPreprocessorAngleString "\v\<.*\>" contained
  syn match cPreprocessor "\v^#\s*[a-zA-Z]+.*$" contains=cPreprocessorAngleString,cString,cBlockComment,cLineComment
  hi def link cPreprocessorAngleString String
  hi def link cPreprocessorQuotedString String
  hi def link cPreprocessor PreProc
endif

syn region cComment start="/\*" end="\*/" extend
syn match cLineComment "\v//.*$" keepend

syn sync fromstart

hi def link cComment Comment
hi def link cLineComment Comment
hi def link cString String

let b:current_syntax = "c"

" vim:sw=2:ts=2
