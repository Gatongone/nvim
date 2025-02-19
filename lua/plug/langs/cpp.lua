return
{
    dap =
    {
        {
            name    = "Launch",
            type    = "gdb",
            cwd     = "${workspaceFolder}",
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            request = "launch",
            stopAtBeginningOfMainSubprogram = false,
        },
        {
            name    = "Attach to process",
            type    = "gdb",
            cwd     = '${workspaceFolder}',
            request = "attach",
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            pid = function()
                local name = vim.fn.input('Executable name (filter): ')
                return require("dap.utils").pick_process({ filter = name })
            end,
        }
    }
}
