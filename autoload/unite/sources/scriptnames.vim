let s:save_cpo = &cpo
set cpo&vim
" [TODO]( <zhaocai> 2011-12-25 03:15PM ) change source to vim/scriptnames
" add vim/function vim/message vim/runtimepath vim/autocmd ... ( use verbose to get source file location)
" vim/menu 
let s:unite_source = {
      \ 'name': 'scriptnames',
      \ 'max_candidates': 50,
      \ 'is_volatile': 1,
      \ }

fun! s:unite_source.gather_candidates(args, context)
    redir => output
    silent execute 'scriptnames'
    redir END

    let scripts = split(output, "\n")
    let candidates = []
    for _ in scripts
        let [nr, fname ] = matchlist(_,'\v(\d+):\s*(.*)$')[1:2]
        call add(candidates, {
                \ "word": _,
                \ "source": "scriptnames",
                \ "kind": "file",
                \ "action__path": unite#util#substitute_path_separator(
                \   fnamemodify(fname, ":p")),
                \ "action__directory": unite#util#substitute_path_separator(
                \   fnamemodify(fname, ":p:h")),
                \ } )
    endfor
    return candidates
endf

fun! unite#sources#scriptnames#define()
    return s:unite_source
endf


let &cpo = s:save_cpo
unlet s:save_cpo
