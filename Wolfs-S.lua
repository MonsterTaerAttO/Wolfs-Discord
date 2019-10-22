local configs = nil

Citizen.CreateThread(function()
    local results = LoadConfig()
    if results == false then
        print("[Wolfs Discord] Couldnt find 'config.json'")
    end
end)


RegisterNetEvent("Wolfs:RequestConfig")
AddEventHandler("Wolfs:RequestConfig", function()
    local handler = source
    if configs ~= nil then
        TriggerClientEvent("Wolfs:GotchaConfig", source, configs)
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
