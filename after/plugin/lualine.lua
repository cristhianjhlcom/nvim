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

local mode = {
	"mode",
	fmt = function(str)
		return "" .. str .. ""
	end,
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
  "location",
  padding = 0,
}

local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
    return chars[index]
end

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = "dracula",
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    globalstatus = false,
    disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
    refresh = {
        statusline  = 1000,
        tabline     = 1000,
        winbar      = 1000,
    },
  },
  sections = {
    lualine_a = {mode},
    lualine_b = {branch, diagnostics},
    lualine_c = {},
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
