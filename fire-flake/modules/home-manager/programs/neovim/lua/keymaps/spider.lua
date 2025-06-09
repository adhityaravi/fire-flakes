local function SpiderMotion(motion)
  require("spider").motion(motion)
end

vim.keymap.set({ "n", "o", "x" }, "w", function() SpiderMotion("w") end, { desc = "Spider-w" })
vim.keymap.set({ "n", "o", "x" }, "e", function() SpiderMotion("e") end, { desc = "Spider-e" })
vim.keymap.set({ "n", "o", "x" }, "b", function() SpiderMotion("b") end, { desc = "Spider-b" })
vim.keymap.set({ "n", "o", "x" }, "ge", function() SpiderMotion("ge") end, { desc = "Spider-ge" })
