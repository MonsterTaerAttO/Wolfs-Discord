-----Big thanks to Xander1998 for helping me with this script.
-----This script was purely created to learn json. It works just fine, But more sophisticated releases will be coming in the future.

local configs = nil

local activePlayers = NetworkGetNumConnectedPlayers(PlayerId()) -- gets the number of connected players 
local playerName = GetPlayerName(source) --gets the players name


RegisterNetEvent("Wolfs:GotchaConfig")
AddEventHandler("Wolfs:GotchaConfig", function(config)
    configs = config
    if configs ~= nil then
        SetDiscordAppId(configs.appID)
        SetDiscordRichPresenceAsset(configs.Asset)
        SetDiscordRichPresenceAssetSmall(configs.AssetSmall)
        SetDiscordRichPresenceAssetSmallText(configs.SmallText)
        SetDiscordRichPresenceAssetText(configs.Text)
        SetRichPresence("" ..activePlayers.. "/ 32 || " ..playerName.. "")
        while true do
            Wait(0)
        end
    end
end)

Citizen.CreateThread(function()
    TriggerServerEvent("Wolfs:RequestConfig")
end)