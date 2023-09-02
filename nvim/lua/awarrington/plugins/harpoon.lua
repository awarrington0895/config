return {
  'ThePrimeagen/harpoon',
  config = function()
    local mark = require('harpoon.mark')
    local ui = require('harpoon.ui')

    vim.keymap.set('n', '<leader>h', mark.toggle_file, { desc = 'Toggle mark file for [h]arpoon' })
    vim.keymap.set('n', '<leader>H', ui.toggle_quick_menu, { desc = 'View marked harpoon files' })
    vim.keymap.set('n', '<leader>hd', mark.clear_all, { desc = 'Remove all marked files' })

    vim.keymap.set(
      'n',
      '<A-j>',
      function()
        ui.nav_file(1)
      end
      ,
      { desc = 'Go to first marked file' }
    )

    vim.keymap.set(
      'n',
      '<A-k>',
      function()
        ui.nav_file(2)
      end
      ,
      { desc = 'Go to second marked file' }
    )

    vim.keymap.set(
      'n',
      '<A-l>',
      function()
        ui.nav_file(3)
      end
      ,
      { desc = 'Go to third marked file' }
    )

    vim.keymap.set(
      'n',
      '<A-;>',
      function()
        ui.nav_file(4)
      end
      ,
      { desc = 'Go to fourth marked file' }
    )

  end
}
