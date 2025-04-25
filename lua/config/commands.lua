--[[ commands.lua ]]
-- Custom commands for Neovim

local coms = vim.api.nvim_create_user_command


coms(
  'BuffOnly',
  function ()
    vim.cmd(':%bd|e#|bd#')
  end,
  {}
)

coms(
  'Virtualenv',
  function()
    -- Check if the 'venv' directory exists in the current directory
    local venv_path = vim.fn.getcwd() .. '/venv'
    if vim.fn.isdirectory(venv_path) == 1 then
      -- Set PYTHONPATH to the virtual environment's site-packages directory
      local python_path = venv_path .. '/lib/python' .. vim.fn.system('python -c "import sys; print(sys.version[:3])"') .. '/site-packages'
      vim.fn.setenv('PYTHONPATH', python_path)

      -- Set the Python interpreter to the one in the virtual environment
      local python_exe = venv_path .. '/bin/python' -- Adjust for Windows if needed
      vim.g.python3_host_prog = python_exe

      vim.cmd('echo "Virtualenv activated."')
    else
      vim.cmd('echoerr "Virtualenv not found in the current directory."')
    end
  end,
  {}
)
