return {
    -- Git signs
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns
                local map = function(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
                end
                map("n", "]h", gs.next_hunk, "Next git hunk")
                map("n", "[h", gs.prev_hunk, "Previous git hunk")
                map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
                map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
            end,
        },
    },
    -- Autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            local autopairs = require("nvim-autopairs")
            autopairs.setup({})

            -- Integrate with nvim-cmp
            local cmp_ok, cmp = pcall(require, "cmp")
            if cmp_ok then
                local cmp_autopairs = require("nvim-autopairs.completion.cmp")
                cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
            end
        end,
    },
    -- Comments
    {
        "numToStr/Comment.nvim",
        keys = {
            { "gcc", mode = "n", desc = "Toggle line comment" },
            { "gc", mode = { "n", "v" }, desc = "Toggle comment" },
        },
        opts = {},
    },
    -- Which-key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            wk.add({
                { "<leader>b", group = "Buffer" },
                { "<leader>c", group = "Code" },
                { "<leader>f", group = "Find" },
                { "<leader>g", group = "Git" },
                { "<leader>r", group = "Rename" },
            })
        end,
    },
}
