-- ~/.config/nvim/lua/plugins/custom.lua

local M = {}

local term_cmd = function(cmd)
	vim.cmd("wa") -- Write all buffers
	vim.cmd("botright split | term " .. cmd)
	vim.cmd("startinsert")
end

-- Run the current file, detecting language by extension
function M.run_current_file()
	local filename = vim.fn.expand("%:p")
	local ext = vim.fn.expand("%:e")
	local dir = vim.fn.expand("%:p:h")
	if ext == "rs" then
		-- Rust (Cargo)
		local manifest = vim.fn.expand("%:p:h:h") .. "/Cargo.toml"
		term_cmd('cargo run --manifest-path "' .. manifest .. '"')
	elseif ext == "c" or ext == "cpp" or ext == "h" or ext == "hpp" then
		term_cmd("make -C build run -j $(nproc)")
	elseif ext == "cs" then
		term_cmd("dotnet run")
	elseif ext == "py" then
		term_cmd("python3 " .. filename)
	elseif ext == "go" then
		term_cmd("go run .")
	elseif ext == "html" then
		M.LiveServer()
		vim.fn.jobstart({ "explorer.exe", "http://localhost:8080" })
	else
		vim.notify("No run command defined for this file type.", vim.log.levels.INFO)
	end
end

-- Run CTest in build dir
function M.run_ctest()
	term_cmd("ctest --output-on-failure --verbose --test-dir build")
end

-- Live Server
local job_id = nil
function M.LiveServer()
	if job_id then
		vim.notify("Live Server already running", vim.log.levels.INFO)
		return
	end
	local cmd = { "live-server", vim.fn.expand("%:h") }
	job_id = vim.fn.jobstart(cmd, {
		on_stderr = function(_, data)
			if data and data[1] ~= "" then
				vim.notify("LiveServer error: " .. data[1], vim.log.levels.ERROR)
			end
		end,
		on_exit = function(_, exit_code)
			job_id = nil
			if exit_code ~= 143 then
				vim.notify("Live Server stopped with code " .. exit_code, vim.log.levels.WARN)
			end
		end,
	})
	if job_id > 0 then
		vim.notify("Live Server started", vim.log.levels.INFO)
	else
		vim.notify("Failed to start Live Server", vim.log.levels.ERROR)
		job_id = nil
	end
end

return M
