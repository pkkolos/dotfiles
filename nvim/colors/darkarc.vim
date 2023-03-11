" Name:       DarkArc vim colorscheme
" Author:     Panagiotis Kkolos
" License:    MIT license (see end of this file)
" Modified:   2017 Mar 16
"
" Colorscheme initialization                                                 {{{
" ------------------------------------------------------------------------------
hi clear
if exists("syntax_on")
    syntax reset
endif
set background=dark
let colors_name = "darkarc"
" }}}
" Color palette                                                              {{{
" ------------------------------------------------------------------------------
" DARKARC HEX     16 TERMCOL   RGB         HSL         HSB
" ------- ------- -- --------- ----------- ----------- -----------
" base03  #282c34  0 black      40  44  52 220  13  18 220  23  20
" base02  #2c313a 10 brgreen    44  49  58 219  14  20 219  24  23
" base01  #353b45 11 bryellow   53  59  69 218  13  24 218  23  27
" base00  #474e5c  8 brblack    71  78  92 220  13  32 220  23  36
" base0   #7c879c 12 brblue    124 135 156 219  14  55 219  21  61
" base1   #99a2b2 14 brcyan    153 162 178 218  14  65 218  14  70
" base2   #b6bcc8  7 white     182 188 200 220  14  75 220   9  78
" base3   #e2e4e9 15 brwhite   226 228 233 223  14  90 223   3  91
" yellow  #f2c97d  3 yellow    242 201 125  39  82  72  39  48  95
" orange  #df8558  9 brred     223 133  88  20  68  61  20  61  87
" red     #e05c67  1 red       224  92 103 355  68  62 355  59  88
" magenta #dd78c4  5 magenta   221 120 196 315  60  67 315  46  87
" violet  #b888e2 13 brmagenta 184 136 226 272  61  71 272  40  89
" blue    #4aa4ed  4 blue       74 164 237 207  82  61 207  69  93
" cyan    #3fc7d9  6 cyan       63 199 217 187  67  55 187  71  85
" green   #97cb72  2 green     151 203 114  95  46  62  95  44  80
"
    let s:base03      = "#282c34"
    let s:base02      = "#2c313a"
    let s:base01      = "#353b45"
    let s:base00      = "#474e5c"
    let s:base0       = "#7c879c"
    let s:base1       = "#99a2b2"
    let s:base2       = "#b6bcc8"
    let s:base3       = "#e2e4e9"
    let s:yellow      = "#f2c97d"
    let s:orange      = "#df8558"
    let s:red         = "#e05c67"
    let s:magenta     = "#dd78c4"
    let s:violet      = "#b888e2"
    let s:blue        = "#4aa4ed"
    let s:cyan        = "#3fc7d9"
    let s:green       = "#97cb72"
    let s:t_base03    = "0"
    let s:t_base02    = "10"
    let s:t_base01    = "11"
    let s:t_base00    = "8"
    let s:t_base0     = "12"
    let s:t_base1     = "14"
    let s:t_base2     = "7"
    let s:t_base3     = "15"
    let s:t_yellow    = "3"
    let s:t_orange    = "9"
    let s:t_red       = "1"
    let s:t_magenta   = "5"
    let s:t_violet    = "13"
    let s:t_blue      = "4"
    let s:t_cyan      = "6"
    let s:t_green     = "2"
" }}}
" Background value                                                           {{{
" ------------------------------------------------------------------------------
    let s:back        = s:base03
    let s:t_back      = s:t_base03
" }}}
" Formatting options                                                         {{{
" ------------------------------------------------------------------------------
    let s:none        = "NONE"
    let s:c           = ",undercurl"
    let s:r           = ",reverse"
    let s:s           = ",standout"

if exists("g:darkarc_bold") && g:darkarc_bold == 0
    let s:b           = ""
else
    let s:b           = ",bold"
endif

if exists("g:darkarc_underline") && g:darkarc_underline == 0
    let s:u           = ""
else
    let s:u           = ",underline"
endif

if exists("g:darkarc_italic") && g:darkarc_italic == 0
    let s:i           = ""
else
    let s:i           = ",italic"
