" Name:       monokai-pro.vim
" Version:    0.1.0
" Maintainer: Ernest1338 <https://github.com/Ernest1338>
" License:    The MIT License (MIT)
"
" A minimal colour scheme for Vim and Neovim
hi clear

let g:colors_name = 'monokai-pro'
set background=dark
let s:background = &background

let s:p = #{
      \  bg : '#2d2a2e',
      \  bg_float: '#282628',
      \  bg_dim : '#373438',
      \  bg_alt : '#434043',
      \  fg :     '#fcfcfa',
      \  fg_dim : '#989898',
      \  fg_alt : '#75715E',
      \  red :    '#ff6188',
      \  orange : '#fc9867',
      \  yellow : '#ffd866',
      \  green :  '#a9dc76',
      \  cyan :   '#78dce8',
      \  blue :   '#5c95e6',
      \  purple : '#ab9df2',
      \  teal :   '#47b38f',
      \  none:    'NONE',
      \}

let g:terminal_color_0 = s:p.bg
let g:terminal_color_1 = s:p.red
let g:terminal_color_2 = s:p.green
let g:terminal_color_3 = s:p.yellow
let g:terminal_color_4 = s:p.blue
let g:terminal_color_5 = s:p.purple
let g:terminal_color_6 = s:p.cyan
let g:terminal_color_7 = s:p.fg
let g:terminal_color_8 = s:p.fg_dim
let g:terminal_color_9 = s:p.red
let g:terminal_color_10 = s:p.green
let g:terminal_color_11 = s:p.yellow
let g:terminal_color_12 = s:p.blue
let g:terminal_color_13 = s:p.purple
let g:terminal_color_14 = s:p.cyan
let g:terminal_color_15 = s:p.fg

for key in keys(s:p)
  let {'s:fg_' . key} = ' guifg='.s:p[key] .' gui=NONE '
  let {'s:bg_' . key} = ' guibg='.s:p[key]
endfor

exe 'hi Normal' . s:fg_fg . s:bg_bg
"signcolumn
exe 'hi SignColumn' . s:bg_bg
"buffer
hi LineNr guifg=#525052
hi! link  IndentLine LineNr
exe 'hi EndOfBuffer'. s:fg_bg . s:bg_none
exe 'hi Search'. s:fg_yellow . 'gui=reverse'
exe 'hi Visual' s:bg_bg_alt
exe 'hi ColorColumn'. s:bg_bg_alt
exe 'hi Whitespace'. s:fg_bg_alt
"window
exe 'hi VertSplit' . s:fg_bg_alt
exe 'hi Title' . s:fg_orange .'gui=bold'
"cursorline
exe 'hi Cursorline' .s:bg_bg_dim
exe 'hi CursorLineNr' . s:fg_fg
"pmenu
exe 'hi Pmenu ' . s:bg_bg_dim .s:fg_fg
exe 'hi PmenuSel ' . s:bg_bg_alt . s:fg_teal
exe 'hi PmenuSbar guifg=#586e75'
exe 'hi PmenuKind ' . s:bg_bg_dim . s:fg_yellow
hi! link PmenuKindSel PmenuSel
hi! link PmenuExtra Pmenu
hi! link PmenuExtraSel PmenuSel
hi! link WildMenu Pmenu
"statusline
exe 'hi StatusLine' .s:fg_fg_dim . s:bg_bg_alt . ' cterm=none'
exe 'hi StatusLineNC' . s:fg_fg_dim . s:bg_bg_float
exe 'hi WinBar' .s:bg_none
exe 'hi WinBarNC' . s:bg_none
exe 'hi WinSeparator' . s:bg_bg . s:fg_bg_dim
"Error
exe 'hi Error' . s:fg_red . 'gui=bold guibg=NONE'
hi! link ErrorMsg Error
"Markup
exe 'hi Conceal' . s:fg_blue .. ' guibg=NONE'
hi! link  NonText Comment
"Float
exe 'hi FloatBorder' . s:fg_blue
exe 'hi NormalFloat' . s:bg_bg_float . s:fg_fg
"Fold
exe 'hi Folded' . s:fg_bg .'gui=bold'
hi! link FoldColumn SignColumn
"Spell
exe 'hi SpellBad' . s:fg_red
exe 'hi SpellCap' .  ' gui=undercurl guisp='. s:p.red
exe 'hi SpellRare' .  ' gui=undercurl guisp='.s:fg_purple
exe 'hi SpellLocal' .  ' gui=undercurl'
"Msg
exe 'hi WarningMsg' . s:fg_red
exe 'hi MoreMsg' . s:fg_green
"Internal
exe 'hi NvimInternalError' . s:fg_red
exe 'hi Directory' . s:fg_blue
"------------------------------------------------------
"-
"-@Langauge Relate
"-@Identifier
exe 'hi Identifier' . s:fg_blue
" various variable names
exe 'hi @variable' . s:fg_fg
" built-in variable names (e.g. `this`)
exe 'hi @variable.builtin' . s:fg_purple
" link to field
exe 'hi @variable.member' . s:fg_purple
exe 'hi Constant' . s:fg_orange
hi! link @constant.builtin   Constant
" constants defined by the preprocessor
hi! link @constant.macro Constant
"modules or namespaces
exe 'hi @namespace' . s:fg_cyan
"symbols or atoms
" ['@symbol'] = exe},
"------------------------------------------------------
"-@Keywords
exe 'hi Keyword' . s:fg_red
exe 'hi @keyword.function' . s:fg_cyan
hi! link  @keyword.return   Keyword
hi! link  @keyword.operator Operator
hi! link  @keyword.import   PreProc
"if else
exe 'hi Conditional' . s:fg_orange
hi! link  @keyword.conditional   Conditional
"for while
hi! link Repeat Conditional
hi! link  @keyword.repeat   Repeat
"for attribute
hi! link @attribute Keyword

