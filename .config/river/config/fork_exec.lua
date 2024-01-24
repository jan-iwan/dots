local unistd =  require("posix.unistd")

local function fork_exec(cmd, args)
    local pid, _ = unistd.fork()

    if pid == 0 then
        unistd.execp(cmd, args)
    end
end

return fork_exec
