RegisterNetEvent("InjurySystem:getGameInjury")
AddEventHandler("InjurySystem:getGameInjury", function ()
    local src = source
    local cid = ESX.GetPlayerFromId(src).cid
    print("Server received request from client with serverID: " .. tostring(src) .. " and CID: " ..  tostring(cid))
    TriggerClientEvent("InjurySystem:retGameInjury", src, GetGameInjuries(cid))
end)


function GetGameInjuries (cid)
    local sql = [[
    SELECT injuries
    FROM injuries I
    WHERE I.cid = ?;]]

    local response = MySQL.prepare.await(sql, {cid})
    print(json.encode(response, { ident=true, sort_keys = true}))
    return response
end