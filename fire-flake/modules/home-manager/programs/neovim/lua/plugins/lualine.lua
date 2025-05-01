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
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          symbols = { error = " ", warn = " ", info = " " },
          always_visible = true,
        },
      },

      lualine_c = {
        { "filename", path = 1 }, -- show relative path
      },

      lualine_x = {
        {
          function()
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            if next(clients) == nil then
              return "  No LSP"
            end
            local names = {}
            for _, client in pairs(clients) do
              table.insert(names, client.name)
            end
            return "  " .. table.concat(names, ", ")
          end,
          color = { fg = "#88C0D0" },
        },
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
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
  })
