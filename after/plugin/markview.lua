require("markview").setup({
    buf_ignore = { "nofile" },
    modes = { "n", "v" },

    -- Returns the conceallevel to the global value when changing modes
    restore_conceallevel = true,
    -- Returns the concealcursor to the global value when changing modes
    restore_concealcursor = false,

    headings = {},
    code_blocks = {
        enable = true,
        style = "minimal",
        position = "inline",

        pad_char = " ",
        pad_amount = 2,

        hl = "dark",
        min_width = 70
    },
    block_quotes = {},
    horizontal_rules = {},
    hyperlinks = {},
    images = {},
    inline_codes = {},
    list_items = {},
    checkboxes = {},
    tables = {}
});
