//
// Chat
//

hook.Add("OnPlayerChat", "SimpleUnstuck:ChatTrigger", function(ply, text)
    if (ply != LocalPlayer()) then return end // if not local player

    // if text contain one of the command
    for word, value in pairs(simpleUnstuck.Config.word) do
        if !value then continue end
        if (string.find(text:lower(), word)) then
            // send net to server
            simpleUnstuck.unstuckMe()
            return true
        end
    end
end)