vim.api.nvim_create_autocmd({ "TermOpen" },
{
	pattern = { "*" },
	callback = function()
        vim.api.nvim_input("<CR>")
	end,
})
