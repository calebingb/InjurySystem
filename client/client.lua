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
    local playerPed = PlayerPedId()
    local health = GetEntityHealth(playerPed)

    if health < previousHealth then
        -- Player Injured
        local _, boneVal = GetPedLastDamageBone(playerPed)

        --local causeOfDamage = GetPedSourceOfDamage(playerPed)

        local lastDamageType = nil
        if IsPedInAnyVehicle(playerPed, false) then
            print("Player not in vehicle")
            lastDamageType = 'Vehicle'
        elseif HasPedBeenDamagedByWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), 0) then
            lastDamageType = 'Unarmed Melee'
        else
            local wasStabbed = false

            for _, weaponHash in ipairs(Config.stabWeaponHashes) do
                if HasPedBeenDamagedByWeapon(playerPed, weaponHash, 0) then
                    wasStabbed = true
                    break
                end
            end

            if wasStabbed then
                lastDamageType = 'Stab'
            else
                lastDamageType = 'Other'
            end
        end

        print("Damaged from: " .. lastDamageType)

        TriggerServerEvent('InjurySystem:playerInjured', xID, (previousHealth - health), boneVal)
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

AddEventHandler('InjurySystem:playerInjured', function (damage)
    print("You were injured, where you took damage of: " .. damage)
end)