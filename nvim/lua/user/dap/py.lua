local dap = require('dap')

-- pip install debugpy

dap.adapters.python = {
    type = 'executable';
    command = '/home/defntvdm/.pyenv/shims/python';
    args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
    {
        type = 'python';
        request = 'launch';
        name = 'Launch file';

        program = '${file}';
        pythonPath = '/home/defntvdm/.pyenv/shims/python3',
    },
}