endif
" }}}
" Highlighting primitives                                                    {{{
" ------------------------------------------------------------------------------
exe "let s:bg_none    = ' guibg=".s:none   ." ctermbg=".s:none     ."'"
exe "let s:bg_back    = ' guibg=".s:back   ." ctermbg=".s:t_back   ."'"
exe "let s:bg_base03  = ' guibg=".s:base03 ." ctermbg=".s:t_base03 ."'"
exe "let s:bg_base02  = ' guibg=".s:base02 ." ctermbg=".s:t_base02 ."'"
exe "let s:bg_base01  = ' guibg=".s:base01 ." ctermbg=".s:t_base01 ."'"
exe "let s:bg_base00  = ' guibg=".s:base00 ." ctermbg=".s:t_base00 ."'"
exe "let s:bg_base0   = ' guibg=".s:base0  ." ctermbg=".s:t_base0  ."'"
exe "let s:bg_base1   = ' guibg=".s:base1  ." ctermbg=".s:t_base1  ."'"
exe "let s:bg_base2   = ' guibg=".s:base2  ." ctermbg=".s:t_base2  ."'"
exe "let s:bg_base3   = ' guibg=".s:base3  ." ctermbg=".s:t_base3  ."'"
exe "let s:bg_green   = ' guibg=".s:green  ." ctermbg=".s:t_green  ."'"
exe "let s:bg_yellow  = ' guibg=".s:yellow ." ctermbg=".s:t_yellow ."'"
exe "let s:bg_orange  = ' guibg=".s:orange ." ctermbg=".s:t_orange ."'"
exe "let s:bg_red     = ' guibg=".s:red    ." ctermbg=".s:t_red    ."'"
exe "let s:bg_magenta = ' guibg=".s:magenta." ctermbg=".s:t_magenta."'"
exe "let s:bg_violet  = ' guibg=".s:violet ." ctermbg=".s:t_violet ."'"
exe "let s:bg_blue    = ' guibg=".s:blue   ." ctermbg=".s:t_blue   ."'"
exe "let s:bg_cyan    = ' guibg=".s:cyan   ." ctermbg=".s:t_cyan   ."'"

exe "let s:fg_none    = ' guifg=".s:none   ." ctermfg=".s:none     ."'"
exe "let s:fg_back    = ' guifg=".s:back   ." ctermfg=".s:t_back   ."'"
exe "let s:fg_base03  = ' guifg=".s:base03 ." ctermfg=".s:t_base03 ."'"
exe "let s:fg_base02  = ' guifg=".s:base02 ." ctermfg=".s:t_base02 ."'"
exe "let s:fg_base01  = ' guifg=".s:base01 ." ctermfg=".s:t_base01 ."'"
exe "let s:fg_base00  = ' guifg=".s:base00 ." ctermfg=".s:t_base00 ."'"
exe "let s:fg_base0   = ' guifg=".s:base0  ." ctermfg=".s:t_base0  ."'"
exe "let s:fg_base1   = ' guifg=".s:base1  ." ctermfg=".s:t_base1  ."'"
exe "let s:fg_base2   = ' guifg=".s:base2  ." ctermfg=".s:t_base2  ."'"
exe "let s:fg_base3   = ' guifg=".s:base3  ." ctermfg=".s:t_base3  ."'"
exe "let s:fg_green   = ' guifg=".s:green  ." ctermfg=".s:t_green  ."'"
exe "let s:fg_yellow  = ' guifg=".s:yellow ." ctermfg=".s:t_yellow ."'"
exe "let s:fg_orange  = ' guifg=".s:orange ." ctermfg=".s:t_orange ."'"
exe "let s:fg_red     = ' guifg=".s:red    ." ctermfg=".s:t_red    ."'"
exe "let s:fg_magenta = ' guifg=".s:magenta." ctermfg=".s:t_magenta."'"
exe "let s:fg_violet  = ' guifg=".s:violet ." ctermfg=".s:t_violet ."'"
exe "let s:fg_blue    = ' guifg=".s:blue   ." ctermfg=".s:t_blue   ."'"
exe "let s:fg_cyan    = ' guifg=".s:cyan   ." ctermfg=".s:t_cyan   ."'"

