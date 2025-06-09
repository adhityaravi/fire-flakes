require('goose').setup({
  prefered_picker = 'telescope',
  default_global_keymaps = false,
  providers = {
    openai = {
      'gpt-4.1',
    },
    anthropic = {
      'claude-sonnet-4-20250514',
    },
  },
})

-- Helper for calling goose api functions
local function Goose(action)
  return function(...)
    require('goose.api')[action](...)
  end
end

-- Keymaps
vim.keymap.set('n', '<leader>Ag', Goose('toggle'), { desc = 'Goose: Toggle UI' })
vim.keymap.set('n', '<leader>Ai', Goose('open_input'), { desc = 'Goose: Open input' })
vim.keymap.set('n', '<leader>AI', Goose('open_input_new_session'), { desc = 'Goose: New session input' })
vim.keymap.set('n', '<leader>Ao', Goose('open_output'), { desc = 'Goose: Open output' })
vim.keymap.set('n', '<leader>At', Goose('toggle_focus'), { desc = 'Goose: Toggle focus' })
vim.keymap.set('n', '<leader>Aq', Goose('close'), { desc = 'Goose: Close UI' })
vim.keymap.set('n', '<leader>Af', Goose('toggle_fullscreen'), { desc = 'Goose: Toggle fullscreen' })
vim.keymap.set('n', '<leader>As', Goose('select_session'), { desc = 'Goose: Select session' })
vim.keymap.set('n', '<leader>Ac', Goose('goose_mode_chat'), { desc = 'Goose: Chat mode' })
vim.keymap.set('n', '<leader>Aa', Goose('goose_mode_auto'), { desc = 'Goose: Auto mode' })
vim.keymap.set('n', '<leader>Ap', Goose('configure_provider'), { desc = 'Goose: Choose provider' })
vim.keymap.set('n', '<leader>Ad', Goose('diff_open'), { desc = 'Goose: Diff open' })
vim.keymap.set('n', '<leader>A]', Goose('diff_next'), { desc = 'Goose: Diff next file' })
vim.keymap.set('n', '<leader>A[', Goose('diff_prev'), { desc = 'Goose: Diff previous file' })
vim.keymap.set('n', '<leader>Ax', Goose('diff_close'), { desc = 'Goose: Diff close' })
vim.keymap.set('n', '<leader>Ara', Goose('diff_revert_all'), { desc = 'Goose: Revert all changes' })
vim.keymap.set('n', '<leader>Art', Goose('diff_revert_this'), { desc = 'Goose: Revert this file' })
