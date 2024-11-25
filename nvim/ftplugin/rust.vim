" add vertical rules at 80 columns
set colorcolumn=100

autocmd BufRead *.rs :setlocal tags=rusty-tags,./rusty-tags.vi,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!
