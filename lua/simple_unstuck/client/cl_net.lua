// Net
hook.Add("InitPostEntity", "SimpleUnstuck:InitPostEntity", function()
    // Load simpleUnstuck.Config from server
    net.Start("Simple_Unstuck")
    net.WriteUInt(1, 8)
    net.SendToServer()
end)

/* Net from server
    1: Message
*/

// Send net
local function sendNet(id, func)
    net.Start("Simple_Unstuck")
    net.WriteUInt(id, 8)
    if func then func() end
    net.SendToServer()
end

function simpleUnstuck.unstuckMe()
    sendNet(2)
end

// Receive net
local netFunc = {
    [1] = function()
        local msg = net.ReadString()
        chat.AddText(Color(228, 188, 57), "[Simple Unstuck] ", Color(255, 255, 255), msg)
    end
}

net.Receive("Simple_Unstuck", function(len)
    local type = net.ReadUInt(8)
    if (netFunc[type]) then
        netFunc[type]()
    end
end)