" Name:       Solarized vim colorscheme
" Author:     Ethan Schoonover <es@ethanschoonover.com>
" Maintainer: Panagiotis Kkolos
" URL:        http://ethanschoonover.com/solarized
" License:    MIT license (see end of this file)
" Modified:   2016 Dec 13
"
" Colorscheme initialization                                                 {{{
" ------------------------------------------------------------------------------
hi clear
if exists("syntax_on")
    syntax reset
endif
let colors_name = "solarized"
" }}}
" Color palette                                                              {{{
" ------------------------------------------------------------------------------
" L\*a\*b values are canonical (White D65, Reference D50), other values are
" matched in sRGB space.
"
" SOLARIZED HEX     16 TERMCOL   L*A*B      sRGB        HSB
" --------- ------- -- --------- ---------- ----------- -----------
" base03    #002b36  0 brblack   15 -12 -12   0  43  54 193 100  21
" base02    #073642 10 black     20 -12 -12   7  54  66 192  90  26
" base01    #586e75 11 brgreen   45 -07 -07  88 110 117 194  25  46
" base00    #657b83  8 bryellow  50 -07 -07 101 123 131 195  23  51
" base0     #839496 12 brblue    60 -06 -03 131 148 150 186  13  59
" base1     #93a1a1 14 brcyan    65 -05 -02 147 161 161 180   9  63
" base2     #eee8d5  7 white     92 -00  10 238 232 213  44  11  93
" base3     #fdf6e3 15 brwhite   97  00  10 253 246 227  44  10  99
" yellow    #b58900  3 yellow    60  10  65 181 137   0  45 100  71
" orange    #cb4b16  9 brred     50  50  55 203  75  22  18  89  80
" red       #dc322f  1 red       50  65  45 220  50  47   1  79  86
" magenta   #d33682  5 magenta   50  65 -05 211  54 130 331  74  83
" violet    #6c71c4 13 brmagenta 50  15 -45 108 113 196 237  45  77
" blue      #268bd2  4 blue      55 -10 -45  38 139 210 205  82  82
" cyan      #2aa198  6 cyan      60 -35 -05  42 161 152 175  74  63
" green     #859900  2 green     60 -20  65 133 153   0  68 100  60
"
    let s:base03      = "#002b36"
    let s:base02      = "#073642"
    let s:base01      = "#586e75"
    let s:base00      = "#657b83"
    let s:base0       = "#839496"
    let s:base1       = "#93a1a1"
    let s:base2       = "#eee8d5"
    let s:base3       = "#fdf6e3"
    let s:yellow      = "#b58900"
    let s:orange      = "#cb4b16"
    let s:red         = "#dc322f"
    let s:magenta     = "#d33682"
    let s:violet      = "#6c71c4"
    let s:blue        = "#268bd2"
    let s:cyan        = "#2aa198"
    "let s:green       = "#859900" "original
    let s:green       = "#719e07" "experimental
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
" Alternate light scheme                                                     {{{
" ------------------------------------------------------------------------------
if &background == "light"
    let s:temp03      = s:base03
    let s:temp02      = s:base02
    let s:temp01      = s:base01
    let s:temp00      = s:base00
    let s:base03      = s:base3
    let s:base02      = s:base2
    let s:base01      = s:base1
    let s:base00      = s:base0
    let s:base0       = s:temp00
    let s:base1       = s:temp01
    let s:base2       = s:temp02
    let s:base3       = s:temp03
    let s:temp03      = s:t_base03
    let s:temp02      = s:t_base02
    let s:temp01      = s:t_base01
    let s:temp00      = s:t_base00
    let s:t_base03    = s:t_base3
    let s:t_base02    = s:t_base2
    let s:t_base01    = s:t_base1
    let s:t_base00    = s:t_base0
    let s:t_base0     = s:temp00
    let s:t_base1     = s:temp01
    let s:t_base2     = s:temp02
    let s:t_base3     = s:temp03
endif
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

if exists("g:solarized_bold") && g:solarized_bold == 0
    let s:b           = ""
