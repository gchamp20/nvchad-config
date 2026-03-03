require("nvchad.configs.lspconfig").defaults()

-- local servers = { "html", "cssls", "vuels", "pylsp", "clangd", "zls" }
local servers = { "clangd", "pylsp"}

--vim.lsp.config('clangd', {
--  cmd = vim.lsp.rpc.connect("127.0.0.1", 9000),
--})

-- vim.lsp.config("zls", {
--  cmd = { "/home/guchaj/dev/zig/zls/zls" },
-- })

vim.lsp.config("pylsp",{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          maxLineLength = 200
        }
      }
    }
  }
}
)

vim.lsp.enable(servers)
