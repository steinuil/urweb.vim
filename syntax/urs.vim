if exists("b:current_syntax")
  finish
end


runtime syntax/ur.vim
unlet b:current_syntax


let b:current_syntax = "urs"
