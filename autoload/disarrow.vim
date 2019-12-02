scriptencoding utf-8

" no reload
if !exists('g:loaded_disarrow')
  finish
endif

"user settings invalid
let s:save_cpo = &cpo
set cpo&vim


" script
let s:warning_msgs = ['OK, OK, OK...',
  \ 'Yes, VIM allows using the cursor keys in order to move around.',
  \ 'However, for a pure VIM experience you should stick to using',
  \ '''h'', ''j'', ''k'' and ''l''.',
  \ 'It''s considered more efficient since you don''t have to move your hand
  \ from the home row when you''re typing.',
  \ '',
  \ 'Press ''q'''
  \]

function! disarrow#display_warn() abort
  let buf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(buf, 0, -1, v:true, s:warning_msgs)
  let opts = {'relative': 'cursor', 'width': 70, 'height': 10,
        \'col': 1, 'row': 1, 'style': 'minimal'}
  let win = nvim_open_win(buf, 0, opts)

  " optional: change highlight, otherwise Pmenu is used
  while 1
    call nvim_win_set_option(win, 'winhl', 'Normal:MyHighlight')
    redraw!
    if getchar() ==# 113
      break
    endif
  endwhile

  call nvim_win_close(win, v:true)
endfunction


" user setting valid
let &cpo = s:save_cpo
unlet s:save_cpo
