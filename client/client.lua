local previousHealth = 0

local xID = nil
function GetID()
    if (ESX.IsPlayerLoaded()) then 
        xID = ESX.GetPlayerData().identifier
        print ("xID = " .. xID)
    else
        print("Waiting to load in...")
        Citizen.Wait(1000)
        GetID()
    end
end

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
    GetID()
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