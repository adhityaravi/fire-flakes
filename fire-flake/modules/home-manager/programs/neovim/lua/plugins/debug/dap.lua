local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require("dap-python").setup(vim.fn.exepath("python3"))
require("dap-python").test_runner = "pytest"

require("dap-go").setup()

-- Keymaps
vim.keymap.set("n", "<leader>dd", function() require('dap').continue() end, { silent = true, desc = "Start/Continue Debug" })
vim.keymap.set("n", "<leader>db", function() require('dap').toggle_breakpoint() end, { silent = true, desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>do", function() require('dap').step_over() end, { silent = true, desc = "Step Over" })
vim.keymap.set("n", "<leader>di", function() require('dap').step_into() end, { silent = true, desc = "Step Into" })
vim.keymap.set("n", "<leader>du", function() require('dapui').toggle() end, { silent = true, desc = "Toggle DAP UI" })
