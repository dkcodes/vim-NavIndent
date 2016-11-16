fun! NavIndent(direction, depth)
    let l:spc = indent(".")
    let l:tbst = &tabstop
    if (a:direction == -1)
        if (a:depth == +1)
            call search('^\s\{' . (spc + tbst) . '}\%<' . line('.') . 'l\S', 'be')
        elseif (a:depth == -1)
            call search('^\s\{' . (spc - tbst) . '}\%<' . line('.') . 'l\S', 'be')
        else
            call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')
        endif
    else
        if (a:depth == +1)
            call search('^\s\{' . (spc + tbst) . '}\%>' . line('.') . 'l\S', 'e')
        elseif (a:depth == -1)
            call search('^\s\{' . (spc - tbst) . '}\%>' . line('.') . 'l\S', 'e')
        else
            call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')
        endif
    endif
endfun

nnoremap <silent> <Plug>(NavIndentPreviousLesser) :call NavIndent(-1, -1)<CR>
nnoremap <silent> <Plug>(NavIndentPreviousGreater) :call NavIndent(-1, 1)<CR>
nnoremap <silent> <Plug>(NavIndentPreviousEqual) :call NavIndent(-1, 0)<CR>
vnoremap <silent> <Plug>(NavIndentPreviousLesser) :call NavIndent(-1, -1)<CR>
vnoremap <silent> <Plug>(NavIndentPreviousGreater) :call NavIndent(-1, 1)<CR>
vnoremap <silent> <Plug>(NavIndentPreviousEqual) :call NavIndent(-1, 0)<CR>

nnoremap <silent> <Plug>(NavIndentNextLesser) :call NavIndent(1, -1)<CR>
nnoremap <silent> <Plug>(NavIndentNextGreater) :call NavIndent(1, 1)<CR>
nnoremap <silent> <Plug>(NavIndentNextEqual) :call NavIndent(1, 0)<CR>
vnoremap <silent> <Plug>(NavIndentNextLesser) :call NavIndent(1, -1)<CR>
vnoremap <silent> <Plug>(NavIndentNextGreater) :call NavIndent(1, 1)<CR>
vnoremap <silent> <Plug>(NavIndentNextEqual) :call NavIndent(1, 0)<CR>

" map <leader>k <Plug>(NavIndentPreviousLesser)
" map <leader>j <Plug>(NavIndentNextGreater)
" map <m-m> <Plug>(NavIndentNextEqual)
" map <m-,> <Plug>(NavIndentPreviousEqual)

