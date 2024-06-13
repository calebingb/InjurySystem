RegisterCommand('skel', function (source)
    print("Triggering Server event for skel...")
    TriggerServerEvent("InjurySystem:getGameInjury")
end, false)

RegisterNetEvent("InjurySystem:retGameInjury")
AddEventHandler("InjurySystem:retGameInjury", function (jsonString)
    local injuryData, pos, err = json.decode(jsonString, 1, nil)
    if err then
        print("Issue with JSON data: " .. error)
    end

    for boneID, injuries in pairs(injuryData) do
        print("Injury data for bone " .. boneID .. "...")
        for _, injury in ipairs(injuries) do
            local damage = injury.damage
            local injurySeverity = injury.severity
            local damageCause = injury.damageCause

            print("Damage: " .. damage .. ", Injury Severity: " .. injurySeverity .. ", Injury Cause: " .. damageCause)
        end
    end
end)