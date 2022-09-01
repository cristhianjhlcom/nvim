local status_ok, configs = pcall(require, "nvim-treesitter.configs")

if not status_ok then
    return
end

configs.setup {
    ensure_installed = {"javascript"},
    highlight = {enable = true},
    indent = {enable = true},
    incremenetal_selection = {
        enable = true,
        keymaps = {},
    },
}
