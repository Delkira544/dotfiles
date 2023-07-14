---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}


M.Custom = {
  n = {
    ["<F10>"] = {
      function ()
        local ArchivoExt = vim.fn.expand("%:p:t")
        local Archivo = vim.fn.expand("%:p:t:r")
        local ft_cmds = {
          python = "python " .. ArchivoExt,
          java = "javac -d . " .. ArchivoExt .. " && " .. "java " .. Archivo ,
          cpp = "g++ -o " .. Archivo .. " " .. ArchivoExt ..  " && " .. "./" .. Archivo,
          cs = "dotnet run",
          asm = "nasm -f elf " .. ArchivoExt .. " && " .. "ld -m elf_i386 -s -o " .. Archivo .. " "
                .. Archivo .. ".o  && ./" .. Archivo ,

        }

        require("nvterm.terminal").send(ft_cmds[vim.bo.filetype], "horizontal")

      end, "Ejecutar codigo"
    }
  },

}
-- more keybinds!

return M
