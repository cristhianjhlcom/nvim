-- Example config in Lua
vim.g.monokaipro_filter = "classic"
vim.g.monokaipro_italic_functions = false
vim.g.monokaipro_sidebars = { "vista_kind", "packer" }
vim.g.monokaipro_flat_term = true
vim.g.monokaipro_italic_keywords = false
vim.g.monokaipro_transparent = true

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.monokaipro_colors = {
    bg = "#0B090A",
    green = "#a6e22b",
    -- green = "#5DD39E",
    orange = "#ff8906",
    hint = "orange",
    error = "#ff0000"
}

vim.g.cristhianjhl_colorscheme = "monokaipro"
-- vim.cmd("let g:molokai_original = 1")
-- vim.cmd("let g:rehash256 = 1")

vim.opt.background = "dark"
vim.cmd("colorscheme " .. vim.g.cristhianjhl_colorscheme)
