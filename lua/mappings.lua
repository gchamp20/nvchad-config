require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<Bslash>b", "<cmd>Gitsigns blame<CR>", { desc = "Open git blame buffer" })

map("n", "<Bslash>f", "<cmd>Telescope grep_string<CR>", { desc = "Search symbol under cursor"})

map("n", "<leader>ya", "<cmd>Format<CR>", { desc = "Run formatting tool"})


local function start_my_server()
  vim.lsp.start({
    name = "clangd-docker",
    cmd = vim.lsp.rpc.connect("127.0.0.1", 9000),
    })
end
map("n", "<Bslash>d", start_my_server, { desc = "Start clang lsp"})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
