vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    }
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Git plugins
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",

    { "folke/which-key.nvim", opts = {} },
    { 
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "catppuccin-frappe"
        end
    },
    -- File [E]xplorer
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        keys = {
            { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle Nvim Tree" }
        },
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end
    }
})


-- Tabs/spaces
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4

vim.o.hlsearch = false

vim.wo.relativenumber = true

vim.o.mouse = 'a'

vim.o.clipboard = 'unnamedplus'

vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.wo.signcolumn = 'yes'

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.completeopt = 'menuone,noselect'

vim.o.termguicolors = true

vim.opt.guicursor = "n-v-c-i:block"


-- Keymaps
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', '<C-f>', "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank( { timeout=300 } )
    end,
    group = highlight_group,
    pattern = '*',
})
