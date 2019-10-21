local configs = nil
local activePlayers = NetworkGetNumConnectedPlayers(GetPlayerPed(-1)) -- active players
local playerName = GetPlayerName(source) --Gets the players name


RegisterNetEvent("DR:RecieveConfig")
AddEventHandler("DR:RecieveConfig", function(config)
  configs = config
  if configs ~= nil then
    SetDiscordAppId(configs.appToken) -- Dont edit these. goto the config.json
    SetDiscordRichPresenceAsset(configs.mainImage)
    SetDiscordRichPresenceAssetSmall(configs.smallImage)
    SetDiscordRichPresenceAssetSmallText(configs.smallText)
    SetDiscordRichPresenceAssetText(configs.moreText)
    SetRichPresence("" .. activePlayers .. "/ 32 || " .. playerName .. "")
    while true do 
      Wait(0)
    end
  end
end)

-- Client Script Called
Citizen.CreateThread(function()
  TriggerServerEvent("DR:RequestConfig")
end)

-- Again big thanks to Xander1998 for helping with this script!
