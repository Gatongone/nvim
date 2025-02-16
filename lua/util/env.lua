--- @class nvim.env Wrokspace environment
--- @field cli_nf string Command line string of creating new file.
--- @field cli_nd string Command line string of creating new directory
--- @field cli_cpf string Command line string of copying file
--- @field cli_cpd string Command line string of copying directory
--- @field cli_rmf string Command line string of removing file
--- @field cli_rmd string Command line string of removing directory
--- @field cli_mv string Command line string of moving item
--- @field cli_ls string Command line string of listing files of current directory
--- @field cli_es string Command line string of escape character
--- @field cli_sp string Command line string of command separator character
--- @field home string Command line string of home path
--- @field root string Command line string of root path
--- @field shell string Current shell
--- @field os string Current operation system
--- @field get_line_ending function Get current file line ending type

nvim.env = { }

local shell = vim.o.shell:lower()
shell = vim.fn.fnamemodify(shell, ':t'):gsub('%.exe$', '')

if shell:match('pwsh') then
    nvim.env.cli_nf  = "New-Item -Path"
    nvim.env.cli_nd  = "New-Item -ItemType Directory"
    nvim.env.cli_cpf = "Copy-Item"
    nvim.env.cli_cpd = "Copy-Item -Recurse"
    nvim.env.cli_rmf = "Remove-Item"
    nvim.env.cli_rmd = "Remove-Item -Recurse"
    nvim.env.cli_mv  = "Move-Item"
    nvim.env.cli_ls  = "Get-ChildItem"
    nvim.env.cli_es  = "`"
    nvim.env.cli_sp  = ";"
    nvim.env.dir_sp  = "\\"
    nvim.env.home    = "~"
    nvim.env.root    = "\\"
elseif shell:match('cmd') then
    nvim.env.cli_nf  = "echo.>"
    nvim.env.cli_nd  = "mkdir"
    nvim.env.cli_cpf = "copy"
    nvim.env.cli_cpd = "xcopy /e /i"
    nvim.env.cli_rmf = "del"
    nvim.env.cli_rmd = "rmdir /s /q"
    nvim.env.cli_mv  = "move"
    nvim.env.cli_ls  = "dir"
    nvim.env.cli_es  = "^"
    nvim.env.cli_sp  = "&&"
    nvim.env.dir_sp  = "\\"
    nvim.env.home    = "%USERPROFILE%"
    nvim.env.root    = "\\"
else
    nvim.env.cli_nf  = "touch"
    nvim.env.cli_nd  = "mkdir"
    nvim.env.cli_cpf = "cp"
    nvim.env.cli_cpd = "cp -r"
    nvim.env.cli_rmf = "rm"
    nvim.env.cli_rmd = "rm -rf"
    nvim.env.cli_mv  = "mv"
    nvim.env.cli_ls  = "ls"
    nvim.env.cli_es  = "\\"
    nvim.env.cli_sp  = ";"
    nvim.env.dir_sp  = "/"
    nvim.env.home    = "~"
    nvim.env.root    = "/"
end

nvim.env.shell = shell
nvim.env.os    = vim.loop.os_uname().sysname
nvim.env.get_line_ending = function()
    local line_endings = "LF"
    if vim.bo.fileformat == "dos" then
        line_endings = "CRLF"
    elseif vim.bo.fileformat == "mac" then
        line_endings = "CR"
    end

    return line_endings
end
