local keymap = nvim.keymap.lsp
local M = {}

-- Setup saga
nmap(keymap.open_code_action, ':Lspsaga code_action<CR>')
nmap(keymap.goto_prev_diag,   ':Lspsaga diagnostic_jump_prev<CR>')
nmap(keymap.goto_next_diag,   ':Lspsaga diagnostic_jump_next<CR>')
nmap(keymap.open_error_diag,  ':Lspsaga show_workspace_diagnostics<CR>')
nmap(keymap.open_hover_doc,   ':Lspsaga hover_doc<CR>')
nmap(keymap.goto_ref,         ':Lspsaga finder<CR>')

--- Setup when lsp client was appended
function M.setup_lsp(bmap)
    local opts = { noremap = true, silent = true }
    -- Actions
    bmap('n', keymap.rename_buf, '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    bmap('n', keymap.format_code, '<cmd>lua vim.lsp.buf.format()<CR>', opts)

    -- Goto
    bmap('n', keymap.goto_definition, '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    bmap('n', keymap.goto_declaration, '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    bmap('n', keymap.goto_implementation, '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
end

--- Setup cmp mappings
function M.setup_cmp(cmp)
    return
    {
        [keymap.cmp_prev]            = cmp.mapping(function() cmp.select_prev_item() end),
        [keymap.cmp_next]            = cmp.mapping(function() cmp.select_next_item() end),
        [keymap.cmp_complete]        = cmp.mapping.complete(),
        [keymap.cmp_doc_scroll_up]   = cmp.mapping.scroll_docs(-4),
        [keymap.cmp_doc_scroll_down] = cmp.mapping.scroll_docs(4),
        [keymap.cmp_abort]           = cmp.mapping.abort(),
        [keymap.cmp_confirm]         = cmp.mapping.confirm({ select = true }),
    }
end

return M
