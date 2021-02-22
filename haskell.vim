" Better (more minimal) syntax file for Haskell.
" Made by Aodhanit Etain <aodhneine(at)protonmail(dot)ch>.

" Comment when you want to disable this file.
"finish

if exists("b:current_syntax")
  finish
endif

syn keyword haskellKeyword type newtype data instance where let in class deriving module import qualified as if else then hiding case of
syn match haskellStringEscapeSequence /\v\\("|n|r|x[0-9a-f]+)/
syn region haskellString start=/"/ end=/"/ skip=/\v\\"/ contains=haskellStringEscapeSequence
syn region haskellComment start="{-" end="-}" extend
syn match haskellLineComment "\v--.*$"

hi def link haskellKeyword Statement
hi def link haskellStringEscapeSequence Special
hi def link haskellString String
hi def link haskellComment Comment
hi def link haskellLineComment Comment

let b:current_syntax = "haskell"

" vim:sw=2:ts=2
