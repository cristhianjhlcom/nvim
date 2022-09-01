local options = {
    signify_sign_add                = "",
    signify_sign_delete             = "",
    signify_sign_delete_first_line  = "‾",
    signify_sign_change             = "~"
}

for key in pairs(options) do
    vim.g[key] = options[key]
end
