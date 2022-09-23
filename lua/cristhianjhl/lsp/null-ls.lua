local null_ls_status_ok, null_ls = pcall(require, "null_ls")

if not null_ls_status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = false,
    sources = {
        formatting.prettier.with({
            extra_args = {
                "--tab-width=4",
                "--trailing-comma='all'",
                "--no-bracket-spacing",
                "--arrow-parans='always'",
            }
        }),
        formatting.black.with({
            extra_args = {
                "--fast"
            }
        }),
        formatting.stylua,
        formatting.blade_formatter,
        formatting.eslint,
        formatting.phpcsfixer,
        diagnostics.flake8,
        diagnostics.eslint_d,
        diagnostics.phpcs,
    },
})
