scriptencoding utf-8

" no reload
if exists('g:loaded_disarrow')
  finish
endif
let g:loaded_disarrow = 1
let g:disarrow#lang_en = 'en'

"user settings invalid
let s:save_cpo = &cpo
set cpo&vim

" script
noremap <silent> <Plug>(disarrow#display_warn) :<C-U>call disarrow#display_warn()<CR>
inoremap <silent> <Plug>(disarrow#display_warn) <ESC>:<C-U>call disarrow#display_warn()<CR>


map <UP> <Plug>(disarrow#display_warn)
map <DOWN> <Plug>(disarrow#display_warn)
map <LEFT> <Plug>(disarrow#display_warn)
map <RIGHT> <Plug>(disarrow#display_warn)

imap <UP> <Plug>(disarrow#display_warn)
imap <DOWN> <Plug>(disarrow#display_warn)
imap <LEFT> <Plug>(disarrow#display_warn)
imap <RIGHT> <Plug>(disarrow#display_warn)

" user setting valid
let &cpo = s:save_cpo
unlet s:save_cpo
