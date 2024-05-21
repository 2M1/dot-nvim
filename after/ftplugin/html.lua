
vim.keymap.set("n", "<localleader>po", function() 
    vim.cmd('BrowserSyncStart')
    vim.cmd('BrowserSyncOpen') end, opts)
vim.keymap.set("n", "<localleader>pc", function() vim.cmd('BrowserSyncStop') end, opts)
print('detected html!')
