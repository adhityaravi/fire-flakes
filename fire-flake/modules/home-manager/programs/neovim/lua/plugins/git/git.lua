require("gitsigns").setup {
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged = {
    add          = { text = '┃┃' },
    change       = { text = '┃┃' },
    delete       = { text = '__' },
    topdelete    = { text = '‾‾' },
    changedelete = { text = '~~' },
    untracked    = { text = '┆┆' },
  },
  signs_staged_enable = true,
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      -- Navigation
      map("n", "]c", function()
        if vim.wo.diff then return "]c" end
        vim.schedule(gs.next_hunk)
        return "<Ignore>"
      end, "Next Git hunk")

      map("n", "[c", function()
        if vim.wo.diff then return "[c" end
        vim.schedule(gs.prev_hunk)
        return "<Ignore>"
      end, "Previous Git hunk")

      -- Actions #todo: move to keymap file
      map("n", "<leader>gs", gs.stage_hunk, "Stage hunk")
      map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
      map("v", "<leader>gs", function() gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end, "Stage hunk (visual)")
      map("v", "<leader>gr", function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end, "Reset hunk (visual)")
      map("n", "<leader>gu", gs.undo_stage_hunk, "Undo staged hunk")
      map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
      map("n", "<leader>gb", gs.blame_line, "Blame line")
      map("n", "<leader>gd", gs.diffthis, "Diff this")
      map("n", "<leader>gD", function() gs.diffthis("~") end, "Diff previous")
      map("n", "<leader>gt", gs.toggle_deleted, "Toggle deleted")
    end,
  }

require("lazygit.utils").project_root_dir()  -- optional

-- Keymaps
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open Lazygit" })
vim.keymap.set("n", "<leader>gS", "<cmd>Telescope git_status<CR>", { desc = "Git status" })
vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Git commits" })

