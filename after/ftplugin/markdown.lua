vim.keymap.set("n", "<localleader>po", function() require('peek').open() end, opts)
vim.keymap.set("n", "<localleader>pc", function() require('peek').close() end, opts)
print('detected markdown!')