exe "let s:sp_none    = ' guisp=".s:none   ."'"
exe "let s:sp_back    = ' guisp=".s:back   ."'"
exe "let s:sp_base03  = ' guisp=".s:base03 ."'"
exe "let s:sp_base02  = ' guisp=".s:base02 ."'"
exe "let s:sp_base01  = ' guisp=".s:base01 ."'"
exe "let s:sp_base00  = ' guisp=".s:base00 ."'"
exe "let s:sp_base0   = ' guisp=".s:base0  ."'"
exe "let s:sp_base1   = ' guisp=".s:base1  ."'"
exe "let s:sp_base2   = ' guisp=".s:base2  ."'"
exe "let s:sp_base3   = ' guisp=".s:base3  ."'"
exe "let s:sp_green   = ' guisp=".s:green  ."'"
exe "let s:sp_yellow  = ' guisp=".s:yellow ."'"
exe "let s:sp_orange  = ' guisp=".s:orange ."'"
exe "let s:sp_red     = ' guisp=".s:red    ."'"
exe "let s:sp_magenta = ' guisp=".s:magenta."'"
exe "let s:sp_violet  = ' guisp=".s:violet ."'"
exe "let s:sp_blue    = ' guisp=".s:blue   ."'"
exe "let s:sp_cyan    = ' guisp=".s:cyan   ."'"

exe "let s:fmt_none   = ' gui=NONE".        " cterm=NONE".        " term=NONE".        "'"
exe "let s:fmt_bold   = ' gui=NONE".s:b.    " cterm=NONE".s:b.    " term=NONE".s:b.    "'"
exe "let s:fmt_bldi   = ' gui=NONE".s:b.s:i." cterm=NONE".s:b.s:i." term=NONE".s:b.s:i."'"
exe "let s:fmt_undr   = ' gui=NONE".s:u.    " cterm=NONE".s:u.    " term=NONE".s:u.    "'"
exe "let s:fmt_undb   = ' gui=NONE".s:u.s:b." cterm=NONE".s:u.s:b." term=NONE".s:u.s:b."'"
exe "let s:fmt_undi   = ' gui=NONE".s:u.s:i." cterm=NONE".s:u.s:i." term=NONE".s:u.s:i."'"
exe "let s:fmt_curl   = ' gui=NONE".s:c.    " cterm=NONE".s:c.    " term=NONE".s:c.    "'"
exe "let s:fmt_ital   = ' gui=NONE".s:i.    " cterm=NONE".s:i.    " term=NONE".s:i.    "'"
exe "let s:fmt_stnd   = ' gui=NONE".s:s.    " cterm=NONE".s:s.    " term=NONE".s:s.    "'"
exe "let s:fmt_revr   = ' gui=NONE".s:r.    " cterm=NONE".s:r.    " term=NONE".s:r.    "'"
exe "let s:fmt_revb   = ' gui=NONE".s:r.s:b." cterm=NONE".s:r.s:b." term=NONE".s:r.s:b."'"
exe "let s:fmt_revu   = ' gui=NONE".s:r.s:u." cterm=NONE".s:r.s:u." term=NONE".s:r.s:u."'"
" }}}
" Basic highlighting                                                         {{{
" ------------------------------------------------------------------------------
" note that link syntax to avoid duplicate configuration doesn't work with the
" exe compiled formats

exe "hi! Normal"         .s:fmt_none .s:fg_base2   .s:bg_back

exe "hi! Comment"        .s:fmt_ital .s:fg_base00  .s:bg_none
"       *Comment         any comment

exe "hi! Constant"       .s:fmt_none .s:fg_orange  .s:bg_none
exe "hi! String"         .s:fmt_none .s:fg_cyan    .s:bg_none
exe "hi! Character"      .s:fmt_none .s:fg_cyan    .s:bg_none
"       *Constant        any constant
"        String          a string constant: "this is a string"
"        Character       a character constant: 'c', '\n'
"        Number          a number constant: 234, 0xff
"        Boolean         a boolean constant: TRUE, false
"        Float           a floating point constant: 2.3e10