else
    let s:b           = ",bold"
endif

if exists("g:solarized_underline") && g:solarized_underline == 0
    let s:u           = ""
else
    let s:u           = ",underline"
endif

if exists("g:solarized_italic") && g:solarized_italic == 0
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

exe "hi! Normal"         .s:fmt_none .s:fg_base0   .s:bg_back

exe "hi! Comment"        .s:fmt_ital .s:fg_base01  .s:bg_none
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
if exists("g:solarized_nontxtmode") && g:solarized_nontxtmode == "high"
    exe "hi! NonText"    .s:fmt_bold .s:fg_red     .s:bg_none
    exe "hi! SpecialKey" .s:fmt_revr .s:fg_red     .s:bg_none
else
    exe "hi! NonText"    .s:fmt_bold .s:fg_base02  .s:bg_none
    exe "hi! SpecialKey" .s:fmt_bold .s:fg_base02  .s:bg_none
endif

if exists("g:solarized_diffmode") && g:solarized_diffmode == "high"
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
exe "hi! Cursor"         .s:fmt_none .s:fg_base03  .s:bg_base0
exe "hi! CursorColumn"   .s:fmt_none .s:fg_none    .s:bg_base02
exe "hi! CursorLine"     .s:fmt_none .s:fg_none    .s:bg_base02
exe "hi! Directory"      .s:fmt_none .s:fg_blue    .s:bg_none
exe "hi! ErrorMsg"       .s:fmt_bold .s:fg_red     .s:bg_none
exe "hi! VertSplit"      .s:fmt_none .s:fg_base00  .s:bg_base00
exe "hi! Folded"         .s:fmt_undb .s:fg_base0   .s:bg_base02
exe "hi! FoldColumn"     .s:fmt_none .s:fg_base0   .s:bg_base02
exe "hi! SignColumn"     .s:fmt_none .s:fg_base0   .s:bg_base02
exe "hi! IncSearch"      .s:fmt_stnd .s:fg_orange  .s:bg_none
exe "hi! LineNr"         .s:fmt_none .s:fg_base01  .s:bg_base02
exe "hi! CursorLineNr"   .s:fmt_bold .s:fg_yellow  .s:bg_base02
exe "hi! MatchParen"     .s:fmt_bold .s:fg_red     .s:bg_base01
exe "hi! ModeMsg"        .s:fmt_none .s:fg_blue    .s:bg_none
exe "hi! MoreMsg"        .s:fmt_none .s:fg_blue    .s:bg_none
exe "hi! Pmenu"          .s:fmt_revr .s:fg_base0   .s:bg_base02
exe "hi! PmenuSel"       .s:fmt_revr .s:fg_base01  .s:bg_base2
exe "hi! PmenuSbar"      .s:fmt_revr .s:fg_base2   .s:bg_base0
exe "hi! PmenuThumb"     .s:fmt_revr .s:fg_base0   .s:bg_base03
exe "hi! Question"       .s:fmt_bold .s:fg_cyan    .s:bg_none
exe "hi! Search"         .s:fmt_revr .s:fg_yellow  .s:bg_none
exe "hi! SpellBad"       .s:fmt_curl .s:fg_none    .s:bg_none    .s:sp_red
exe "hi! SpellCap"       .s:fmt_curl .s:fg_none    .s:bg_none    .s:sp_violet
exe "hi! SpellLocal"     .s:fmt_curl .s:fg_none    .s:bg_none    .s:sp_yellow
exe "hi! SpellRare"      .s:fmt_curl .s:fg_none    .s:bg_none    .s:sp_cyan
exe "hi! StatusLine"     .s:fmt_revb .s:fg_base1   .s:bg_base02
exe "hi! StatusLineNC"   .s:fmt_revr .s:fg_base00  .s:bg_base02
exe "hi! TabLine"        .s:fmt_undr .s:fg_base0   .s:bg_base02
exe "hi! TabLineFill"    .s:fmt_undr .s:fg_base0   .s:bg_base02
exe "hi! TabLineSel"     .s:fmt_revu .s:fg_base01  .s:bg_base2
exe "hi! Title"          .s:fmt_bold .s:fg_orange  .s:bg_none
exe "hi! Visual"         .s:fmt_revr .s:fg_base01  .s:bg_base03
exe "hi! VisualNOS"      .s:fmt_stnd .s:fg_none    .s:bg_base02
exe "hi! WarningMsg"     .s:fmt_bold .s:fg_yellow  .s:bg_none
exe "hi! WildMenu"       .s:fmt_revr .s:fg_base2   .s:bg_base02

