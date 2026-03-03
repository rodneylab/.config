if exists("g:neovide")
lua << END
require("themery").setThemeByName("Rust", false)
END
endif

" add vertical rules at 100 columns
set colorcolumn=100

autocmd BufRead *.rs :setlocal tags=rusty-tags,./rusty-tags.vi,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

set guifont=Iosevka\ Custom,JetBrains\ Mono,IosevkaTerm\ NFM:h13.5:#e-subpixelantialias
set linespace=8
