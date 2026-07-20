vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

vim.o.modeline = false

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

require("telescope").setup{
  defaults = {
    file_ignore_patterns = {
      "vcpkg",
      "build%-ci",
      "Testing",
      "build-test",
    },
    mappings = {
        i = {
          ["<C-u>"] = false,
        },
      },
  },
  pickers = {
    live_grep = {
      previewer = false,
      layout_config = {
        width = 0.75,
      },
    },
    grep_string = {
      previewer = false,
      layout_config = {
        width = 0.75,
      },
    },
    find_files = {
      previewer = false,
    },
    buffers = {
      previewer = false,
      layout_config = {
        width = 0.75,
      },
    },
  },
  extensions = {
    fzf  = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  },

}

require('telescope').load_extension('fzf')

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)
