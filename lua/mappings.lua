require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local telescope = require('telescope.builtin')

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<Bslash>b", "<cmd>Gitsigns blame<CR>", { desc = "Open git blame buffer" })

map("n", "<Bslash>f", "<cmd>Telescope grep_string<CR>", { desc = "Search symbol under cursor"})

map("n", "<leader>ya", "<cmd>Format<CR>", { desc = "Run formatting tool"})

map("n", "<C-k>", ":Telescope find_files<CR>", { desc = "Find files"})
map("n", "<C-Space>", ":Telescope buffers<CR>", { desc = "Find buffers"})
map("n", "<leader>dd", ":lua vim.diagnostic.open_float()<CR>", { desc = "Open lsp diag"})
map("n", "<F4>", ":LspClangdSwitchSourceHeader<CR>", { desc = "Clangd switch source header"})
map("n", "<F3>", ":checktime<CR>", { desc = "reload file"})

map('n', '<leader>ag', function()
  local search_term = vim.fn.input("Search: ")
  if search_term and search_term ~= "" then
    vim.fn.setreg('/', search_term)
    vim.cmd('set hlsearch')
    telescope.grep_string({ search = search_term })
  end
end, { desc = "Grep with input" })

local function start_my_server()
  vim.lsp.start({
    name = "clangd-docker",
    cmd = vim.lsp.rpc.connect("127.0.0.1", 9000),
    })
end
map("n", "<Bslash>d", start_my_server, { desc = "Start clang lsp"})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
