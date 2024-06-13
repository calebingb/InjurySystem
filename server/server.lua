RegisterNetEvent('InjurySystem:playerInjured')
AddEventHandler('InjurySystem:playerInjured', function (xID, damage, boneId, lastDamageType)
    local xPlayer = ESX.GetPlayerFromIdentifier(xID)

    if xPlayer then
        print (xPlayer.cid);

        local severity = "minor"
        if damage >= Config.majorInjuryThreshold then
            severity = "major"
        end

        print("Player " .. xPlayer.cid .. " was injured for " .. damage .. " the wound type is: " .. severity)
        
        local injuryData = {
            [tostring(boneId)] = {{
                damage = damage,
                severity = severity,
                damageCause = lastDamageType
            }}
        }

        local jsonString = json.encode(injuryData)

        local sql = [[
            INSERT INTO injuries (cid, injuries)
            VALUES (?, ?)
            ON DUPLICATE KEY UPDATE injuries = JSON_MERGE(injuries, VALUES(injuries));
        ]]

        print (sql)
        MySQL.prepare(sql, {tostring(xPlayer.cid), jsonString})
    end
end)