" 行末スペースを自動的に削除します
" Version: 1.0
" Author: tommy <kazu9su@gmail.com>
" License: VIM LICENSE

let s:save_cpo = &cpo
set cpo&vim

if !exists('g:sweep_trail#enable')
    let g:sweep_trail#enable = 1
endif

if !exists('g:sweep_trail#option_enable')
    let g:sweep_trail#option_enable = 0
endif

function! sweep_trail#sweep() range
    execute printf('%s,%ssubstitute/\(\s\|　\)\+$//e', a:firstline, a:lastline)
endfunction

function! sweep_trail#sweep_optional() range
    execute printf('%s,%ssubstitute/\%(\S\+\)\@<=\(\s\|　\)\+$//e', a:firstline, a:lastline)
endfunction

function! sweep_trail#enable()
    let g:sweep_trail#enable = 1
endfunction

function! sweep_trail#unable()
    let g:sweep_trail#enable = 0
endfunction

function! sweep_trail#option_enable()
    let g:sweep_trail#option_enable = 1
endfunction

function! sweep_trail#option_unable()
    let g:sweep_trail#option_enable = 0
endfunction

function! sweep_trail#auto_sweep()
    if g:sweep_trail#option_enable
        %call sweep_trail#sweep_optional()
    elseif g:sweep_trail#enable
        %call sweep_trail#sweep()
    endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
