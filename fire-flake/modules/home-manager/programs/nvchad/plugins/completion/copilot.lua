require("copilot").setup({
	suggestion = { enabled = false },
	panel = {
		enabled = false,
	},
	filetypes = {
		lua = true,
		python = true,
		go = true,
		nix = true,
		sh = true,
		markdown = true,
		terraform = true,
		yaml = true,
		["*"] = false,
	},
})

vim.g.copilot_enabled = true -- on by default
function ToggleCopilot()
	vim.g.copilot_enabled = not vim.g.copilot_enabled
	if vim.g.copilot_enabled then
		vim.cmd("Copilot enable")
	else
		vim.cmd("Copilot disable")
	end
end

-- Keymaps
vim.keymap.set("n", "<leader>ce", "<cmd>Copilot enable<CR>", { desc = "Copilot Enable" })
vim.keymap.set("n", "<leader>cd", "<cmd>Copilot disable<CR>", { desc = "Copilot Disable" })
vim.keymap.set("n", "<leader>cs", "<cmd>Copilot status<CR>", { desc = "Copilot Status" })
vim.keymap.set("n", "<leader>tc", ToggleCopilot, { desc = "Toggle Copilot" })
