-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })


local function open_nvim_tree(data)

  -- El buffer es un directorio
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- Cambia a directorio
  vim.cmd.cd(data.file)

  -- Abre el nvim-Tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
