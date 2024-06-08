RegisterNetEvent('playerInjured')
AddEventHandler('playerInjured', function (playerID, damage)
    local sourceOfDamage = GetPedSourceOfDamage(playerID)
    print("Player " .. playerID .. " was injured and took damage of " .. damage .. " and the source was " .. sourceOfDamage)
    
end)