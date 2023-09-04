return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = 'make',
      config = function()
        -- [[ Configure Telescope ]]
        -- See `:help telescope` and `:help telescope.setup()`
        require('telescope').setup {
          defaults = {
            mappings = {
              i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
              },
            },
          },
        }

        -- Enable telescope fzf native, if installed
        pcall(require('telescope').load_extension, 'fzf')

        local telescope = require('telescope.builtin')

        local function nmap(lhs, rhs, desc)
          vim.keymap.set('n', lhs, rhs, desc)
        end

        -- See `:help telescope.builtin`
        nmap('<leader>?', telescope.oldfiles,
          { desc = '[?] Find recently opened files' })
        nmap('<leader>/', function()
          -- You can pass additional configuration to telescope to change theme, layout, etc.
          telescope.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
          })
        end, { desc = '[/] Fuzzily search in current buffer' })

        nmap('<leader>ff', telescope.git_files, { desc = 'Search [G]it [F]iles' })
        nmap('<leader>sf', telescope.find_files, { desc = '[S]earch [F]iles' })
        nmap('<leader>sh', telescope.help_tags, { desc = '[S]earch [H]elp' })
        nmap('<leader>sw', telescope.grep_string, { desc = '[S]earch current [W]ord' })
        nmap('<leader>sg', telescope.live_grep, { desc = '[S]earch by [G]rep' })
        nmap('<leader>sd', telescope.diagnostics, { desc = '[S]earch [D]iagnostics' })
      end,
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
}
