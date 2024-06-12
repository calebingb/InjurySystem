RegisterNetEvent('InjurySystem:playerInjured')
AddEventHandler('InjurySystem:playerInjured', function (playerID)
    print (playerID)
    local xPlayer = ESX.GetPlayerFromId(playerID)

    print (xPlayer.cid);
end)