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

-- Keybinding to save session in temp folder with standard name

coms(
  'SaveSession',
  function()
	local os_name = vim.loop.os_uname().sysname
	local temp_dir = (os_name == "Windows_NT") and os.getenv("TEMP") or "/tmp"
	local session_file = temp_dir .. "/neovim_session.vim"
	vim.cmd("mksession! " .. session_file)
	print("Sessie opgeslagen in: " .. session_file)
  end,
  {}
)


coms(
  'LoadSession',
  function()
	local os_name = vim.loop.os_uname().sysname
	local temp_dir = (os_name == "Windows_NT") and os.getenv("TEMP") or "/tmp"
	local session_file = temp_dir .. "/neovim_session.vim"
	if vim.fn.filereadable(session_file) == 1 then
		vim.cmd("source " .. session_file)
	else
		print("Geen sessie gevonden in: " .. session_file)
	end
  end,
  {}
)
-- Definieer een keybinding om het commando uit te voeren
vim.api.nvim_set_keymap('n', '<leader>ss', ':SaveSession<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ls', ':LoadSession<CR>', { noremap = true, silent = true })

