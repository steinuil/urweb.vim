if exists("b:current_syntax")
  finish
end

syn case match
syn iskeyword 48-57,A-Z,a-z


syntax keyword urpDirective alwaysInline
syntax keyword urpDirective coreInline database exe file ffi
syntax keyword urpDirective include jsFile jsFunc library link
syntax keyword urpDirective linker minHeap monoInline neverInline
syntax keyword urpDirective noXsrfProtection path prefix
syntax keyword urpDirective safeGet script sigfile sql timeFormat
syntax keyword urpDirective timeout

syn keyword urpDirective debug html5 noMangleSql profile xhtml

syn keyword urpDirective nextgroup=urpFunction skipwhite benignEffectiful clientOnly clientToServer effectful onError serverOnly 
syn match urpFunction contained display /\<\([A-Z][A-Za-z0-9_']*\.\)\+[a-z_][A-Za-z0-9_']*\>/

syn keyword urpDirective allow deny nextgroup=urpRule skipwhite
syn keyword urpRule contained url mime requestHeader responseHeader env meta

syn keyword urpDirective limit nextgroup=urpLimClass skipwhite
syn keyword urpLimClass contained cleanup clients database deltas globals headers heap inputs messages page script subinputs time transactionals

syn keyword urpDirective rewrite nextgroup=urpRewriteKind skipwhite
syn keyword urpRewriteKind contained all url table sequence view relation cookie style


hi link urpDirective   Keyword
hi link urpRule        Type
hi link urpLimClass    Type
hi link urpRewriteKind Type
hi link urpFunction    Function


let b:current_syntax = "urp"
