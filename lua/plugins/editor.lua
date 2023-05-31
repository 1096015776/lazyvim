return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
        cwd_target = {
          sidebar = "tab", -- sidebar is when position = left or right
          current = "window", -- current is when position = current
        },
      },
      window = {
        mappings = {
          ["<space>"] = "none",
          ["<S-tab>"] = "prev_source",
          ["<tab>"] = "next_source",
          ["<c-f>"] = function(state)
            local node = state.tree:get_node()
            local type = node.type
            local cwd = ""
            if type == "file" then
              cwd = string.sub(node.path, 0, string.len(node.path) - string.len(node.name))
            else
              cwd = node.path .. "/"
            end
            vim.cmd("Neotree close")
            require("spectre").open({
              is_insert_mode = true,
              cwd = cwd,
              search_text = "",
              replace_text = "",
              path = "",
              is_close = true, -- close an exists instance of spectre and open new
            })
          end,
        },
      },
      source_selector = {
        winbar = true,
        statusline = false,
      },
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      vim.opt.foldcolumn = "0"
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
      vim.opt.foldenable = true
      require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
      })
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    opts = {
      -- add your options that should be passed to the setup() function here
      position = "right",
    },
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "S",
        delete = "ds",
        -- find = "",
        -- find_left = "gsF",
        -- highlight = "gsh",
        replace = "cs",
        -- update_n_lines = "gsn",
      },
    },
  },
}
