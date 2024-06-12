RegisterNetEvent("InjurySystem:getGameInjury")
AddEventHandler("InjurySystem:getGameInjury", function ()
    local src = source
    print("Server received request from client with serverID: " .. tostring(src))
    TriggerClientEvent("InjurySystem:retGameInjury", src, "JSON handshake works!")
end)