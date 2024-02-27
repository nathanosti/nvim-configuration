return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local keymap = vim.keymap

    local opts = { noremap = true, silent = true }
    local on_attach = function(bufnr)
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "Show line error dialog"
      keymap.set("n", "gl", vim.diagnostic.show, opts) -- show diagnostics for line in a dialog

      opts.desc = "Show buffer type definitions"
      keymap.set("n", "<leader>td", vim.lsp.buf.type_definition, opts) -- show buffer type definitions

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<c-cat>", vim.lspnbuf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "]d", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      keymap.set("n", "[d", vim.diagnostic.open_float(nil, {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = 'rounded',
        source = 'always', -- This shows the source of the diagnostic
        prefix = ' ',
        scope = 'line',    -- This limits the diagnostics to the current line
      }), opts)            -- show diagnostics for line

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

      opts.desc = "Show signature help"
      keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure html server
    require("lspconfig").html.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure typescript server with plugin
    require("lspconfig").tsserver.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure css server
    require("lspconfig").cssls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure go lang server
    require("lspconfig").gopls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    require("lspconfig").golangci_lint_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure tailwindcss server
    require("lspconfig").tailwindcss.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure prisma orm server
    require("lspconfig").prismals.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      autostart = true,
    })

    -- configure emmet language server
    require("lspconfig").emmet_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
      autostart = true,
    })

    -- configure python server
    require("lspconfig").pyright.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      autostart = true,
    })

    -- configure lua server (with special settings)
    require("lspconfig").lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      autostart = true,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}
