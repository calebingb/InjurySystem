RegisterNetEvent('playerInjured')
AddEventHandler('playerInjured', function (playerID, damage, bone)
    local sourceOfDamage = GetPedSourceOfDamage(playerID)
    print("Player " .. playerID .. " was injured and took damage of " .. damage .. " and the source was " .. sourceOfDamage .. "and the last damaged bone was " .. bone)
    
end)