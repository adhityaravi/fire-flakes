vim.keymap.set("n", "<leader>rr", function() require("spectre").open() end, { desc = "Replace in Files (Spectre)" })
vim.keymap.set("n", "<leader>rw", function() require("spectre").open_visual({ select_word = true }) end, { desc = "Replace Word Under Cursor" })
vim.keymap.set("v", "<leader>rw", function() require("spectre").open_visual() end, { desc = "Replace Selection" })
vim.keymap.set("n", "<leader>rf", function() require("spectre").open_file_search() end, { desc = "Replace in Current File" })
