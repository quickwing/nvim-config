return {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    -- API key is read from the OPENAI_API_KEY environment variable
    opts = {
        interactions = {
            chat = {
                adapter = "openai",
            },
            inline = {
                adapter = "openai",
            },
        },
    },
    keys = {
        { "<leader>ai", ":CodeCompanion ", mode = { "n", "v" }, desc = "AI inline prompt" },
        { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "AI chat" },
        { "<leader>aa", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "AI actions" },
    },
}
