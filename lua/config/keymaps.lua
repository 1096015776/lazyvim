-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- easy esc
map("i", "jk", "<esc>", { desc = "esc" })

-- line jump
map({ "n", "v" }, "H", "g^", { desc = "esc" })
map({ "n", "v" }, "L", "$", { desc = "esc" })

-- c-v use clipboard
map("i", "<c-v>", "<c-r>*")

-- use clipboard
map("v", "<leader>y", '"*y')
map("n", "<leader>p", '"*p')

-- easy select
map(
  "n",
  "<leader><cr>",
  ":lua require'nvim-treesitter.incremental_selection'.init_selection()<cr>",
  { desc = "select" }
)

map("v", "<cr>", ":lua require'nvim-treesitter.incremental_selection'.node_incremental()<cr>", { desc = "select" })
map("n", "gk", ':lua require"gitsigns".prev_hunk()<cr>')
map("n", "gj", ':lua require"gitsigns".next_hunk()<cr>')
