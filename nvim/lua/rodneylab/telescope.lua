local telescope = require('telescope')

telescope.setup { defaults = {
    file_ignore_patterns = { "node_modules", "target"}
}}

telescope.load_extension('fzf')
