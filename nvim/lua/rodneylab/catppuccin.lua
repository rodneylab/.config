require("catppuccin").setup {
    flavour = "mocha",
    term_colors = true,
    transparent_background = true,
    color_overrides = {
        mocha = {
            base = "#000000",
        },
    },
    integrations = {
        nvimtree = true,
    },
    highlight_overrides = {
        mocha = function(mocha)
            return {
                TabLineSel = { bg = mocha.pink },
                NvimTreeNormal = { bg = mocha.none },
                CmpBorder = { fg = mocha.surface2 },
            }
        end,
    },
}
