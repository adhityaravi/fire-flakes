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

vim.g.copilot_enabled = true  -- on by default
function ToggleCopilot()
  vim.g.copilot_enabled = not vim.g.copilot_enabled
  if vim.g.copilot_enabled then
    vim.cmd("Copilot enable")
  else
    vim.cmd("Copilot disable")
  end
end
