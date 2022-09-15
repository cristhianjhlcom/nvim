-- comment
local status_ok, lualine = pcall(require, "lualine")

if not status_ok then
    return
end

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local diagnostics = {
    "diagnostics",
    sources = {"nvim_diagnostic"},
    sections = {"error", "warn"},
    symbols = {error = " ", warn = " "},
    colored = false,
    always_visible = true,
}

local diff = {
    "diff",
    colored = false,
    symbols =  {added = " ", modified = " ", removed = " "},
    cond = hide_in_width,
}

local filename = {
    "filename",
    path = 1,
}

local location = {
  "location",
  padding = 0,
}

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

print("before lualine setup")

lualine.setup {
  options = {
    icons_enabled = true,
    theme = "dracula",
    component_separators = {left = "", right = ""},
    section_separators = { left = "", right = ""},
    globalstatus = false,
    disabled_filetypes = {},
    always_divide_middle = true,
    refresh = {
        statusline  = 1000,
        tabline     = 1000,
        winbar      = 1000,
    },
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch"},
    lualine_c = {diagnostics},
    lualine_x = {diff, filename, filetype},
    lualine_y = {location},
    lualine_z = {"progress"},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
