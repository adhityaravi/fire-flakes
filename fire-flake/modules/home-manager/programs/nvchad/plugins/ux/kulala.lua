require('kulala').setup({
  global_keymaps = false,
})

-- Keymaps
local function Kulala(action)
  return function()
    require("kulala")[action]()
  end
end

vim.keymap.set({ "n", "v" }, "<leader>Rs", Kulala("run"), { desc = "HTTP: Send request" })
vim.keymap.set({ "n", "v" }, "<leader>Ra", Kulala("run_all"), { desc = "HTTP: Send all" })
vim.keymap.set("n", "<leader>Rb", Kulala("scratchpad"), { desc = "HTTP: Scratchpad" })
vim.keymap.set("n", "<leader>Ro", Kulala("open"), { desc = "HTTP: Open Kulala" })
vim.keymap.set("n", "<leader>Rt", Kulala("toggle_view"), { desc = "HTTP: Toggle headers/body" })
vim.keymap.set("n", "<leader>RS", Kulala("show_stats"), { desc = "HTTP: Show stats" })
vim.keymap.set("n", "<leader>Rq", Kulala("close"), { desc = "HTTP: Close window" })
vim.keymap.set("n", "<leader>Rc", Kulala("copy"), { desc = "HTTP: Copy as cURL" })
vim.keymap.set("n", "<leader>RC", Kulala("from_curl"), { desc = "HTTP: Paste from cURL" })
vim.keymap.set("n", "<leader>Ri", Kulala("inspect"), { desc = "HTTP: Inspect request" })
vim.keymap.set("n", "<leader>Rr", Kulala("replay"), { desc = "HTTP: Replay request" })
vim.keymap.set("n", "<leader>Rf", Kulala("search"), { desc = "HTTP: Find request" })
vim.keymap.set("n", "<leader>Rn", Kulala("jump_next"), { desc = "HTTP: Next request" })
vim.keymap.set("n", "<leader>Rp", Kulala("jump_prev"), { desc = "HTTP: Prev request" })
vim.keymap.set("n", "<leader>Re", Kulala("set_selected_env"), { desc = "HTTP: Select env" })
vim.keymap.set("n", "<leader>Ru", function() require("lua.kulala.ui.auth_manager").open_auth_config() end, { desc = "HTTP: Auth config" })
vim.keymap.set("n", "<leader>Rg", Kulala("download_graphql_schema"), { desc = "HTTP: Download GQL schema" })
vim.keymap.set("n", "<leader>Rx", Kulala("scripts_clear_global"), { desc = "HTTP: Clear globals" })
vim.keymap.set("n", "<leader>RX", Kulala("clear_cached_files"), { desc = "HTTP: Clear cache" })
