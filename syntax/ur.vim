if exists("b:current_syntax")
  finish
end

syn case match
syn iskeyword 48-57,A-Z,a-z,_,'


" Constants
syn match urInt /\<-\=\d\+\>/
syn match urInt /\<-\=0x[0-9A-F]\+\>/
syn match urReal /\<-\=\d\+\.\d*\>/

syn keyword urBool True False

syn match urUnit /(\s*)\|{\s*}/
syn match urEmptyList /\[\s*\]/
syn keyword urWildcard _

syn match urChar /#"[^\\]"\|#"\\[\\"'nrt]"\|#"\d\{3\}"\|#"\\x\x\{2\}"/

syn region urString start=/\m\H\d*\zs'/ skip=/\\\\\|\\'/ end=/'/
syn region urString start=/"/ skip=/\\\\\|\\"/ end=/"/

syn match urEscSeq /\\[\\"'nrt]\|\\\d\{3\}\|\\x\x\{2\}/ contained containedin=urString


" Comments
syn region urComment start="(\*" end="\*)" contains=urComment,urTodo 
syn keyword urTodo contained TODO FIXME XXX


" Identifiers
syn match urLCIdent  /\<[a-z_][A-Za-z0-9_']*\>/ display contained
syn match urFunction /\<[a-z_][A-Za-z0-9_']*\>/ display contained

syn match urUCIdent /\<[A-Z][A-Za-z0-9_']*\>/

syn match urFieldName /#[A-Z][A-Za-z0-9_']*\>/
syn match urFieldName /#\d\+\>/


" Declarations
syn keyword urDecl fun and ffi          nextgroup=urFunction skipwhite
syn match   urDecl /\<val\(\srec\)\?\>/ nextgroup=urFunction skipwhite
syn keyword urDecl con type datatype policy nextgroup=urType skipwhite
syn keyword urDecl table view sequence cookie style task cookie nextgroup=urLCIdent skipwhite

syn keyword ursDecl class nextgroup=urType skipwhite

" FIXME
syn keyword urKeyword2 map constrain
syn keyword urKeyword2 structure signature functor include
syn keyword urKeyword2 open export

syn region urStruct matchgroup=urModule start=/\<struct\>/ end=/\<end\>/ contains=TOP
syn region urSig    matchgroup=urModule start=/\<sig\>/ end=/\<end\>/ contains=TOP


" Expressions
syn keyword urKeyword fn

syn region  urCase matchgroup=urCond start=/\<case\>/ end=/\<of\>/ contains=TOP
syn region  urIfte matchgroup=urCond start=/\<if\>/ end=/\<else\>/ contains=TOP
syn keyword urCond then contained containedin=urIfte

syn keyword urKeyword in where contained containedin=urLet
syn region  urLet matchgroup=urKeyword start=/\<let\>/ end=/\<end\>/ contains=TOP


syn keyword urError error
syn keyword urDebug debug naughtyDebug


" Types
syn keyword urKind Name Type Unit

syn keyword urBaseType int float char string time blob

syn keyword urType unit bool option list
syn match   urType /\<[a-z_][A-Za-z0-9_']*\>/ display contained


" Infix operators
" =+-\*/%<>\^:&|
syn match urInfix '='
syn match urInfix '<>'
syn match urInfix '+'
syn match urInfix '-'
syn match urInfix '\*'
syn match urInfix '/'
syn match urInfix '%'
syn match urInfix '>'
syn match urInfix '<'
syn match urInfix '>='
syn match urInfix '<='

syn match urInfix '\^'
syn match urInfix '::'

syn match urInfix '&&'
syn match urInfix '||'

syn match urInfix '++'
syn match urInfix '--'
syn match urInfix '---'

syn match urInfix '<<<'
syn match urInfix '>>>'
syn match urInfix '<|'
syn match urInfix '|>'

syn match urInfix '<-'


syn match urInfix ':'
syn match urInfix '::' contained
syn match urInfix '=' contained
syn match urInfix '\M*' contained

syn match urInfix "-->"
syn match urInfix "->"
syn match urInfix "==>"
syn match urInfix "=>"
syn match urInfix ","
syn match urInfix ":::_"
syn match urInfix ":::"
syn match urInfix "::_"
syn match urInfix "\.\.\."
syn match urInfix "\."
syn match urInfix "\$"
syn match urInfix "__"
syn match urInfix "\~"
syn match urInfix "|"
syn match urInfix ";"
syn match urInfix "!"
syn match urInfix "@"


" SQL keywords
syn keyword urSql KEY PRIMARY CONSTRAINT UNIQUE CHECK FOREIGN REFERENCES
syn keyword urSql DELETE UPDATE ACTION NO ACTION RESTRICT CASCADE SET NULL
syn keyword urSql ORDER BY LIMIT OFFSET SELECT DISTINCT FROM WHERE GROUP
syn keyword urSql HAVING UNION INTERSECT EXCEPT RANDOM AS JOIN ON CROSS
syn keyword urSql INNER LEFT RIGHT FULL OUTER TRUE FALSE IS COALESCE COUNT
syn keyword urSql IF THEN ELSE CURRENT_TIMESTAMP NOT AND OR LIKE AVG SUM MIN
syn keyword urSql MAX ASC DESC OVER PARTITION RANK INSERT INTO VALUES UPDATE
syn keyword urSql SET DELETE


" XML highlighting
syn include @xml syntax/xml.vim
unlet b:current_syntax

syn match  urXml '<xml/>'
syn region urXmlFragment matchgroup=urXml start='<xml>' end='<\/xml>' contains=@xml

syn region urXmlComputed matchgroup=urDelim start='{\[\?' end='\]\?}' contains=ALLBUT,urType,urFunction,urLCIdent contained containedin=xmlTag,xmlTagName,xmlAttrib,urXmlFragment



" Syntax links
hi def link urInt       Number
hi def link urReal      Float
hi def link urBool      Boolean
hi def link urUnit      Constant
hi def link urEmptyList Constant
hi def link urWildcard  Constant
hi def link urChar      Character
hi def link urString    String
hi def link urEscSeq    SpecialChar

hi def link urComment   Comment
hi def link urTodo      Todo

hi def link urFunction  Function
hi def link urLCIdent   Identifier

hi def link urFieldName Identifier

hi def link urFunDecl   Statement
hi def link urDecl      Statement
hi def link ursDecl     Statement

hi def link urModule    Structure

hi def link urCond      Conditional
hi def link urKeyword   Keyword

hi def link urError     Exception
hi def link urDebug     Debug

hi def link urKind      StorageClass
hi def link urBaseType  Type
hi def link urType      Typedef

hi def link urOperator  Special
hi def link urInfix     PreProc

hi def link urSql       Statement

hi def link urXml       Delimiter
hi def link urDelim     Delimiter


let b:current_syntax = "ur"
