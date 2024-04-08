local M = {}

local unistd =  require("posix.unistd")

-- capture stdout of command
function M.capture(cmd, raw)
    local f = assert(io.popen(cmd, 'r'))
    local s = assert(f:read("*a"))
    f:close()

    if raw then return s end

    s = string.gsub(s, "^%s+", "")
    s = string.gsub(s, "%s+$", "")
    s = string.gsub(s, "[\n\r]+", " ")

    return s
end

-- fork and execute
function M.exec(bin, args, wait)
    local pid, _ = unistd.fork()

    if pid == 0 then
        unistd.execp(bin, args)
    else
        if wait ~= nil then
            require 'posix.sys.wait'.wait(pid)
        end
    end
end

---- from luaposix examples
-- local M = require 'posix.unistd'
--
--
-- local r,w = M.pipe()
-- local childpid = M.fork()
-- if childpid == 0 then
--    -- child reads from pipe
--    M.close(w)  -- close unused write end
--
--    local b = M.read(r, 1)
--    while #b == 1 do
--       -- got a byte from the pipe, write it to stdout
--       io.write(b)
--       b = M.read(r, 1)
--    end
--    M.close(r)
--    M._exit(0)
--
-- else
--    -- parent writes to pipe
--    M.close(r) -- close unused read end
--
--    -- write the bytes for the child process to the pipe
--    M.write(w,'hello dolly\n')
--    M.close(w)
--    -- wait for child to finish
--    require 'posix.sys.wait'.wait(childpid)
-- end

return M
