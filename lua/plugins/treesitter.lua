return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        local ensure_installed = {
            "python",
            "lua",
            "vim",
            "vimdoc",
            "json",
            "yaml",
            "toml",
            "markdown",
            "markdown_inline",
        }

        local ts = require("nvim-treesitter")
        ts.setup({})

        -- The rewritten nvim-treesitter no longer installs from setup(); do it here.
        local installed = ts.get_installed("parsers")
        local missing = vim.tbl_filter(function(lang)
            return not vim.list_contains(installed, lang)
        end, ensure_installed)
        if #missing > 0 then
            ts.install(missing)
        end

        -- ...and no longer enables highlighting itself.
        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
            callback = function(event)
                local lang = vim.treesitter.language.get_lang(vim.bo[event.buf].filetype)
                if lang and vim.list_contains(ts.get_installed("parsers"), lang) then
                    pcall(vim.treesitter.start, event.buf, lang)
                end
            end,
        })
    end,
}
