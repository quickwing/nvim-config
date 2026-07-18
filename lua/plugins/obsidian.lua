return {
    {
        "obsidian-nvim/obsidian.nvim",
        version = "*",
        ft = "markdown",
        cmd = "Obsidian",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        keys = {
            { "<leader>oo", "<cmd>Obsidian quick_switch<CR>", desc = "Open note" },
            { "<leader>os", "<cmd>Obsidian search<CR>", desc = "Search vault" },
            { "<leader>on", "<cmd>Obsidian new<CR>", desc = "New note" },
            { "<leader>ot", "<cmd>Obsidian today<CR>", desc = "Daily note" },
            { "<leader>ob", "<cmd>Obsidian backlinks<CR>", desc = "Backlinks" },
            { "<leader>og", "<cmd>Obsidian tags<CR>", desc = "Tags" },
        },
        opts = {
            legacy_commands = false,
            workspaces = {
                {
                    name = "ObsData",
                    path = "C:/Users/simra/Documents/obsidian/ObsData",
                },
            },
            daily_notes = {
                folder = "Daily",
            },
            -- Name new note files after their title instead of a generated ID
            note_id_func = function(title)
                if title ~= nil then
                    return title
                end
                return tostring(os.date("%Y-%m-%d-%H%M%S"))
            end,
            -- Don't rewrite frontmatter into existing notes on save
            frontmatter = { enabled = false },
            picker = {
                name = "telescope.nvim",
            },
            -- render-markdown.nvim handles in-buffer rendering
            ui = { enable = false },
        },
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = "markdown",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {},
    },
}
