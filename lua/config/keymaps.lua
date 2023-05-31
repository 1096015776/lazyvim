local map = require("util.index").map

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
map("n", "<c-q>", ":q<cr>")
map("n", "<leader><leader>", ":e #<cr>")

-- tab
map("n", "<c-g>", ":tabe<cr>:-tabmove<cr>:term lazygit<cr>i")
map("n", "<c-e>", ":tabe<cr>:-tabmove<cr>:term ranger<cr>i")
