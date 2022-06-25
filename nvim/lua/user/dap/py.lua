local dap = require('dap')

-- pip install debugpy

dap.adapters.python = {
    type = 'executable';
    command = '/Users/defntvdm/.pyenv/shims/python';
    args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
    {
        type = 'python';
        request = 'launch';
        name = 'Launch file';

        program = '${file}';
        pythonPath = '/Users/defntvdm/.pyenv/shims/python3',
    },
}
