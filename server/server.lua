local MySQL = exports['oxmysql']

RegisterNetEvent('InjurySystem:playerInjured')
AddEventHandler('InjurySystem:playerInjured', function (xID, damage, boneId)
    local xPlayer = ESX.GetPlayerFromIdentifier(xID)

    if xPlayer then
        print (xPlayer.cid);

        local damageType = "minor"
        if damage >= Config.majorInjuryThreshold then
            damageType = "major"
        end

        print("Player " .. xPlayer.cid .. " was injured for " .. damage .. " the wound type is: " .. damageType)
        
        local json = '{"?": [{"damage": ?, "damageType": "?"}]}'
        json = string.gsub(json, '"?"', '"%s"')
        json = string.format(json, boneId, damage, damageType)

        local sql = 'INSERT INTO injuries (cid, injuries) VALUES (?, ?) ON DUPLICATE KEY UPDATE injuries = JSON_MERGE(injuries, VALUES(injuries));'

        print (sql)
        MySQL.prepare(sql, {xPlayer.cid, json})
    end
end)