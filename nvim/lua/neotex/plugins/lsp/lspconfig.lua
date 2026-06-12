return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" }, -- Only load when a file is opened
  dependencies = {
    -- Mason must load first so its bin/ dir is on PATH before any LSP launches.
    -- Otherwise opening a file at startup races ahead of Mason (VeryLazy) and
    -- the server binary can't be found, so no LSP attaches.
    "williamboman/mason.nvim",
    { "antosha417/nvim-lsp-file-operations", event = "VeryLazy" }, -- Load file operations later
  },
  config = function()
    -- Defensive: make sure Mason's bin dir is on PATH even if its own config
    -- hasn't run yet (ordering safety net for the lazy-load race above).
    pcall(function() require("mason").setup() end)
    local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
    if not string.find(vim.env.PATH or "", mason_bin, 1, true) then
      vim.env.PATH = mason_bin .. (vim.fn.has("win32") == 1 and ";" or ":") .. vim.env.PATH
    end

    -- Import lspconfig plugin (only loaded when the event triggers)
    local lspconfig = require("lspconfig")

    -- Define diagnostics configuration before anything else
    local signs = { Error = "", Warn = "", Hint = "󰠠", Info = "" }
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = signs.Error,
          [vim.diagnostic.severity.WARN] = signs.Warn,
          [vim.diagnostic.severity.HINT] = signs.Hint,
          [vim.diagnostic.severity.INFO] = signs.Info,
        },
      },
      -- Optimize diagnostic updates - don't update in insert mode
      update_in_insert = false,
      -- Reduce diagnostic severity for better UX
      severity_sort = true,
    })

    -- On-attach function to set up keymaps when an LSP connects
    local on_attach = function(client, bufnr)
      -- Your existing on_attach code can go here
    end

    -- Completion capabilities advertised to servers (let blink.cmp enhance them).
    -- lspconfig already lazy-loads on BufReadPre/BufNewFile, so configuring the
    -- servers directly here is still lazy. We must NOT defer setup() into a
    -- FileType autocmd: setup() registers lspconfig's own launch trigger, which
    -- only fires on the *next* FileType event — so the buffer you just opened
    -- would never get a server attached.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local ok, blink = pcall(require, "blink.cmp")
    if ok then
      capabilities = blink.get_lsp_capabilities(capabilities)
    end

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })

    lspconfig.pyright.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig.texlab.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        texlab = {
          build = { onSave = true },
          chktex = {
            onEdit = false,
            onOpenAndSave = false,
          },
          diagnosticsDelay = 300,
        },
      },
    })
  end,
}