" Vim syntax file for ProLang

" Reset syntax rules
syntax clear

setlocal commentstring=//%s

" Define keywords
syntax keyword prolangKeyword var fn if elif else loop ret export C import continue
syntax keyword prolangType char int void string VecString bool ulong
syntax keyword prolangFunction main print println strcmp eprint eprintln

" Define functions TODO
"syntax match prolangFunctionDef /fn\s\w\+\b/

" Match variables
syntax match prolangVariable /\b[A-Za-z_]\w*\s*=\s*/

" Match strings
syntax region prolangString start=/"/ end=/"/

" Match characters
syntax region prolangChar start=/'/ end=/'/

" Define special characters
syntax match prolangOperator /==\|!=\|>=\|<=\|>\|<\|++\|--\|%/
syntax match prolangAssignment /=/
syntax match prolangSeparator /,/
syntax match prolangPointer /\*/

" Define comments
syntax match prolangComment /\/\/.*$/

" Define braces and brackets
syntax match prolangBraces /{}/ contained
syntax match prolangBrackets /\[\]\|()\|{}/

" Define numbers
syntax match prolangNumber /\<\d\+\>/

" Define bool values
syntax keyword prolangBool true false

" Set the colors for the syntax groups
hi def link prolangKeyword Keyword
hi def link prolangType Type
hi def link prolangFunction Function
"hi def link prolangFunctionDef Function
hi def link prolangVariable Identifier
hi def link prolangString String
hi def link prolangChar Character
hi def link prolangOperator Operator
hi def link prolangAssignment Operator
hi def link prolangSeparator Delimiter
hi def link prolangPointer Type
hi def link prolangBraces Delimiter
hi def link prolangBrackets Delimiter
hi def link prolangNumber Number
hi def link prolangBool Number
hi def link prolangComment Comment

" Default highlighting
hi def link prolangDefault Normal
