    " Map <leader> space space to open terminal and call 'aider'
    nnoremap <leader><Space><Space> :call OpenAider()<CR>

    function! OpenAider()
        " Create a new buffer for the terminal
        let l:buf = nvim_create_buf(v:false, v:true)
        " Calculate the size and position of the floating window
        let l:width = 80
        let l:height = 24
        let l:row = (nvim_win_get_height(0) - l:height) / 2
        let l:col = (nvim_win_get_width(0) - l:width) / 2
        " Create a new floating window for the terminal
        let l:win = nvim_open_win(l:buf, v:true, {'relative': 'editor', 'width': l:width, 'height': l:height, 'row': l:row, 'col': l:col})
        " Run 'aider' in the terminal
        call termopen('aider', {'on_exit': function('s:OnExit')})
        " Make the terminal window active
        call nvim_set_current_win(l:win)
    endfunction

    function! s:OnExit(job_id, data, event)
        " Close the terminal window when 'aider' exits
        call nvim_win_close(0, v:true)
    endfunction