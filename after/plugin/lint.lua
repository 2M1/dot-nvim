vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function () 
        -- local lint = require("lint")
        -- pcall(lint.try_lint)
    end

})

