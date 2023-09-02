local function commit()
  local on_confirm = function(input)
    if input == "" or input == nil then
      return
    end

    vim.cmd('Git add -A')
    vim.cmd('Git commit -m "' .. input .. '"')
  end

  vim.ui.input({
    prompt = "Commit message: "
  }, on_confirm)
end

return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gd', '<cmd>Git diff<CR>')

    vim.keymap.set('n', '<leader>gp', '<cmd>Git push<CR>')
    vim.keymap.set('n', '<leader>gs', '<cmd>Git status<CR>')
    vim.keymap.set('n', '<leader>ga', '<cmd>Git add -A<CR>')

    vim.keymap.set('n', '<leader>gm', commit, { desc = "Commit all changed files in current directory" })
  end
}
