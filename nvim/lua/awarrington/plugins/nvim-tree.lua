return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  keys = {
    { id = "nvim-toggle", "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle Nvim Tree" }
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      actions = {
        open_file = {
          quit_on_open = true
        }
      }
    }
  end,
}
