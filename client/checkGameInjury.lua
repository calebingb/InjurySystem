RegisterCommand('InjurySystem:skel', function (source, args)
    print("Triggering Server event for skel...")
    print(source)
    --TriggerServerEvent("InjurySystem:getGameInjury",playerServerID)
end, false)

RegisterNetEvent("InjurySystem:retGameInjury")
AddEventHandler("InjurySystem:retGameInjury", function (xID, json)
    
end)