exe 'hi Debug' . s:fg_orange
exe 'hi Label' . s:fg_purple
exe 'hi PreProc' . s:fg_red
hi! link Include  PreProc
exe 'hi Exception' . s:fg_purple
exe 'hi Statement' . s:fg_purple
exe 'hi SpecialKey' . s:fg_orange
exe 'hi Special' . s:fg_orange
"------------------------------------------------------
"-@Types
exe 'hi Type' . s:fg_cyan
hi! link @type.builtin Type
"type definitions (e.g. `typedef` in C)
hi! link @type.definition Type
"type qualifiers (e.g. `const`)
hi! link @type.qualifier KeyWord
"modifiers that affect storage in memory or life-time like C `static`
hi! link @storageclass Keyword
exe 'hi @field' . s:fg_cyan
exe 'hi @property' . s:fg_fg
"------------------------------------------------------
"-@Functions
exe 'hi Function' . s:fg_green
"built-in functions
hi! link  @function.builtin Function
"function calls
exe 'hi @function.call' . s:fg_green
"preprocessor macros
hi! link @function.macro Function
hi! link @method Function
hi! link @method.call Function
" exe 'hi @constructor' . s:fg_n_orange
hi! link @parameter @variable
"------------------------------------------------------
"-@Literals
exe 'hi String' . s:fg_yellow
exe 'hi Number' . s:fg_purple
hi! link Float Number
hi! link Boolean Constant
"
hi! link Define PreProc
exe 'hi Operator' . s:fg_red
hi Comment guifg=#727072
"------------------------------------------------------
"-@punctuation
exe 'hi @punctuation.bracket' . s:fg_red
exe 'hi @punctuation.delimiter' . s:fg_fg_dim
"------------------------------------------------------
"-@Tag
exe 'hi @tag.html' . s:fg_orange
hi! link  @tag.attribute.html @property
hi! link  @tag.delimiter.html @punctuation.delimiter
hi! link  @tag.javascript @tag.html
hi! link  @tag.attribute.javascript @tag.attribute.html
hi! link  @tag.delimiter.javascript @tag.delimiter.html
hi! link  @tag.typescript @tag.html
hi! link  @tag.attribute.typescript @tag.attribute.html
hi! link  @tag.delimiter.typescript @tag.delimiter.html
"------------------------------------------------------
"-@Markdown
exe 'hi @text.reference.markdown_inline' . s:fg_blue
"-@Diff
exe 'hi DiffAdd' . s:fg_green . ' guibg=NONE'
exe 'hi DiffChange' . s:fg_blue . ' guibg=NONE'
exe 'hi DiffDelete' . s:fg_red . ' guibg=NONE'
exe 'hi DiffText' . s:fg_orange . ' guibg=NONE'
hi! link @text.diff.add.diff DiffAdd
hi! link @text.diff.delete.diff DiffDelete
hi! link @text.diff.change.diff DiffChange
"------------------------------------------------------
"-@Diagnostic
"based on bg: '#2d2a2e'
" . ' guibg=#3d2a2e'
exe 'hi DiagnosticError'. s:fg_red
" . ' guibg=#3d3a2e'
exe 'hi DiagnosticWarn' . s:fg_yellow
exe 'hi DiagnosticInfo' . s:fg_blue
exe 'hi DiagnosticHint' . s:fg_cyan
hi! link  DiagnosticSignError DiagnosticError
hi! link  DiagnosticSignWarn DiagnosticWarn
hi! link  DiagnosticSignInfo DiagnosticInfo
hi! link  DiagnosticSignHint DiagnosticHint
exe 'hi DiagnosticUnderlineError' .  ' gui=undercurl guisp=' . s:p["red"]
exe 'hi DiagnosticUnderlineWarn' .  ' gui=undercurl  guisp=' . s:p["yellow"]
exe 'hi DiagnosticUnderlineInfo' .  ' gui=undercurl  guisp=' . s:p["blue"]
exe 'hi DiagnosticUnderlineHint' .  ' gui=undercurl  guisp=' . s:p["cyan"]

"My changes
exe 'hi TabLine' . s:bg_bg_dim . s:fg_fg_alt
exe 'hi TabLineSel' . ' cterm=bold gui=bold ' . s:bg_bg_alt . s:fg_fg
hi! link MiniTablineModifiedCurrent TabLineSel
exe 'hi MiniTablineModifiedHidden' . s:bg_bg_dim . s:fg_yellow
exe 'hi MiniCursorword guifg=NONE gui=NONE cterm=NONE' . s:bg_bg_dim

hi! link MiniDiffSignAdd DiffAdd
hi! link MiniDiffSignChange DiffChange
hi! link MiniDiffSignDelete DiffDelete
"colors from "bg" but altered
hi! MiniDiffOverAdd guibg=#2d4a2e
hi! MiniDiffOverDelete guibg=#4d2a2e
hi! MiniDiffOverChange guibg=#4d3a2e
hi! MiniDiffOverContext guibg=#2d2a4e
