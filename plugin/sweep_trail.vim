" 行末スペースを自動的に削除します
" Version: 1.0
" Author: tommy <kazu9su@gmail.com>
" License: VIM LICENSE

if exists('g:loaded_sweep_trail')
    finish
endif
let g:loaded_sweep_trail = 1

let s:save_cpo = &cpo
set cpo&vim

command! -bar -range=% SweepTrail <line1>,<line2>call sweep_trail#sweep()
command! -bar SweepTrailEnable call sweep_trail#enable()
command! -bar SweepTrailUnable call sweep_trail#unable()
command! -bar SweepTrailOptionEnable call sweep_trail#option_enable()
command! -bar SweepTrailOptionUnable call sweep_trail#option_unable()

noremap <silent> <Plug>(sweep_trail) :<C-u>SweepTrail<CR>

if !hasmapto('<Plug>(sweep_trail)')
            \ && (!exists('g:sweep_trail_no_default_key_mappings')
            \ || !g:sweep_trail_no_default_key_mappings)
    silent! nmap <unique> <Leader>sw <Plug>(sweep_trail)
endif

augroup plugin-sweep_trail
    autocmd!
    autocmd BufWritePre * call sweep_trail#auto_sweep()
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
