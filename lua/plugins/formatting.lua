return {
    -- Formatting
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        keys = {
            {
                "<leader>cf",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                desc = "Format buffer",
            },
        },
        opts = {
            formatters_by_ft = {
                python = { "ruff_format", "ruff_organize_imports" },
            },
            format_on_save = {
                timeout_ms = 3000,
                lsp_fallback = true,
            },
        },
    },
    -- Linting
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lint = require("lint")
            lint.linters_by_ft = {
                python = { "ruff" },
            }

            vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
                group = vim.api.nvim_create_augroup("nvim_lint", { clear = true }),
                callback = function()
                    lint.try_lint()
                end,
            })
        end,
    },
}
