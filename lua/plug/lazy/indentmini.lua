return
{
    'nvimdev/indentmini.nvim',
    event = 'BufEnter',
    config = function()
        require('indentmini').setup()
        vim.cmd.highlight('default link IndentLine Comment')
        vim.cmd.highlight('default link IndentLineCurrent Title')
    end,
}
