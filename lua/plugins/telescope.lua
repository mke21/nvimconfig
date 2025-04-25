return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = {
		  'nvim-lua/plenary.nvim',
		  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'}
	  },
	  config = function()
		  require('telescope').setup {
			  defaults = {
				  file_ignore_patterns = {"%.min.js$", "/.*/%.min.js$", "node_modules"},
			  },
			  pickers = {
				  find_files = {
					  theme="ivy"
				  },
			  },
		  }
		  vim.keymap.set('n', '<m-p>', require('telescope.builtin').find_files)
		  vim.keymap.set('n', '<m-g>', require('telescope.builtin').live_grep)
		  vim.keymap.set('n', '<m-b>', require('telescope.builtin').buffers)
		  vim.keymap.set('n', '<m-h>', require('telescope.builtin').help_tags)
		  vim.keymap.set('n', '<m-c>', require('telescope.builtin').commands)
		  vim.keymap.set('n', '<space>co', function()
			  require('telescope.builtin').find_files {
				  cwd = vim.fn.stdpath('config')
			  }
		  end)
	  end
    }
