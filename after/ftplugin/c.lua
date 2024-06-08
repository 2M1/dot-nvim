vim.keymap.set("n", "<localleader>h", function ()
    vim.cmd('ClangdSwitchSourceHeader')
end)
