ESX          = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('esx:playerLoaded', function(id) 
    local xPlayer = ESX.GetPlayerFromId(id)
    MySQL.Async.fetchScalar("SELECT armor FROM users WHERE identifier = @identifier", {
        ['@identifier'] = xPlayer.getIdentifier()
    }, function(data) 
        if (data ~= nil) then
            TriggerClientEvent('cm_savevest:SetArmor', id, data)
        end
    end)
end)

RegisterServerEvent('cm_savevest:RefreshArmor')
AddEventHandler('cm_savevest:RefreshArmor', function(armor) 
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    MySQL.Async.execute("UPDATE users SET armor = @armor WHERE identifier = @identifier", {
        ['@identifier'] = xPlayer.getIdentifier(),
        ['@armor'] = armor
    })
end)