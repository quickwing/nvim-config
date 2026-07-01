return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        -- Use zig as the C compiler on Windows
        require("nvim-treesitter.install").compilers = { "zig" }

        require("nvim-treesitter").setup({
            ensure_installed = {
                "python",
                "lua",
                "vim",
                "vimdoc",
                "json",
                "yaml",
                "toml",
                "markdown",
                "markdown_inline",
            },
        })
    end,
}
