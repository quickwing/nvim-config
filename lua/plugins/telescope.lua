return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-tree/nvim-web-devicons", opts = {} },
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
        { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
        { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
        { "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Document symbols" },
        { "<leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
        { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
        { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Search in current file" },
    },
    opts = {
        defaults = {
            file_ignore_patterns = { "node_modules", ".git/", "__pycache__", "%.pyc", ".venv" },
        },
    },
}
