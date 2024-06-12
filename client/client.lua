local previousHealth = 0

local xID = ESX.GetPlayerData().identifier

function MonitorHealth()
    local playerPed = GetPlayerPed(-1)
    local health = GetEntityHealth(playerPed)

    if health < previousHealth then
        -- Player Injured
        local playerID = GetPlayerServerId(-1)
        local _, boneVal = GetPedLastDamageBone(playerPed)
        TriggerServerEvent('InjurySystem:playerInjured', xID)
        TriggerEvent('InjurySystem:playerInjured', previousHealth - health)
    end

    if previousHealth < health then
        print("You were healed!")
    end

    previousHealth = health
end

AddEventHandler('playerSpawned', function ()
    xID = ESX.GetPlayerData().identifier

    local playerPed = GetPlayerPed(-1)
    previousHealth = GetEntityHealth(playerPed)
    
end)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(1000)
        MonitorHealth()
    end
end)

AddEventHandler('InjurySystem', function (damage)
    print("You were injured, where you took damage of: " .. damage)
end)