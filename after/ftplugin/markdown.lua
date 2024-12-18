vim.keymap.set("n", "<localleader>po", function() require('peek').open() end, {})
vim.keymap.set("n", "<localleader>pc", function() require('peek').close() end, {})
print('detected markdown!')
