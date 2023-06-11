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
map("n", "<leader>1", function()
  require("telescope.builtin").find_files({
    previewer = false,
  })
end)

-- tmux
local nvim_tmux_nav = require("nvim-tmux-navigation")
map("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
map("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
map("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
map("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
map("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
map("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
