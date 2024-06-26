function FindInjuryCause (playerPed)
    local lastDamageType = nil
    if IsPedInAnyVehicle(playerPed, false) and HasEntityBeenDamagedByAnyVehicle(playerPed) then
        lastDamageType = 'Accident'
    elseif (not IsPedInAnyVehicle(playerPed, false)) and HasEntityBeenDamagedByAnyVehicle(playerPed) then
        lastDamageType = 'Vehicle'
    elseif HasPedBeenDamagedByWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), 0) then
        lastDamageType = 'Unarmed Melee'
        print(GetHashKey('WEAPON_UNARMED'))
    else
        local wasStabbed = false
        local wasShotSolid = false
        local wasShotBuck = false
        local wasTaserProngs = false

        for _, weaponName in ipairs(Config.stabWeapons) do
            if HasPedBeenDamagedByWeapon(playerPed, GetHashKey(weaponName), 0) then
                wasStabbed = true
                break
            end
        end

        for _, weaponName in ipairs(Config.gunWeaponsSolid) do
            if HasPedBeenDamagedByWeapon(playerPed, GetHashKey(weaponName), 0) then
                wasShotSolid = true
                break
            end
        end

        for _, weaponName in ipairs(Config.gunWeaponsBuck) do
            if HasPedBeenDamagedByWeapon(playerPed, GetHashKey(weaponName), 0) then
                wasShotBuck = true
                break
            end
        end

        for _, weaponName in ipairs(Config.stunDeployables) do
            if HasPedBeenDamagedByWeapon(playerPed, GetHashKey(weaponName), 0) then
                wasTaserProngs = true
                break
            end
        end

        if wasStabbed then
            lastDamageType = 'Stab'
        elseif (not wasStabbed) and HasPedBeenDamagedByWeapon(playerPed, 0, 1) then
            lastDamageType = 'Blunt Weapon'
        elseif wasShotSolid then
            lastDamageType = 'Shot Solid Rounds'
        elseif wasShotBuck then
            lastDamageType = 'Shot Buck Rounds'
        elseif wasTaserProngs then
            lastDamageType = 'Taser Prongs'
        elseif HasPedBeenDamagedByWeapon(playerPed,0,2) then
            lastDamageType = 'Other Weapon'
        else
            lastDamageType = 'Other (Explosion, Drowning, etc.)'
        end
    end
    return lastDamageType
end