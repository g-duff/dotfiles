vim.api.nvim_create_user_command('ToReg', function(opts) 
	local register, command = string.match(opts.args, "^(%l)%s(.*)$")
	local vim_command = "redir @" .. register .. " | exec(\"" .. command .. "\") | redir END"
	vim.cmd(vim_command)
end, { nargs = "+" })

