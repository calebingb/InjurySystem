RegisterCommand('skel', function (source)
    print("Triggering Server event for skel...")
    TriggerServerEvent("InjurySystem:getGameInjury")
end, false)

RegisterNetEvent("InjurySystem:retGameInjury")
AddEventHandler("InjurySystem:retGameInjury", function (json)
    print(json)
end)