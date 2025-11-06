local playerCount = 1
local maxPlayers = GetConvarInt('sv_maxclients', 64)

RegisterNetEvent('wix_discordrpc:updateCount', function(count, max)
    exports['wix_core']:Debug('RESOURCES', 'Received player count update. Count: '.. (count or 'N/A') ..', Max: '.. (max or 'N/A'))
    playerCount = count or playerCount
    maxPlayers = max or maxPlayers
end)

function UpdateDiscordRPC()
    exports['wix_core']:Debug('RESOURCES', 'Starting Discord RPC update...')
    SetDiscordAppId(Config.ApplicationID)
    SetDiscordRichPresenceAsset(Config.LargeImageKey)
    SetDiscordRichPresenceAssetText(Config.LargeImageText)
    SetDiscordRichPresenceAssetSmall(Config.SmallImageKey)
    SetDiscordRichPresenceAssetSmallText(Config.SmallImageText)

    local playerId = PlayerId()
    local playerName = GetPlayerName(playerId)
    local playerIdString = tostring(GetPlayerServerId(playerId))
    local playerCountFormatted = string.format("%d/%d", playerCount, maxPlayers)

    exports['wix_core']:Debug('RESOURCES', 'Player data - Name: '.. (playerName or 'N/A') ..', ID: '.. playerIdString ..', Count: '.. playerCountFormatted)

    local details = Config.Details
        :gsub('{playerName}', playerName)
        :gsub('{playerID}', playerIdString)
        :gsub('{playerCount}', playerCountFormatted)

    exports['wix_core']:Debug('RESOURCES', 'Setting rich presence details: '.. details)
    SetRichPresence(details)

    for i, button in ipairs(Config.Buttons) do
        exports['wix_core']:Debug('RESOURCES', 'Setting button '.. i ..' - Label: '.. button.label ..', URL: '.. button.url)
        SetDiscordRichPresenceAction(i - 1, button.label, button.url)
    end
    exports['wix_core']:Debug('RESOURCES', 'Discord RPC update completed')
end

RegisterNetEvent('wix_discordrpc:forceUpdate', function()
    exports['wix_core']:Debug('RESOURCES', 'Force update triggered via event')
    UpdateDiscordRPC()
end)

AddEventHandler('onClientResourceStart', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    exports['wix_core']:Debug('RESOURCES', 'Resource started, requesting player count from server')
    TriggerServerEvent('wix_discordrpc:requestCount')

    CreateThread(function()
        exports['wix_core']:Debug('RESOURCES', 'Starting Discord RPC update thread with interval: '.. Config.UpdateInterval .. 'ms')
        while true do
            UpdateDiscordRPC()
            Wait(Config.UpdateInterval)
        end
    end)
end)