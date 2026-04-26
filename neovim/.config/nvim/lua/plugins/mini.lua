return {
    'nvim-mini/mini.nvim',
    version = false,
    opts = {a = '1', b = '2', c = '3'},
    config = function()
        -- editing
        require('mini.ai').setup()
        require('mini.align').setup()
        require('mini.comment').setup()
        require('mini.pairs').setup()
        require('mini.splitjoin').setup()
        require('mini.surround').setup()

        -- visuals
        require('mini.cursorword').setup()
        require('mini.icons').setup()
        require('mini.hipatterns').setup()
        -- require('mini.notify').setup()
        require('mini.indentscope').setup()
        require('mini.trailspace').setup()
    end
}
