local status_ok, prettier = pcall(require, "prettier")

if not status_ok then
    return
end

prettier.setup {
    bin = "prettierd",
    filetypes = {
        "css",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "json",
        "scss",
        "less"
    }
}

vim.cmd([[
    let g:prettier#autoformat = 0
    let g:prettier#partial_format = 1
]])
