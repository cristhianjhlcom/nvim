local status_ok, configs = pcall(require, "nvim-treesitter.configs")

if not status_ok then
    return
end

configs.setup {
    ensure_installed = {
        "tsx",
        "javascript",
        "typescript",
        "lua",
        "python",
        "php",
        "css",
        "html",
        "json",
        "rust",
    },
    auto_install = true,
    sync_install = false,
    highlight = {enable = true, disable = {}},
    indent = {enable = true, disable = {}},
    ignore_install = {"phpdoc"},
    autotag = {enable = true},
    	playground = {
		enable = true,
		disable = {},
		updatetime = 25,            -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false,    -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
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
