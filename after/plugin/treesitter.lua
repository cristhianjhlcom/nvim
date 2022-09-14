local status_ok, configs = pcall(require, "nvim-treesitter.configs")

if not status_ok then
    return
end

configs.setup {
    ensure_installed = {
        "javascript",
        "typescript",
        "lua",
        "python",
        "php",
        "css",
        "html",
        "json",
    },
    highlight = {enable = true},
    indent = {enable = true},
    incremenetal_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
        },
    },
}
