return {
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function()
      local mouse_scrolled = false
      for _, scroll in ipairs({ "Up", "Down" }) do
        local key = "<ScrollWheel" .. scroll .. ">"
        vim.keymap.set({ "", "i" }, key, function()
          mouse_scrolled = true
          return key
        end, { expr = true })
      end

      local animate = require("mini.animate")
      return {
        resize = {
          timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
        },
        scroll = {
          timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
          subscroll = animate.gen_subscroll.equal({
            predicate = function(total_scroll)
              if mouse_scrolled then
                mouse_scrolled = false
                return false
              end
              return total_scroll > 1
            end,
          }),
        },
      }
    end,
    config = function(_, opts)
      require("mini.animate").setup(opts)
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.prettierd)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    -- other settings removed for brevity
    opts = {
      servers = {
        eslint = {
          settings = {
            -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
            workingDirectory = { mode = "auto" },
          },
        },
      },
      setup = {
        eslint = function()
          vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function(event)
              -- if require("lspconfig.util").get_active_client_by_name(event.buf, "eslint") then
              --   vim.cmd("EslintFixAll")
              -- end
            end,
          })
        end,
      },
    },
  },
  {
    "alexghergh/nvim-tmux-navigation",
  },
  {
    "voldikss/vim-floaterm",
    config = function()
      vim.g.floaterm_title = ""
      vim.g.floaterm_width = 0.8
      vim.g.floaterm_height = 0.8
      vim.g.floaterm_autoclose = 0
      vim.g.floaterm_autohide = 2
      vim.g.floaterm_opener = "vsplit"
      vim.cmd(
        [[au BufEnter * if &buftype == 'terminal' | :call timer_start(50, { -> execute('startinsert!') }, { 'repeat': 3 }) | endif]]
      )
      require("util.term").setFTToggleMap("<c-e>", "ranger", "ranger")
      require("util.term").setFTToggleMap("<c-g>", "lazygit", "lazygit")
      require("util.term").setFTToggleMap("<c-y>", "term", "")

      -- vim.cmd([[hi FloatermBorder ctermfg=fg ctermbg=none]])
    end,
  },
}
