local succeed, scheme = pcall(require, "theme.scheme." .. nvim.setting.appearance.theme)
local icon            = require("theme.icon")
local filetype        = { "filetype", icon_only = true }
local colors          = scheme.color
local theme           = "auto"

_G.get_line_ending    = function()
    local line_endings = "LF"
    if vim.bo.fileformat == "dos" then
        line_endings = "CRLF"
    elseif vim.bo.fileformat == "mac" then
        line_endings = "CR"
    end
    return line_endings
end

if succeed then
    --- @diagnostic disable-next-line: cast-local-type
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
    sources           = { "nvim_diagnostic" },
    sections          = { "error", "warn", "info", "hint" },
    colored           = true,
    update_in_insert  = false,
    always_visible    = false,
    symbols           =
    {
        error = icon.diagnostics.error .. " ",
        hint  = icon.diagnostics.hint .. " ",
        info  = icon.diagnostics.info .. " ",
        warn  = icon.diagnostics.warning .. " ",
    },
    diagnostics_color =
    {
        error = { bg = "None", fg = colors.red, gui = "bold" },
        warn  = { bg = "None", fg = colors.soft_yellow, gui = "bold" },
        hint  = { bg = "None", fg = colors.soft_green, gui = "bold" },
        info  = { bg = "None", fg = colors.light_blue, gui = "bold" },
    },
}

local diff =
{
    "diff",
    colored        = true,
    always_visible = false,
    source         = function()
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
    diff_color     =
    {
        added    = { bg = "None", fg = colors.red, gui = "bold" },
        modified = { bg = "None", fg = colors.soft_yellow, gui = "bold" },
        removed  = { bg = "None", fg = colors.soft_green, gui = "bold" },
    },
    symbols        =
    {
        added    = icon.git.added .. " ",
        modified = icon.git.modified .. " ",
        removed  = icon.git.removed .. " ",
    },
}

local filename =
{
    'filename',
    file_status     = true,
    newfile_status  = false,
    path            = 0,
    shorting_target = 40,
    symbols         =
    {
        modified = '[+]',
        readonly = '[-]',
        unnamed  = '[*]',
        newfile  = '[#]',
    }
}

local buffers =
{
    'tabs',
    mode = 1,
    tabs_color =
    {
        active   = { bg = "None", fg = colors.foreground, gui = "bold" },
        inactive = { bg = "None", fg = colors.comment },
    },
    symbols =
    {
        modified = icon.kind.event
    },
}

local opts =
{
    options =
    {
        theme                = theme,
        always_show_tabline  = false,
        globalstatus         = true,
        section_separators   = "",
        component_separators = "",
        disabled_filetypes   = { statusline = { "dashboard", "lazy", "alpha" } },
    },
    sections =
    {
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_c = { filename, "require('theme.icon').ui.lsp..' '..string.upper(vim.bo.fileencoding)", "require('theme.icon').kind.field..' '.._G.get_line_ending()" },
        lualine_x = { diff, diagnostics, filetype },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    tabline =
    {
        lualine_a = { buffers },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    }
}

return
{
    "nvim-lualine/lualine.nvim",
    config = function()
        vim.opt.showmode = false
        require("lualine").setup(opts)
    end
}
