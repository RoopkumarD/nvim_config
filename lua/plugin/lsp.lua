return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      -- "hrsh7th/cmp-nvim-lsp"
    },
    config = function()
      local lspconfig = require("lspconfig")

      -- I want to write code without auto complete
      -- and learn to internalize api so it won't break my focus/flow
      --[[
      -- introducing neovim lsp capabilities to each lsp server
      local capabilities = nil
      if pcall(require, "cmp_nvim_lsp") then
        capabilities = require("cmp_nvim_lsp").default_capabilities()
      end
      ]] --

      local servers = {
        lua_ls = true,
        pyright = true,
        clangd = true,
        tinymist = true,
      }

      for name, config in pairs(servers) do
        if config == true then
          config = {}
        end
        --[[
        config = vim.tbl_deep_extend("force", {}, {
          capabilities = capabilities,
        }, config)
        ]] --

        lspconfig[name].setup(config)
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })
          vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Get [L]ine [D]iagnostic" })

          -- format on save
          if client.supports_method("textDocuement/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end
            })
          end
        end
      })
    end
  }
}
