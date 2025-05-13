local coms = vim.api.nvim_create_user_command
coms(
    'NewNote',
    function()
        local note_name = vim.fn.input("Note Name: ")
		-- sub_dir is optional
        local sub_dir = vim.fn.input("Subdirectory (optional): ")

        local note_dir = vim.fn.expand("$HOME") .. "/notes/" .. sub_dir

        local note_type = "md" -- Change this to your desired file type

        -- Create the notes directory if it doesn't exist
        if not vim.fn.isdirectory(note_dir) then
            vim.fn.mkdir(note_dir, "p")
        end

        -- Create the note file
        local note_file = note_dir .. "/" .. note_name .. "." .. note_type
        vim.cmd("edit " .. note_file)

        -- Insert a template or header if needed
        vim.api.nvim_buf_set_lines(0, 0, 0, false, {
			"# " .. note_name,
			"",
			"## Tags",
			"- "
		})
    end,
    { nargs = "*" }
)

vim.api.nvim_set_keymap('n', '<leader>nn', ':NewNote<CR>', { noremap = true, silent = false })


