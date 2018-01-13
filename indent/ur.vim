if exists("b:did_indent")
  finish
end

let b:did_indent = 1

setlocal expandtab
setlocal nosmartindent
setlocal nolisp
setlocal shiftwidth=2

"setlocal indentkeys=0=style
setlocal indentexpr=GetUrIndent()

" Copied from indent/ocaml.vim
function! s:FindPair(pstart, pmid, pend)
 call search(a:pend, 'bW')
 return indent(searchpair(a:pstart, a:pmid, a:pend, 'bWn', 'synIDattr(synID(line("."), col("."), 0), "name") =~? "string\\|comment"'))
endfunction

function! GetUrIndent()
  let last_non_blank_line = prevnonblank(v:lnum)

  " Don't indent at the beginning of a file
  if last_non_blank_line == 0
    return 0
  endif

  let ind = indent(last_non_blank_line)
  let prev_line = getline(last_non_blank_line)

  " Indent if the last line was a pattern
  if prev_line =~ '^\s*|.*=>\s*$'
    return ind + shiftwidth()
  elseif prev_line =~ '^\s*\(val\|fun\|and\|type\|view\|task\|datatype\|structure\|signature\)\>.*=\s*$'
    return ind + shiftwidth()
  elseif prev_line =~ '^\s*\(ffi\|table\|val\|structure\|con\|cookie\)\>.*:\s*$'
    return ind + shiftwidth()
  endif

  "let cur_line = getline(v:lnum)

  return ind
endfunction
