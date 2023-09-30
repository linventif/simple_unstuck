//
// Server Network
//

/* Net from server
    1: Message
*/

// Send net
local function sendNet(id, func)
    net.Start("SimpleUnstuck")
    net.WriteUInt(id, 8)
    if func then func() end
    net.SendToServer()
end

function simpleUnstuck.unstuckMe()
    sendNet(1)
end

// Receive net
local netFunc = {
    [1] = function()
        local msg = net.ReadString()
        chat.AddText(Color(228, 188, 57), "[Simple Unstuck] ", Color(255, 255, 255), msg)
    end
}

net.Receive("SimpleUnstuck", function(len)
    local type = net.ReadUInt(8)
    if (netFunc[type]) then
        netFunc[type]()
    end
end)