let s:save_cpo = &cpo
set cpo&vim

let s:unite_source = {
      \ 'name': 'scriptnames',
      \ 'max_candidates': 50,
      \ 'is_volatile': 1,
      \ }

function! s:unite_source.gather_candidates(args, context)
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
endfunction

function! unite#sources#scriptnames#define()
    return s:unite_source
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
