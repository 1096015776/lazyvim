local M = {}

function M.toggleFT(name, cmd)
  if vim.fn["floaterm#terminal#get_bufnr"](name) ~= -1 then
    vim.cmd("FloatermToggle  " .. name)
  else
    vim.cmd("FloatermNew --name="..name.." "..cmd)
  end
end

function M.setFTToggleMap(key, name, cmd)
  vim.keymap.set("n", key, function()
    M.toggleFT(name, cmd)
  end, { silent = true, noremap = true })
  vim.keymap.set("t", key, function()
    M.toggleFT(name, cmd)
  end, { silent = true, noremap = true })
end

return M