exe "hi! Identifier"     .s:fmt_none .s:fg_blue    .s:bg_none
"       *Identifier      any variable name
"        Function        function name (also: methods for classes)
"
exe "hi! Statement"      .s:fmt_none .s:fg_green   .s:bg_none
exe "hi! Exception"      .s:fmt_none .s:fg_red     .s:bg_none
"       *Statement       any statement
"        Conditional     if, then, else, endif, switch, etc.
"        Repeat          for, do, while, etc.
"        Label           case, default, etc.
"        Operator        "sizeof", "+", "*", etc.
"        Keyword         any other keyword
"        Exception       try, catch, throw

exe "hi! PreProc"        .s:fmt_none .s:fg_orange  .s:bg_none
"       *PreProc         generic Preprocessor
"        Include         preprocessor #include
"        Define          preprocessor #define
"        Macro           same as Define
"        PreCondit       preprocessor #if, #else, #endif, etc.

exe "hi! Type"           .s:fmt_none .s:fg_yellow  .s:bg_none
"       *Type            int, long, char, etc.
"        StorageClass    static, register, volatile, etc.
"        Structure       struct, union, enum, etc.
"        Typedef         A typedef

exe "hi! Special"        .s:fmt_none .s:fg_red     .s:bg_none
"       *Special         any special symbol
"        SpecialChar     special character in a constant
"        Tag             you can use CTRL-] on this
"        Delimiter       character that needs attention
"        SpecialComment  special things inside a comment
"        Debug           debugging statements

exe "hi! Underlined"     .s:fmt_none .s:fg_violet  .s:bg_none
"       *Underlined      text that stands out, HTML links

exe "hi! Ignore"         .s:fmt_none .s:fg_none    .s:bg_none
"       *Ignore          left blank, hidden  |hl-Ignore|

exe "hi! Error"          .s:fmt_bold .s:fg_red     .s:bg_none
"       *Error           any erroneous construct

exe "hi! Todo"           .s:fmt_bold .s:fg_magenta .s:bg_none
"       *Todo            anything that needs extra attention; mostly the
"                        keywords TODO FIXME and XXX
" }}}
" Extended highlighting                                                      {{{
" ------------------------------------------------------------------------------
if exists("g:darkarc_nontxtmode") && g:darkarc_nontxtmode == "high"
    exe "hi! NonText"    .s:fmt_bold .s:fg_red     .s:bg_none
    exe "hi! SpecialKey" .s:fmt_revr .s:fg_red     .s:bg_none
else
    exe "hi! NonText"    .s:fmt_bold .s:fg_base01  .s:bg_none
    exe "hi! SpecialKey" .s:fmt_bold .s:fg_base01  .s:bg_none
endif

if exists("g:darkarc_diffmode") && g:darkarc_diffmode == "high"
    exe "hi! DiffAdd"    .s:fmt_revr .s:fg_green   .s:bg_none
    exe "hi! DiffChange" .s:fmt_revr .s:fg_yellow  .s:bg_none
    exe "hi! DiffDelete" .s:fmt_revr .s:fg_red     .s:bg_none
    exe "hi! DiffText"   .s:fmt_revr .s:fg_blue    .s:bg_none
else
    exe "hi! DiffAdd"    .s:fmt_undr .s:fg_green   .s:bg_none
    exe "hi! DiffChange" .s:fmt_undr .s:fg_yellow  .s:bg_none
    exe "hi! DiffDelete" .s:fmt_bold .s:fg_red     .s:bg_none
    exe "hi! DiffText"   .s:fmt_undr .s:fg_blue    .s:bg_none
endif

