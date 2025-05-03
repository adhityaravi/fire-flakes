require("mini.clue").setup({
  triggers = {
    { mode = "n", keys = "<leader>" },
    { mode = "x", keys = "<leader>" },
  },

  clues = {
    -- Built-in hints
    require("mini.clue").gen_clues.builtin_completion(),
    require("mini.clue").gen_clues.g(),
    require("mini.clue").gen_clues.z(),
    require("mini.clue").gen_clues.marks(),
    require("mini.clue").gen_clues.registers(),
  },

  window = {
    config = {
      border = "rounded",
    },
    delay = 50, -- beginner friendly
  },
})
