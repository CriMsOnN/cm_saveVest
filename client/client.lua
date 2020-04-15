local loadPlayer = false

RegisterNetEvent('cm_savevest:SetArmor')
AddEventHandler('cm_savevest:SetArmor', function(source)
    Citizen.Wait(10000)
    SetPedArmour(PlayerPedId(), source)
    SetPedComponentVariation(PlayerPedId(), 9, 27, 5, 0)
    loadPlayer = true
end)

local RefreshArmor = 60000

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(0)
        if loadPlayer == true then
            TriggerServerEvent('cm_savevest:RefreshArmor', GetPedArmour(PlayerPedId()))
            Citizen.Wait(RefreshArmor)
        end

    end
end)
