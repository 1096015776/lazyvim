return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
  },
  {
    "briones-gabriel/darcula-solid.nvim",
    dependencies = { "rktjmp/lush.nvim" },
  },
  "sainnhe/everforest",
  "navarasu/onedark.nvim",
  "shaunsingh/nord.nvim",
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "darcula-solid",
      -- colorscheme = "gruvbox",
    },
  },
}
