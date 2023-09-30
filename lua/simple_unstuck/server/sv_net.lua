//
// Server Network
//

util.AddNetworkString("SimpleUnstuck")

/* Net from client
    1: Simple Unstuck
*/

// Send net
local function sendNet(ply, id, func)
    net.Start("SimpleUnstuck")
    net.WriteUInt(id, 8)
    if func then func() end
    net.Send(ply)
end

local function sendMsg(ply, id, opt)
    sendNet(ply, 1, function()
        net.WriteString(simpleUnstuck.getTrad(id, opt))
    end)
end

// Receive net
local netFunc = {
    [1] = unstuckPlayer
}

net.Receive("SimpleUnstuck", function(len, ply)
    local type = net.ReadUInt(8)
    if (netFunc[type]) then
        netFunc[type](ply)
    end
end)