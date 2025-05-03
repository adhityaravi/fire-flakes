require("mini.clue").setup({
  delay = 100, -- default is 300
  triggers = {
    { mode = "n", keys = "<Leader>" },
    { mode = "x", keys = "<Leader>" },
  },

  clues = {
    -- Built-in hints
    require("mini.clue").gen_clues.builtin_completion(),
    require("mini.clue").gen_clues.g(),
    require("mini.clue").gen_clues.z(),
    require("mini.clue").gen_clues.marks(),
    -- require("mini.clue").gen_clues.registers(),
  },

  window = {
    config = {
      border = "rounded",
    },
  },
})
