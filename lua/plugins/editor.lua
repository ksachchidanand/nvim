return {
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            -- stylua: ignore
            {
                "<leader><space>",
                "<cmd>Telescope buffers show_all_buffers=true<cr>",
                desc = "Switch Buffer",
            },
        },
    },
    {
        "telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end,
        },
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        theme = "catppuccin",
        version = false,
        keys = {
            -- { "<leader>e", "<cmd>Telescope file_browser<cr>" },
            {
                "<leader>e",
                "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
            },
        },
    },
}
