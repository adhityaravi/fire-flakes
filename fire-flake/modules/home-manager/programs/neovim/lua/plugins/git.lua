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
  
      -- Actions
      map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
      map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
      map("v", "<leader>hs", function() gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end, "Stage hunk (visual)")
      map("v", "<leader>hr", function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end, "Reset hunk (visual)")
      map("n", "<leader>hu", gs.undo_stage_hunk, "Undo staged hunk")
      map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
      map("n", "<leader>hb", gs.blame_line, "Blame line")
      map("n", "<leader>hd", gs.diffthis, "Diff this")
      map("n", "<leader>hD", function() gs.diffthis("~") end, "Diff previous")
      map("n", "<leader>ht", gs.toggle_deleted, "Toggle deleted")
    end,
  }

require("lazygit.utils").project_root_dir()  -- optional
vim.keymap.set("n", "<leader>hg", ":LazyGit<CR>", { desc = "Open Lazygit" })
