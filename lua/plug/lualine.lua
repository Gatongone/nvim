local succeed, scheme = pcall(require, "theme.scheme."..nvim.setting.appearance.theme)
local icon     = require("theme.icon")
local filetype = { "filetype", icon_only = true }
local colors   = scheme.color
local theme    = "auto"
if succeed then
    theme =
    {

        normal =
        {
            a = { bg = "None", fg = colors.foreground, gui = "bold" },
            b = { bg = "None", fg = colors.foreground },
            c = { bg = "None", fg = colors.foreground },
        },
        insert =
        {
            a = { bg = "None", fg = colors.light_blue, gui = "bold" },
            b = { bg = "None", fg = colors.foreground },
            c = { bg = "None", fg = colors.foreground },
        },
        visual =
        {
            a = { bg = "None", fg = colors.soft_yellow, gui = "bold" },
            b = { bg = "None", fg = colors.foreground },
            c = { bg = "None", fg = colors.foreground },
        },
        replace =
        {
            a = { bg = "None", fg = colors.pink, gui = "bold" },
            b = { bg = "None", fg = colors.foreground },
            c = { bg = "None", fg = colors.foreground },
        },
        command =
        {
            a = { bg = "None", fg = colors.soft_green, gui = "bold" },
            b = { bg = "None", fg = colors.foreground },
            c = { bg = "None", fg = colors.foreground },
        },
        inactive =
        {
            a = { bg = "None", fg = colors.red, gui = "bold" },
            b = { bg = "None", fg = colors.foreground },
            c = { bg = "None", fg = colors.foreground },
        },
        terminal =
        {
            a = { bg = "None", fg = colors.orange, gui = "bold" },
            b = { bg = "None", fg = colors.foreground },
            c = { bg = "None", fg = colors.foreground },
        },
    }
end
local diagnostics =
{
    "diagnostics",
    sources  = { "nvim_diagnostic" },
    sections = { "error", "warn", "info", "hint" },
    colored          = true,
    update_in_insert = false,
    always_visible   = false,
    symbols  =
    {
      error = icon.diagnostics.error .. " ",
      hint  = icon.diagnostics.hint .. " ",
      info  = icon.diagnostics.info .. " ",
      warn  = icon.diagnostics.warning .. " ",
    },
}

local diff =
{
    "diff",
    colored        = true,
    always_visible = false,
    source = function()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns == nil then
            return
        end
        return
        {
            added    = gitsigns.added,
            modified = gitsigns.changed,
            removed  = gitsigns.removed,
        }
    end,
    symbols =
    {
        added    = icon.git.added .. " ",
        modified = icon.git.modified .. " ",
        removed  = icon.git.removed .. " ",
    },
}

return
{
    options =
    {
      theme = theme,
      globalstatus = true,
      section_separators = "",
      component_separators = "",
      disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
    },
    sections =
    {
      lualine_a = { "mode" },
      lualine_b = {},
      lualine_c = { "branch", "filename"},
      lualine_x = { diff, diagnostics, filetype },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
}
