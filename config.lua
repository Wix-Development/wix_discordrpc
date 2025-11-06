-- __          _________   __    _____                 _                                  _   
-- \ \        / /_   _\ \ / /   |  __ \               | |                                | |  
--  \ \  /\  / /  | |  \ V /    | |  | | _____   _____| | ___  _ __  _ __ ___   ___ _ __ | |_ 
--   \ \/  \/ /   | |   > <     | |  | |/ _ \ \ / / _ \ |/ _ \| '_ \| '_ ` _ \ / _ \ '_ \| __|
--    \  /\  /   _| |_ / . \    | |__| |  __/\ V /  __/ | (_) | |_) | | | | | |  __/ | | | |_ 
--     \/  \/   |_____/_/ \_\   |_____/ \___| \_/ \___|_|\___/| .__/|_| |_| |_|\___|_| |_|\__|
--                                                            | |                             
--                                                            |_|                                                                   
Config = {}

Config.UpdateInterval = 60000 -- Update interval in milliseconds (default: 60 seconds)
Config.PlayerCountInterval = 5 * 60000 -- Interval to request player count from server in milliseconds (default: 5 minutes)

Config.ApplicationID = '1349666369787924574' -- Discord Application ID (If you need help refer to the documentation https://wix-development.gitbook.io/documentation/free/discord-rpc/discord-application-guide)

Config.LargeImageKey = 'logo_no-background' -- Name of the large image assetq
Config.LargeImageText = 'Wix Development' -- Text displayed when hovering over the large image (If you need help refer to the documentation https://wix-development.gitbook.io/documentation/free/discord-rpc/discord-application-guide)

Config.SmallImageKey = 'logo_no-background' -- Name of the small image asset
Config.SmallImageText = 'Wix Development' -- Text displayed when hovering over the small image (If you need help refer to the documentation https://wix-development.gitbook.io/documentation/free/discord-rpc/discord-application-guide)

-- Details and state text with placeholders
-- {playerName} - The name of the player
-- {playerID} - The ID of the player
-- {playerCount} - The number of players online
Config.Details = '{playerName} [{playerID}] | Players: {playerCount}'

-- Buttons with labels and URLs
Config.Buttons = {
    {label = 'Discord', url = 'https:/discord.gg/invite'}, -- Example: Discord button
    {label = 'Connect', url = 'https://cfx.re/join/xxxxxx'}, -- Example: Connect button
}