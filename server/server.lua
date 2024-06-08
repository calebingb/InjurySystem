RegisterNetEvent('playerInjured')
AddEventHandler('playerInjured', function (ped, playerID, damage)
    local sourceOfDamage = GetPedSourceOfDamage(ped)
    print("Player " .. playerID .. " was injured and took damage of " .. damage .. " and the source was " .. sourceOfDamage)
    
end)