exe "hi! ColorColumn"    .s:fmt_none .s:fg_none    .s:bg_base02
exe "hi! Conceal"        .s:fmt_none .s:fg_blue    .s:bg_none
exe "hi! Cursor"         .s:fmt_none .s:fg_base03  .s:bg_base2
exe "hi! CursorColumn"   .s:fmt_none .s:fg_none    .s:bg_base02
exe "hi! CursorLine"     .s:fmt_none .s:fg_none    .s:bg_base02
exe "hi! Directory"      .s:fmt_none .s:fg_blue    .s:bg_none
exe "hi! ErrorMsg"       .s:fmt_bold .s:fg_red     .s:bg_none
exe "hi! VertSplit"      .s:fmt_none .s:fg_base00  .s:bg_base00
exe "hi! Folded"         .s:fmt_undb .s:fg_base0   .s:bg_base02
exe "hi! FoldColumn"     .s:fmt_none .s:fg_base00  .s:bg_base02
exe "hi! SignColumn"     .s:fmt_none .s:fg_base00  .s:bg_base02
exe "hi! IncSearch"      .s:fmt_stnd .s:fg_orange  .s:bg_none
exe "hi! LineNr"         .s:fmt_none .s:fg_base00  .s:bg_base02
exe "hi! CursorLineNr"   .s:fmt_bold .s:fg_base1   .s:bg_base02
exe "hi! MatchParen"     .s:fmt_bold .s:fg_red     .s:bg_base00
exe "hi! ModeMsg"        .s:fmt_none .s:fg_blue    .s:bg_none
exe "hi! MoreMsg"        .s:fmt_none .s:fg_blue    .s:bg_none
exe "hi! Pmenu"          .s:fmt_none .s:fg_base2   .s:bg_base02
exe "hi! PmenuSel"       .s:fmt_revr .s:fg_base0   .s:bg_base01
exe "hi! PmenuSbar"      .s:fmt_none .s:fg_base0   .s:bg_base01
exe "hi! PmenuThumb"     .s:fmt_revr .s:fg_base0   .s:bg_base03
exe "hi! Question"       .s:fmt_bold .s:fg_cyan    .s:bg_none
exe "hi! Search"         .s:fmt_revr .s:fg_yellow  .s:bg_none
exe "hi! SpellBad"       .s:fmt_curl .s:fg_none    .s:bg_none    .s:sp_red
exe "hi! SpellCap"       .s:fmt_curl .s:fg_none    .s:bg_none    .s:sp_violet
exe "hi! SpellLocal"     .s:fmt_curl .s:fg_none    .s:bg_none    .s:sp_yellow
exe "hi! SpellRare"      .s:fmt_curl .s:fg_none    .s:bg_none    .s:sp_cyan
exe "hi! StatusLine"     .s:fmt_revb .s:fg_base0   .s:bg_base03
exe "hi! StatusLineNC"   .s:fmt_revr .s:fg_base00  .s:bg_base03
exe "hi! TabLine"        .s:fmt_undr .s:fg_base1   .s:bg_base01
exe "hi! TabLineFill"    .s:fmt_undr .s:fg_base1   .s:bg_base01
exe "hi! TabLineSel"     .s:fmt_revr .s:fg_base1   .s:bg_base03
exe "hi! Title"          .s:fmt_bold .s:fg_orange  .s:bg_none
exe "hi! Visual"         .s:fmt_revr .s:fg_base0   .s:bg_base03
exe "hi! VisualNOS"      .s:fmt_stnd .s:fg_none    .s:bg_base02
exe "hi! WarningMsg"     .s:fmt_bold .s:fg_yellow  .s:bg_none
exe "hi! WildMenu"       .s:fmt_revr .s:fg_base2   .s:bg_base02

hi! link lCursor Cursor
" }}}
" vim syntax highlighting                                                    {{{
" ------------------------------------------------------------------------------
exe "hi! helpOption"             .s:fmt_none .s:fg_cyan    .s:bg_none
exe "hi! helpNote"               .s:fmt_none .s:fg_magenta .s:bg_none
exe "hi! helpVim"                .s:fmt_none .s:fg_magenta .s:bg_none
exe "hi! helpHyperTextJump"      .s:fmt_undr .s:fg_blue    .s:bg_none
exe "hi! helpHyperTextEntry"     .s:fmt_none .s:fg_green   .s:bg_none

