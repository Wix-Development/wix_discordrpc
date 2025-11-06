exports['wix_core']:UpdateChecker(GetResourceMetadata(GetCurrentResourceName(), 'version', 0))

Citizen.CreateThread(function()
    while true do
        local players = GetPlayers()
        local count = #players
        local maxPlayers = GetConvarInt('sv_maxclients', 64)

        TriggerClientEvent('wix_discordrpc:updateCount', -1, count, maxPlayers)
        Wait(Config.PlayerCountInterval)
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        exports['wix_core']:Debug('RESOURCES', 'Resource restarted, updating RPC for all players...')
        TriggerClientEvent('wix_discordrpc:forceUpdate', -1)
    end
end)

RegisterNetEvent('wix_discordrpc:requestCount', function()
    local src = source
    local players = GetPlayers()
    local count = #players
    local maxPlayers = GetConvarInt('sv_maxclients', 64)
    exports['wix_core']:Debug('RESOURCES', 'Player count requested by client '.. src ..', sending update. Count: '.. count ..', Max Players: '.. maxPlayers)
    TriggerClientEvent('wix_discordrpc:updateCount', src, count, maxPlayers)
end)
