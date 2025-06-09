require("goose").setup({
	prefered_picker = "telescope",
	default_global_keymaps = false,
	providers = {
		github_copilot = {
			"gpt-4o",
			"gpt-4.1",
		},
		anthropic = {
			"claude-3-7-sonnet-latest",
			"claude-sonnet-4-20250514",
		},
	},
})

-- Helper for calling goose api functions
local function Goose(action)
	return function(...)
		require("goose.api")[action](...)
	end
end

-- Keymaps
vim.keymap.set("n", "<leader>ag", Goose("toggle"), { desc = "Goose: Toggle UI" })
vim.keymap.set("n", "<leader>ai", Goose("open_input"), { desc = "Goose: Open input" })
vim.keymap.set("n", "<leader>aI", Goose("open_input_new_session"), { desc = "Goose: New session input" })
vim.keymap.set("n", "<leader>ao", Goose("open_output"), { desc = "Goose: Open output" })
vim.keymap.set("n", "<leader>at", Goose("toggle_focus"), { desc = "Goose: Toggle focus" })
vim.keymap.set("n", "<leader>aq", Goose("close"), { desc = "Goose: Close UI" })
vim.keymap.set("n", "<leader>af", Goose("toggle_fullscreen"), { desc = "Goose: Toggle fullscreen" })
vim.keymap.set("n", "<leader>as", Goose("select_session"), { desc = "Goose: Select session" })
vim.keymap.set("n", "<leader>ac", Goose("goose_mode_chat"), { desc = "Goose: Chat mode" })
vim.keymap.set("n", "<leader>aa", Goose("goose_mode_auto"), { desc = "Goose: Auto mode" })
vim.keymap.set("n", "<leader>ap", Goose("configure_provider"), { desc = "Goose: Choose provider" })
vim.keymap.set("n", "<leader>ad", Goose("diff_open"), { desc = "Goose: Diff open" })
vim.keymap.set("n", "<leader>a]", Goose("diff_next"), { desc = "Goose: Diff next file" })
vim.keymap.set("n", "<leader>a[", Goose("diff_prev"), { desc = "Goose: Diff previous file" })
vim.keymap.set("n", "<leader>ax", Goose("diff_close"), { desc = "Goose: Diff close" })
vim.keymap.set("n", "<leader>ara", Goose("diff_revert_all"), { desc = "Goose: Revert all changes" })
vim.keymap.set("n", "<leader>art", Goose("diff_revert_this"), { desc = "Goose: Revert this file" })