exe "hi! vimCommentString"       .s:fmt_none .s:fg_cyan    .s:bg_none
exe "hi! vimCommand"             .s:fmt_none .s:fg_yellow  .s:bg_none
exe "hi! vimCmdSep"              .s:fmt_bold .s:fg_blue    .s:bg_none
exe "hi! vimIsCommand"           .s:fmt_none .s:fg_base0   .s:bg_none
exe "hi! vimSynMtchOpt"          .s:fmt_none .s:fg_yellow  .s:bg_none
exe "hi! vimSynType"             .s:fmt_none .s:fg_cyan    .s:bg_none
exe "hi! vimHiLink"              .s:fmt_none .s:fg_yellow  .s:bg_none
exe "hi! vimHiGroup"             .s:fmt_none .s:fg_blue    .s:bg_none
exe "hi! vimGroup"               .s:fmt_undb .s:fg_blue    .s:bg_none

hi! link vimFunc     Function
hi! link vimUserFunc Function
hi! link vimSet      Normal
hi! link vimSetEqual Normal
" }}}
" diff highlighting                                                          {{{
" ------------------------------------------------------------------------------
exe "hi! diffSubname"            .s:fmt_none .s:fg_magenta .s:bg_none

hi! link diffAdded     Statement
hi! link diffLine      Identifier
hi! link diffIndexLine Identifier
" }}}
" gitcommit highlighting                                                     {{{
" ------------------------------------------------------------------------------
exe "hi! gitcommitOverflow"      .s:fmt_none .s:fg_red     .s:bg_none
exe "hi! gitcommitOnBranch"      .s:fmt_bold .s:fg_base00  .s:bg_none
exe "hi! gitcommitBranch"        .s:fmt_bold .s:fg_magenta .s:bg_none
exe "hi! gitcommitDiscardedType" .s:fmt_none .s:fg_red     .s:bg_none
exe "hi! gitcommitSelectedType"  .s:fmt_none .s:fg_green   .s:bg_none
exe "hi! gitcommitHeader"        .s:fmt_none .s:fg_base0   .s:bg_none
exe "hi! gitcommitUntrackedFile" .s:fmt_bold .s:fg_cyan    .s:bg_none
exe "hi! gitcommitDiscardedFile" .s:fmt_bold .s:fg_red     .s:bg_none
exe "hi! gitcommitSelectedFile"  .s:fmt_bold .s:fg_green   .s:bg_none
exe "hi! gitcommitUnmergedFile"  .s:fmt_bold .s:fg_yellow  .s:bg_none

hi! link gitcommitDiscardedArrow gitcommitDiscardedType
hi! link gitcommitSelectedArrow  gitcommitSelectedType
hi! link gitcommitUnmergedArrow  gitcommitUnmergedType
" }}}
" html highlighting                                                          {{{
" ------------------------------------------------------------------------------
exe "hi! htmlArg"                .s:fmt_none .s:fg_base0   .s:bg_none
exe "hi! htmlTag"                .s:fmt_none .s:fg_base00  .s:bg_none
exe "hi! htmlEndTag"             .s:fmt_none .s:fg_base00  .s:bg_none
exe "hi! htmlTagN"               .s:fmt_bold .s:fg_base2   .s:bg_none
exe "hi! htmlTagName"            .s:fmt_bold .s:fg_blue    .s:bg_none
exe "hi! htmlSpecialTagName"     .s:fmt_ital .s:fg_blue    .s:bg_none

exe "hi! javaScript"             .s:fmt_none .s:fg_yellow  .s:bg_none
" }}}
" perl highlighting                                                          {{{
" ------------------------------------------------------------------------------
exe "hi! perlHereDoc"            .s:fmt_none .s:fg_base1   .s:bg_none
exe "hi! perlStatementFileDesc"  .s:fmt_none .s:fg_cyan    .s:bg_none
exe "hi! perlVarPlain"           .s:fmt_none .s:fg_yellow  .s:bg_none
" }}}
" tex highlighting                                                           {{{
" ------------------------------------------------------------------------------
exe "hi! texMathMatcher"         .s:fmt_none .s:fg_yellow  .s:bg_none
exe "hi! texRefLabel"            .s:fmt_none .s:fg_yellow  .s:bg_none
exe "hi! texStatement"           .s:fmt_none .s:fg_orange  .s:bg_none
exe "hi! texSection"             .s:fmt_none .s:fg_blue    .s:bg_none
exe "hi! texZone"                .s:fmt_none .s:fg_blue    .s:bg_none
" }}}
" ruby highlighting                                                          {{{
" ------------------------------------------------------------------------------
exe "hi! rubyDefine"             .s:fmt_bold .s:fg_base3   .s:bg_none
" }}}
" haskell syntax highlighting                                                {{{
" ------------------------------------------------------------------------------
" treat True and False specially
let hs_highlight_boolean = 1
" highlight delims
let hs_highlight_delimiters = 1

