return {
    -- Colorscheme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = { flavour = "mocha" },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin")
        end,
    },
    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                theme = "catppuccin",
                component_separators = { left = "|", right = "|" },
                section_separators = {},
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { { "filename", path = 1 } },
                lualine_x = {
                    {
                        function()
                            local clients = vim.lsp.get_clients({ bufnr = 0 })
                            if #clients == 0 then return "" end
                            local names = {}
                            for _, client in ipairs(clients) do
                                table.insert(names, client.name)
                            end
                            return table.concat(names, ", ")
                        end,
                    },
                    "filetype",
                },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        },
    },
    -- File explorer
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "<leader>e", "<cmd>Oil<CR>", desc = "File explorer" },
            { "-", "<cmd>Oil<CR>", desc = "File explorer" },
        },
        opts = {
            view_options = { show_hidden = true },
            keymaps = {
                ["q"] = "actions.close",
            },
        },
    },
}
