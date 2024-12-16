let b:next_toplevel='\v%$\|^(class\|def)>'
let b:prev_toplevel='\v^(class\|def)>'
let b:next_endtoplevel='\v%$\|\S.*\n+(def\|class)'
let b:prev_endtoplevel='\v\S.*\n+(def\|class)'
let b:next='\v%$\|^\s*(class\|def)>'
let b:prev='\v^\s*(class\|def)>'
let b:next_end='\v\S\n*(%$\|^(\s*\n*)*(class\|def)\|^\S)'
let b:prev_end='\v\S\n*(^(\s*\n*)*(class\|def)\|^\S)'

if !exists('g:no_plugin_maps') && !exists('g:no_ruby_maps')
    execute "nnoremap <silent> <buffer> ]] :<C-U>call <SID>Ruby_jump('n', '". b:next_toplevel."', 'W', v:count1)<cr>"
    execute "nnoremap <silent> <buffer> [[ :<C-U>call <SID>Ruby_jump('n', '". b:prev_toplevel."', 'Wb', v:count1)<cr>"
    execute "nnoremap <silent> <buffer> ][ :<C-U>call <SID>Ruby_jump('n', '". b:next_endtoplevel."', 'W', v:count1, 0)<cr>"
    execute "nnoremap <silent> <buffer> [] :<C-U>call <SID>Ruby_jump('n', '". b:prev_endtoplevel."', 'Wb', v:count1, 0)<cr>"
    execute "nnoremap <silent> <buffer> ]m :<C-U>call <SID>Ruby_jump('n', '". b:next."', 'W', v:count1)<cr>"
    execute "nnoremap <silent> <buffer> [m :<C-U>call <SID>Ruby_jump('n', '". b:prev."', 'Wb', v:count1)<cr>"
    execute "nnoremap <silent> <buffer> ]M :<C-U>call <SID>Ruby_jump('n', '". b:next_end."', 'W', v:count1, 0)<cr>"
    execute "nnoremap <silent> <buffer> [M :<C-U>call <SID>Ruby_jump('n', '". b:prev_end."', 'Wb', v:count1, 0)<cr>"

    execute "onoremap <silent> <buffer> ]] :call <SID>Ruby_jump('o', '". b:next_toplevel."', 'W', v:count1)<cr>"
    execute "onoremap <silent> <buffer> [[ :call <SID>Ruby_jump('o', '". b:prev_toplevel."', 'Wb', v:count1)<cr>"
    execute "onoremap <silent> <buffer> ][ :call <SID>Ruby_jump('o', '". b:next_endtoplevel."', 'W', v:count1, 0)<cr>"
    execute "onoremap <silent> <buffer> [] :call <SID>Ruby_jump('o', '". b:prev_endtoplevel."', 'Wb', v:count1, 0)<cr>"
    execute "onoremap <silent> <buffer> ]m :call <SID>Ruby_jump('o', '". b:next."', 'W', v:count1)<cr>"
    execute "onoremap <silent> <buffer> [m :call <SID>Ruby_jump('o', '". b:prev."', 'Wb', v:count1)<cr>"
    execute "onoremap <silent> <buffer> ]M :call <SID>Ruby_jump('o', '". b:next_end."', 'W', v:count1, 0)<cr>"
    execute "onoremap <silent> <buffer> [M :call <SID>Ruby_jump('o', '". b:prev_end."', 'Wb', v:count1, 0)<cr>"

    execute "xnoremap <silent> <buffer> ]] :call <SID>Ruby_jump('x', '". b:next_toplevel."', 'W', v:count1)<cr>"
    execute "xnoremap <silent> <buffer> [[ :call <SID>Ruby_jump('x', '". b:prev_toplevel."', 'Wb', v:count1)<cr>"
    execute "xnoremap <silent> <buffer> ][ :call <SID>Ruby_jump('x', '". b:next_endtoplevel."', 'W', v:count1, 0)<cr>"
    execute "xnoremap <silent> <buffer> [] :call <SID>Ruby_jump('x', '". b:prev_endtoplevel."', 'Wb', v:count1, 0)<cr>"
    execute "xnoremap <silent> <buffer> ]m :call <SID>Ruby_jump('x', '". b:next."', 'W', v:count1)<cr>"
    execute "xnoremap <silent> <buffer> [m :call <SID>Ruby_jump('x', '". b:prev."', 'Wb', v:count1)<cr>"
    execute "xnoremap <silent> <buffer> ]M :call <SID>Ruby_jump('x', '". b:next_end."', 'W', v:count1, 0)<cr>"
    execute "xnoremap <silent> <buffer> [M :call <SID>Ruby_jump('x', '". b:prev_end."', 'Wb', v:count1, 0)<cr>"
endif

if !exists('*<SID>Ruby_jump')
  fun! <SID>Ruby_jump(mode, motion, flags, count, ...) range
      let l:startofline = (a:0 >= 1) ? a:1 : 1

      if a:mode == 'x'
          normal! gv
      endif

      if l:startofline == 1
          normal! 0
      endif

      let cnt = a:count
      mark '
      while cnt > 0
          call search(a:motion, a:flags)
          let cnt = cnt - 1
      endwhile

      if l:startofline == 1
          normal! ^
      endif
  endfun
endif