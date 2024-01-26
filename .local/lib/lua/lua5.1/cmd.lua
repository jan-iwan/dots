local cmd = {}

-- capture stdout of cmd
function cmd.capture(command, raw)
    local f = assert(io.popen(command, 'r'))
    local s = assert(f:read("*a"))
    f:close()

    if raw then return s end

    s = string.gsub(s, "^%s+", "")
    s = string.gsub(s, "%s+$", "")
    s = string.gsub(s, "[\n\r]+", " ")

    return s
end

local unistd =  require("posix.unistd")

function cmd.exec(bin, args)
    local pid, _ = unistd.fork()

    if pid == 0 then
        unistd.execp(bin, args)
    end
end

return cmd