hi! link lCursor Cursor
" }}}
" vim syntax highlighting                                                    {{{
" ------------------------------------------------------------------------------
exe "hi! helpExample"            .s:fmt_none .s:fg_base1   .s:bg_none
exe "hi! helpOption"             .s:fmt_none .s:fg_cyan    .s:bg_none
exe "hi! helpNote"               .s:fmt_none .s:fg_magenta .s:bg_none
exe "hi! helpVim"                .s:fmt_none .s:fg_magenta .s:bg_none
exe "hi! helpHyperTextJump"      .s:fmt_undr .s:fg_blue    .s:bg_none
exe "hi! helpHyperTextEntry"     .s:fmt_none .s:fg_green   .s:bg_none

exe "hi! vimCommentString"       .s:fmt_none .s:fg_violet  .s:bg_none
exe "hi! vimCommand"             .s:fmt_none .s:fg_yellow  .s:bg_none
exe "hi! vimCmdSep"              .s:fmt_bold .s:fg_blue    .s:bg_none
exe "hi! vimIsCommand"           .s:fmt_none .s:fg_base00  .s:bg_none
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
exe "hi! gitcommitOnBranch"      .s:fmt_bold .s:fg_base01  .s:bg_none
exe "hi! gitcommitBranch"        .s:fmt_bold .s:fg_magenta .s:bg_none
exe "hi! gitcommitDiscardedType" .s:fmt_none .s:fg_red     .s:bg_none
exe "hi! gitcommitSelectedType"  .s:fmt_none .s:fg_green   .s:bg_none
exe "hi! gitcommitHeader"        .s:fmt_none .s:fg_base01  .s:bg_none
exe "hi! gitcommitUntrackedFile" .s:fmt_bold .s:fg_cyan    .s:bg_none
exe "hi! gitcommitDiscardedFile" .s:fmt_bold .s:fg_red     .s:bg_none
exe "hi! gitcommitSelectedFile"  .s:fmt_bold .s:fg_green   .s:bg_none
exe "hi! gitcommitUnmergedFile"  .s:fmt_bold .s:fg_yellow  .s:bg_none
exe "hi! gitcommitFile"          .s:fmt_bold .s:fg_base0   .s:bg_none

hi! link gitcommitDiscardedArrow gitcommitDiscardedType
hi! link gitcommitSelectedArrow  gitcommitSelectedType
hi! link gitcommitUnmergedArrow  gitcommitUnmergedType
" }}}
" html highlighting                                                          {{{
" ------------------------------------------------------------------------------
exe "hi! htmlArg"                .s:fmt_none .s:fg_base00  .s:bg_none
exe "hi! htmlTag"                .s:fmt_none .s:fg_base01  .s:bg_none
exe "hi! htmlEndTag"             .s:fmt_none .s:fg_base01  .s:bg_none
exe "hi! htmlTagN"               .s:fmt_bold .s:fg_base1   .s:bg_none
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
exe "hi! rubyDefine"             .s:fmt_bold .s:fg_base1   .s:bg_none
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
exe "hi! hsString"               .s:fmt_none .s:fg_base00  .s:bg_none
" }}}
" statusline highlighting                                                    {{{
" ------------------------------------------------------------------------------
let g:ss_fg_default = s:fg_base03
let g:ss_bg_default = s:bg_base1
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
" License                                                                    {{{
" ------------------------------------------------------------------------------
"
" Copyright (c) 2011 Ethan Schoonover
"               2016 Panagiotis Kkolos
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
