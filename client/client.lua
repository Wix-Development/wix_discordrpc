AddEventHandler("onClientResourceStart", function(resourceName)
    local scriptName = GetCurrentResourceName()
    if resourceName ~= scriptName then return end
    while true do
        SetDiscordAppId(Config.ApplicationID)
        SetDiscordRichPresenceAsset(Config.LargeImageKey)
        SetDiscordRichPresenceAssetText(Config.LargeImageText)
        SetDiscordRichPresenceAssetSmall(Config.SmallImageKey)
        SetDiscordRichPresenceAssetSmallText(Config.SmallImageText)

        local playerId = PlayerId()
        local playerName = GetPlayerName(playerId)
        local playerCount = #GetActivePlayers()
        local maxPlayers = GetConvarInt('sv_maxclients', 48)
        local playerIdString = tostring(GetPlayerServerId(playerId))
        local playerCountFormatted = string.format("%d/%d", playerCount, maxPlayers)

        local details = Config.Details
            :gsub('{playerName}', playerName)
            :gsub('{playerID}', playerIdString)
            :gsub('{playerCount}', playerCountFormatted)
        exports['wix_core']:Debug('RESOURCES', 'Updating Discord Rich Presence: ' .. details)
        SetRichPresence(details)

        for i, button in ipairs(Config.Buttons) do
            SetDiscordRichPresenceAction(i - 1, button.label, button.url)
        end

        Citizen.Wait(Config.UpdateInterval)
    end
end)