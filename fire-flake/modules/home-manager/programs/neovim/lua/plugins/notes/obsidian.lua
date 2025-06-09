local obsidian = require("obsidian")
local workspaces = vim.g.fireflake_obsidian_workspaces or {}

-- works only with the obsidian vault template from voidashi - https://github.com/voidashi/obsidian-vault-template
obsidian.setup({
	workspaces = workspaces,

	notes_subdir = "01 Personal/01.99 Fleeting",

	daily_notes = {
		folder = "01 Personal/01.01 Daily",
		date_format = "%Y-%m-%d",
		alias_format = "%B %-d, %Y",
		default_tags = {},
		template = "99 Meta/99.02 Templates/(TEMPLATE) Daily.md",
	},

	completion = {
		nvim_cmp = true,
		min_chars = 2,
	},

	-- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
	-- URL it will be ignored but you can customize this behavior here.
	---@param url string
	follow_url_func = function(url)
		-- Open the URL in the default web browser.
		-- vim.fn.jobstart({"xdg-open", url})  -- linux
		vim.ui.open(url) -- need Neovim 0.10.0+
	end,

	-- Optional, by default when you use `:ObsidianFollowLink` on a link to an image
	-- file it will be ignored but you can customize this behavior here.
	---@param img string
	follow_img_func = function(img)
		vim.fn.jobstart({ "xdg-open", img }) -- linux
	end,

	new_notes_location = "notes_subdir",

	preferred_link_style = "markdown",

	sort_by = "modified",
	sort_reversed = true,

	-- Set the maximum number of lines to read from notes on disk when performing certain searches.
	search_max_lines = 1000,

	templates = {
		folder = "99 Meta/99.02 Templates",
		date_format = "%Y-%m-%d",
		time_format = "%H:%M",
	},

	picker = {
		name = "telescope.nvim",
	},
	ui = {
		enable = true,
	},

	-- Specify how to handle attachments.
	attachments = {
		-- The default folder to place images in via `:ObsidianPasteImg`.
		-- If this is a relative path it will be interpreted as relative to the vault root.
		-- You can always override this per image by passing a full path to the command instead of just a filename.
		img_folder = "98 - Assets/Images", -- This is the default

		-- customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
		---@return string
		img_name_func = function()
			-- Prefix image names with timestamp.
			return string.format("%s-", os.time())
		end,
	},
})

pcall(function()
	require("telescope").load_extension("obsidian")
end)

-- Keymaps
vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "Open in Obsidian" })
vim.keymap.set("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Quick switch" })
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search notes" })
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Show backlinks" })
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "New note" })
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianToday<CR>", { desc = "Open today's note" })
vim.keymap.set("n", "<leader>oy", "<cmd>ObsidianYesterday<CR>", { desc = "Open yesterday" })
vim.keymap.set("n", "<leader>om", "<cmd>ObsidianTomorrow<CR>", { desc = "Open tomorrow" })
vim.keymap.set("n", "<leader>od", "<cmd>ObsidianDailies<CR>", { desc = "List dailies" })
vim.keymap.set("n", "<leader>oT", "<cmd>ObsidianTemplate<CR>", { desc = "Insert template" })
vim.keymap.set("n", "<leader>op", "<cmd>ObsidianPasteImg<CR>", { desc = "Paste image" })
vim.keymap.set("n", "<leader>ow", "<cmd>ObsidianWorkspace<CR>", { desc = "Switch workspace" })
vim.keymap.set("n", "<leader>or", "<cmd>ObsidianRename<CR>", { desc = "Rename note" })
vim.keymap.set("v", "<leader>ol", "<cmd>ObsidianLink<CR>", { desc = "Link selection" })
vim.keymap.set("v", "<leader>oe", "<cmd>ObsidianExtractNote<CR>", { desc = "Extract to note" })
vim.keymap.set("v", "<leader>oN", "<cmd>ObsidianLinkNew<CR>", { desc = "New note from selection" })
vim.keymap.set("n", "<leader>oL", "<cmd>ObsidianLinks<CR>", { desc = "List links" })
