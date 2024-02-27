return {
  "lewis6991/gitsigns.nvim",
  cmd = "Gitsigns",
  lazy = true,
  config = function()
    local updatetime = vim.api.nvim_get_option_value("updatetime", { scope = "global" })

    require("gitsigns").setup({
      signs = { add = { text = "│" }, change = { text = "│" } },
      current_line_blame = true,
      sign_priority = 1,
      update_debounce = updatetime,
      preview_config = { border = "rounded", row = 1, col = 0 },
      on_attach = function(bufnr)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<localleader>hr", "", {
          callback = function()
            require("gitsigns").reset_hunk()
          end,
          desc = "Git: [r]eset the current [h]unk",
        })

        vim.api.nvim_buf_set_keymap(bufnr, "x", "<leader>hr", "", {
          callback = function()
            require("gitsigns").reset_hunk({
              vim.api.nvim_call_function("line", { "." }),
              vim.api.nvim_call_function("line", { "v" }),
            })
          end,
          desc = "Git: [r]eset the current [h]unk",
        })

        vim.api.nvim_buf_set_keymap(bufnr, "n", "<localleader>hs", "", {
          callback = function()
            require("gitsigns").stage_hunk()
          end,
          desc = "Git: [s]tage the current [h]unk",
        })

        vim.api.nvim_buf_set_keymap(bufnr, "x", "<leader>hs", "", {
          callback = function()
            require("gitsigns").stage_hunk({
              vim.api.nvim_call_function("line", { "." }),
              vim.api.nvim_call_function("line", { "v" }),
            })
          end,
          desc = "Git: [s]tage the current [h]unk",
        })

        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>hp", "", {
          callback = function()
            require("gitsigns").preview_hunk()
          end,
          desc = "Git: [p]review the current [h]unk",
        })

        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>bp", "", {
          callback = function()
            require("gitsigns").blame_line({ full = true })
          end,
          desc = "Git: [p]review the current line [b]lame",
        })

        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gd", "", {
          callback = function()
            require("gitsigns").diffthis("~")
          end,
          desc = "Git: split [g]it [d]iffs",
        })

        vim.api.nvim_buf_set_keymap(bufnr, "n", "]h", "", {
          callback = function()
            require("gitsigns").next_hunk()
          end,
        })
        vim.api.nvim_buf_set_keymap(bufnr, "n", "[h", "", {
          callback = function()
            require("gitsigns").prev_hunk()
          end,
        })
      end,
    })

    if not pcall(require, "scrollbar.handlers.gitsigns") then
      return
    end

    require("scrollbar.handlers.gitsigns").setup()
  end,
}
