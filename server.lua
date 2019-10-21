-- Big thanks to Xander1998 for helping with creating a json config!

local configs = nil

Citizen.CreateThread(function()
  local results = LoadConfig()
  if results == false then
    print("[DR ERROR]: Couldn't load config `config.json`")
  end
end)

RegisterNetEvent("DR:RequestConfig")
AddEventHandler("DR:RequestConfig", function()
  local handle = source
  if configs ~= nil then
    TriggerClientEvent("DR:RecieveConfig", source, configs)
  end
end)

function LoadConfig()
  local load = LoadResourceFile(GetCurrentResourceName(), "./config.json")
  if load ~= nil then
    configs = json.decode(load)
    return true
  else
    return false
  end
end