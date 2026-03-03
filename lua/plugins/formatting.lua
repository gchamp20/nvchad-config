return {
  {
    'mhartington/formatter.nvim',
    cmd = "Format",
    config = function(_)
      require("formatter").setup({
        logging = true,
        -- Set the log level
        log_level = vim.log.levels.ERROR,
        filetype = {
          python = {
            function ()
              return {
                exe = "uv run ruff format --stdin-filename foo.py",
                stdin = true,
              }
            end

          },
          cpp = {
            require("formatter.filetypes.cpp").clangformat
          },
          c = {
            require("formatter.filetypes.c").clangformat
          }
        },
      })
    end,
  },
}
