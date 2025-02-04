return
{
    keys =
    {
        {
            "<leader>o",
            "<cmd>ClangdSwitchSourceHeader<cr>",
            desc = "Switch Source/Header (C/C++)"
        },
    },
    root_dir = function(fname)
        local lsp = require("lspconfig.util")
        return lsp.root_pattern("Makefile", "configure.ac", "configure.in", "config.h.in", "meson.build", "meson_options.txt","build.ninja")(fname)
            or lsp.root_pattern("compile_commands.json", "compile_flags.txt")(fname)
            or lsp.find_git_ancestor(fname)
    end,
    cmd =
    {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "-j4",
        "--fallback-style=llvm",
    },
    init_options =
    {
        usePlaceholders = true,
        completeUnimported = true,
        clangdFileStatus = true,
    }
}
