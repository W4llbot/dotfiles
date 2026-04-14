return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    keys = {
        { "<leader>tm", "<cmd>Markview Toggle<cr>", desc = "Toggles markdown preview globally" },
        { "<leader>ts", "<cmd>Markview splitToggle<cr>", desc = "Toggles markdown splitview" },
        "saghen/blink.cmp",
        "nvim-tree/nvim-web-devicons"
   },
    opts = {
        preview = {
            icon_provider = "devicons", -- "mini" or "devicons"
        }
    }
};
