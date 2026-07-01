return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = { "pyright", "lua_ls" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- LSP keymaps (only when server attaches)
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    local builtin = require("telescope.builtin")
                    map("gd", builtin.lsp_definitions, "Go to definition")
                    map("gD", vim.lsp.buf.declaration, "Go to declaration")
                    map("gr", builtin.lsp_references, "Show references")
                    map("gi", builtin.lsp_implementations, "Go to implementation")
                    map("K", vim.lsp.buf.hover, "Hover documentation")
                    map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
                    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
                    map("<leader>D", vim.lsp.buf.type_definition, "Type definition")
                end,
            })

            -- Diagnostic display settings
            vim.diagnostic.config({
                virtual_text = { spacing = 4, prefix = "●" },
                signs = true,
                underline = true,
                update_in_insert = false,
                float = { border = "rounded", source = true },
            })

            -- Pyright (Python)
            lspconfig.pyright.setup({
                capabilities = capabilities,
                on_init = function(client)
                    -- Auto-detect uv .venv on Windows
                    local venv = vim.fn.getcwd() .. "/.venv"
                    if vim.fn.isdirectory(venv) == 1 then
                        local python = venv .. "/Scripts/python.exe"
                        if vim.fn.filereadable(python) == 1 then
                            client.config.settings.python = client.config.settings.python or {}
                            client.config.settings.python.pythonPath = python
                        end
                    end
                end,
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "basic",
                            autoImportCompletions = true,
                            diagnosticMode = "workspace",
                        },
                    },
                    pyright = {
                        disableOrganizeImports = true, -- ruff handles this
                    },
                },
            })

            -- lua_ls (for editing Neovim config)
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        workspace = {
                            checkThirdParty = false,
                            library = { vim.env.VIMRUNTIME },
                        },
                        diagnostics = { globals = { "vim" } },
                        telemetry = { enable = false },
                    },
                },
            })
        end,
    },
}