exe "hi! VarId"                  .s:fmt_none .s:fg_blue    .s:bg_none
exe "hi! ConId"                  .s:fmt_none .s:fg_yellow  .s:bg_none

exe "hi! hsImport"               .s:fmt_none .s:fg_magenta .s:bg_none
exe "hi! hsStructure"            .s:fmt_none .s:fg_orange  .s:bg_none
exe "hi! hsStatement"            .s:fmt_none .s:fg_orange  .s:bg_none
exe "hi! hsTypedef"              .s:fmt_none .s:fg_orange  .s:bg_none
exe "hi! hsVarSym"               .s:fmt_none .s:fg_orange  .s:bg_none
exe "hi! hsString"               .s:fmt_none .s:fg_base1   .s:bg_none
" }}}
" statusline highlighting                                                    {{{
" ------------------------------------------------------------------------------
let g:ss_fg_default = s:fg_base03
let g:ss_bg_default = s:bg_base0
let g:ss_bg_default_nc = s:bg_base00
let g:ss_bg_red = s:bg_red
let g:ss_bg_green = s:bg_green
let g:ss_bg_yellow = s:bg_yellow
let g:ss_bg_blue = s:bg_blue
let g:ss_bg_magenta = s:bg_magenta
let g:ss_bg_cyan = s:bg_cyan
let g:ss_bg_orange = s:bg_orange
let g:ss_bg_violet = s:bg_violet
" }}}
" cmp highlighting                                                     {{{
" ------------------------------------------------------------------------------
exe "hi! CmpItemAbbrMatch"    .s:fmt_bold .s:fg_base3   .s:bg_none
exe "hi! CmpItemKindVariable" .s:fmt_ital .s:fg_cyan    .s:bg_none
exe "hi! CmpItemKindFunction" .s:fmt_ital .s:fg_magenta .s:bg_none
exe "hi! CmpItemKindKeyword"  .s:fmt_ital .s:fg_red     .s:bg_none
exe "hi! CmpItemKindField"    .s:fmt_ital .s:fg_green   .s:bg_none
exe "hi! CmpItemKindClass"    .s:fmt_ital .s:fg_yellow  .s:bg_none
exe "hi! CmpItemKindModule"   .s:fmt_ital .s:fg_blue    .s:bg_none
exe "hi! CmpItemKindOperator" .s:fmt_ital .s:fg_violet  .s:bg_none

hi! link CmpItemAbbrMatchFuzzy    CmpItemAbbrMatch
hi! link CmpItemKindText          CmpItemKindVariable
hi! link CmpItemKindConstant      CmpItemKindVariable
hi! link CmpItemKindValue         CmpItemKindVariable
hi! link CmpItemKindMethod        CmpItemKindFunction
hi! link CmpItemKindConstructor   CmpItemKindFunction
hi! link CmpItemKindColor         CmpItemKindKeyword
hi! link CmpItemKindReference     CmpItemKindKeyword
hi! link CmpItemKindEnumMember    CmpItemKindKeyword
hi! link CmpItemKindProperty      CmpItemKindField
hi! link CmpItemKindEnum          CmpItemKindField
hi! link CmpItemKindUnit          CmpItemKindField
hi! link CmpItemKindInterface     CmpItemKindClass
hi! link CmpItemKindStruct        CmpItemKindClass
hi! link CmpItemKindFolder        CmpItemKindModule
hi! link CmpItemKindFile          CmpItemKindModule
hi! link CmpItemKindTypeParameter CmpItemKindModule
hi! link CmpItemKindEvent         CmpItemKindOperator
" }}}
" License                                                                    {{{
" ------------------------------------------------------------------------------
"
" Copyright (c) 2016 Panagiotis Kkolos
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.
"
" vim:foldmethod=marker:foldlevel=0
" }}}
