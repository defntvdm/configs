local dap = require('dap')

-- download https://github.com/vadimcn/vscode-lldb release and unpack to /Users/defntvdm/.dap-adapters/codelldb
-- extension folder

dap.adapters.codelldb = {
    type = 'server',
    host = '127.0.0.1',
    port = 13000,
    executable = {
        command = '/Users/defntvdm/.dap-adapters/codelldb/adapter/codelldb',
        args = {"--port", "13000"},
        -- detached = false,
    }
}

dap.configurations.c = {
    {
        type = 'codelldb';
        request = 'launch';
        name = 'Launch file';
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file');
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
    },
}

dap.configurations.cpp = {
    {
        type = 'codelldb';
        request = 'launch';
        name = 'Launch file';
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file');
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
    },
}

dap.configurations.rust = {
    {
        type = 'codelldb';
        request = 'launch';
        name = 'Launch file';
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file');
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
    },
}
