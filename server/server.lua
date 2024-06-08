RegisterNetEvent('playerInjured')
AddEventHandler('playerInjured', function (playerID, damage)
    print("Player " .. playerID .. " was injured and took damage of " .. damage)
    
end)