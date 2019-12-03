scriptencoding utf-8

" no reload
if !exists('g:loaded_disarrow')
  finish
endif

"user settings invalid
let s:save_cpo = &cpo
set cpo&vim


" script
if exists('g:disarrow#lang')
  if g:disarrow#lang == 'ja'
    let s:warning_msgs = ['はいはい、落ち着いて...',
      \ 'Vimは矢印キーでの移動をすることができます。',
      \ 'ただし、純粋なVim操作を体感するには、',
      \ '''h'', ''j'', ''k'' そして ''l''キーを使うしかないのです。',
      \ 'なぜなら、ホームポジションから手を動かす必要がないので効率的だからです。',
      \ '',
      \ 'ここまで読んだらqキーを押してください。'
      \]
  endif
  " TODO: 多言語対応
else
  let s:warning_msgs = ['OK, OK, OK...',
    \ 'Yes, VIM allows using the cursor keys in order to move around.',
    \ 'However, for a pure VIM experience you should stick to using',
    \ '''h'', ''j'', ''k'' and ''l''.',
    \ 'It''s considered more efficient since you don''t have to move your hand
    \ from the home row when you''re typing.',
    \ '',
    \ 'Press ''q'', when you finish reading.',
    \]
endif

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
