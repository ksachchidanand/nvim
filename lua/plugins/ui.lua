return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function()
            local icons = require("lazyvim.config").icons
            local Ui = require("lazyvim.util.ui")

            vim.o.laststatus = vim.g.lualine_laststatus
            return {
                options = {
                    theme = "auto",
                    globalstatus = true,
                    disabled_filetypes = {
                        statusline = { "dashboard", "alpha" },
                    },
                    section_separators = { left = "", right = "" },
                    component_separators = { left = "|", right = "|" },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch" },
                    lualine_c = {
                        {
                            "diff",
                            symbols = {
                                added = icons.git.added,
                                modified = icons.git.modified,
                                removed = icons.git.removed,
                            },
                        },

                        -- stylua: ignore
                        {
                            function() return require("nvim-navic").get_location() end,
                            cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
                        },
                    },
                    lualine_x = {
                        -- stylua: ignore
                        -- {
                        --     function() return require("noice").api.status.command.get() end,
                        --     cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
                        --     color = Util.fg("Statement"),
                        -- },
                        -- stylua: ignore
                        -- {
                        --     function() return require("noice").api.status.mode.get() end,
                        --     cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
                        --     color = Util.fg("Constant"),
                        -- },
                        -- stylua: ignore
                        {
                            function() return "  " .. require("dap").status() end,
                            cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
                            color = Ui.fg("Debug"),
                        },
                        {
                            require("lazy.status").updates,
                            cond = require("lazy.status").has_updates,
                            color = Ui.fg("Special"),
                        },
                        {
                            "filetype",
                            icon_only = true,
                            separator = "",
                            padding = { left = 1, right = 0 },
                        },
                        {
                            "filename",
                            path = 0,
                            symbols = {
                                modified = "  ",
                                readonly = "",
                                unnamed = "",
                            },
                        },
                        {
                            "diagnostics",
                            symbols = {
                                error = icons.diagnostics.Error,
                                warn = icons.diagnostics.Warn,
                                info = icons.diagnostics.Info,
                                hint = icons.diagnostics.Hint,
                            },
                        },
                    },
                },
                extensions = { "neo-tree", "lazy" },
            }
        end,
    },
}
