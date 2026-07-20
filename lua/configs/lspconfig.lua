require("nvchad.configs.lspconfig").defaults()

-- local servers = { "html", "cssls", "vuels", "pylsp", "clangd", "zls" }
local servers = { "clangd", "pylsp", "rust_analyzer"}

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
          maxLineLength = 200,
          ignore = {
            "E302",
            "E265",
            "E252",
            "W291",
            "W293",
          },
        },
          pyflakes = {
            enabled = false,
          },
      }
    }
  }
}
)

vim.lsp.config("rust_analyzer", {
  settings = {
    ['rust-analyzer'] = {},
  }
})

vim.lsp.enable(servers)
