local options = {
    php_cs_fixer_level = "symfony",
    php_cs_fixer_config = "default",
    php_cs_fixer_rules = "@PSR2",
    php_cs_fixer_cache = ".php_cs.cache",
    php_cs_fixer_config_file = ".php_cs",
    php_cs_fixer_allow_risky = "yes",
    php_cs_fixer_php_path = "php",
    php_cs_fixer_enable_default_mapping = 1,
    php_cs_fixer_dry_run = 0,
    php_cs_fixer_verbose = 0,
    php_namespace_sort_after_insert = 1,
    ale_lint_on_save = 1,
    ale_lint_on_text_changed = 0,
}

vim.cmd([[
    let g:ale_linters = {
    \   'php': ['php'],
    \}
]])

for key in pairs(options) do
    vim.g[key] = options[key]
end

-- vim.api.nvim_create_autocmd("BufWritePost", {
--     group = vim.api.nvim_create_augroup("PHPCSFixer", { clear = true }),
--     pattern = "*.php",
--     command = "call PhpCsFixerFixFile()",
-- })

local IPHPInsertUse = function()
    vim.cmd("call PhpInsertUse()")
    vim.cmd("call feedkeys('a', 'n')")
end

local IPHPExpandClass = function()
    vim.cmd("call PhpExpandClass()")
    vim.cmd("call feedkeys('a', 'n')")
end

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("PHPNamespace", { clear = true }),
    pattern = "*.php",
    callback = function()
        vim.keymap.set("i", "<Leader>pnu <ESC>", "<CMD>call IPHPInsertUse()<CR>", { silent = true })
        vim.keymap.set("n", "<Leader>pnu", "<CMD>call IPHPInsertUse()<CR>", { silent = true })
        vim.keymap.set("i", "<Leader>pne <ESC>", "<CMD>call IPHPExpandClass()<CR>", { silent = true })
        vim.keymap.set("n", "<Leader>pne", "<CMD>call IPHPExpandClass()<CR>", { silent = true })
    end,
})
