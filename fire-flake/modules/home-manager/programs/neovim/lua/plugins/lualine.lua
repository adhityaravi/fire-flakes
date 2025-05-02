-- get copilot status
local function copilot_status()
  local ok, client = pcall(require, "copilot.client")
  if not ok or type(client) ~= "table" then
    return ""
  end

  local buf = vim.api.nvim_get_current_buf()
  -- skip invalid buffers or no filetype
  if not vim.api.nvim_buf_is_valid(buf) or vim.bo[buf].filetype == "" then
    return ""
  end

  -- Get attached LSP clients for this buffer
  local clients = vim.lsp.get_clients({ bufnr = buf })

  for _, client in ipairs(clients) do
    if client and client.name == "copilot" then
      return "Ast."
    end
  end

  return ""
end

-- get lsp status
local function lsp_status()
  local clients = vim.lsp.get_clients({ bufnr = 0 })

  local lsp_clients = vim.tbl_filter(function(client)
    return client.name ~= "copilot"
  end, clients)

  if vim.tbl_isempty(lsp_clients) then
    return "  No LSP"
  end

  local names = {}
  for _, client in ipairs(lsp_clients) do
    table.insert(names, client.name)
  end

  return "  " .. table.concat(names, ", ")
end


-- lualine
require("lualine").setup({
    options = {
      theme = "auto",
      icons_enabled = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      always_divide_middle = true,
      globalstatus = true,
    },

    sections = {
      lualine_a = { "mode" },

      lualine_b = {
        "branch",
        "diff",
      },

      lualine_c = {
        {
          copilot_status,
          icon = "",
          color = { fg = "#a6e3a1" },
          cond = function()
            return copilot_status() ~= ""
          end,
        },
      },

      lualine_x = {
        lsp_status,
        "encoding",
        "fileformat",
        "filetype",
      },

      lualine_y = { "progress" },

      lualine_z = {
        function()
          local mode = vim.fn.mode()
          if mode == "n" then
            return "≽^•⩊•^≼ ❄️"
          elseif mode == "i" then
            return "ฅ^•ﻌ•^ฅ 🔥"
          else
            return "(=ↀωↀ=)🔧"
          end
        end
      },
    },

    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
  })

