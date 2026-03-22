return {
  "anurag3301/nvim-platformio.lua",
  dependencies = {
    { "akinsho/toggleterm.nvim" },
    { "nvim-telescope/telescope.nvim" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "folke/which-key.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
  },
  config = function()
    require("platformio").setup({})
  end,
}
