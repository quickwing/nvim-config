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
            opts = {
                -- Must stay ASCII. The default "%A, %d %B %Y" goes through Windows
                -- strftime, which returns localised month names in the system ANSI
                -- codepage (cp1252), not UTF-8 -- "août" arrives as a bare 0xFB byte.
                -- That makes the request body invalid UTF-8 and OpenAI rejects it
                -- with "400: There was an error parsing the body".
                date_format = "%Y-%m-%d",
            },
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
