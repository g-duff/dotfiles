vim.api.nvim_create_user_command('ToReg', function(opts) 
	local register, command = string.match(opts.args, "^(%l)%s(.*)$")
	local vim_command = "redir @" .. register .. " | exec(\"" .. command .. "\") | redir END"
	vim.cmd(vim_command)
end, { nargs = "+" })

vim.api.nvim_create_user_command('ToIsoDate', function(opts)

	local range_index = opts.range + 1
	local ranges = {
		'1,$',
		opts.line1,
		opts.line1 .. ',' .. opts.line2
	}

	vim.cmd(ranges[range_index] .. " luado return string.gsub(line, \"(%d%d)/(%d%d)/(%d%d%d%d)\", \"%3-%2-%1\")")

end, { range = true })
