RegisterNetEvent('InjurySystem:playerInjured')
AddEventHandler('InjurySystem:playerInjured', function (playerID)
    print (playerID)
    local xPlayer = ESX.GetPlayerFromIdentifier(playerID)

    print (xPlayer.cid);
end)