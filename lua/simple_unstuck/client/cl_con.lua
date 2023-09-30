//
// Console
//

for k, v in pairs(simpleUnstuck.Config.command) do
    concommand.Add(k, function()
        simpleUnstuck.unstuckMe()
    end)
end