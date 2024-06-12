RegisterNetEvent("InjurySystem:getGameInjury")
AddEventHandler("InjurySystem:getGameInjury", function (serverID)
    TriggerClientEvent("InjurySystem:retGameInjury", serverID, "JSON handshake works!")
end)