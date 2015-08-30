let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_CompileRule_pdf =
            \ 'xelatex -shell-escape -interaction=nonstopmode'
            \ . ' -file-line-error-style $*'
let g:Tex_UseMakefile = 0
let g:Imap_UsePlaceHolders = 0
