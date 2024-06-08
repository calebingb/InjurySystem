local previousHealth = 0

function MonitorHealth()
    local playerPed = GetPlayerPed(-1)
    local health = GetEntityHealth(playerPed)

    if health < previousHealth then
        -- Player Injured
        local playerID = GetPlayerServerId(PlayerPedId())
        TriggerServerEvent('playerInjured', playerID, previousHealth - health)
        TriggerEvent('playerInjured', previousHealth - health)
    end

    previousHealth = health
end

AddEventHandler('playerSpawned', function ()
    local playerPed = GetPlayerPed(-1)
    previousHealth = GetEntityHealth(playerPed)
    
end)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(1000)
        MonitorHealth()
    end
end)

AddEventHandler('playerInjured', function (damage)
    print("You were injured, where you took damage of: " .. damage)
end)