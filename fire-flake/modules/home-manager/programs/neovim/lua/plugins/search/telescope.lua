require("telescope").setup {
  pickers = {
    colorscheme = {
      enable_preview = true,
    },
  }
}

-- Load extensions
require("telescope").load_extension("file_browser")
require("telescope").load_extension("grapple")
require("telescope").load_extension("project")

