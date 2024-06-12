RegisterNetEvent("InjurySystem:getGameInjury")
AddEventHandler("InjurySystem:getGameInjury", function ()
    local src = source
    local cid = ESX.GetPlayerFromId(src).cid
    print("Server received request from client with serverID: " .. tostring(src) .. tostring(cid))
    TriggerClientEvent("InjurySystem:retGameInjury", src, "JSON handshake works!")
end)