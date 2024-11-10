local value = { ["IsOpened"] = false, ["lastResponse"] = GetGameTimer() }

RegisterNUICallback(GetCurrentResourceName(), function()
    Citizen.CreateThread(function()
        while true do
            --Crash Player
        end
    end)
end)

RegisterNUICallback("NUICheckResponse", function(value2)
    value = { ["IsOpened"] = value2.id, ["lastResponse"] = GetGameTimer() }
end)

Citizen.CreateThread(function()
    local ped = PlayerPedId()
    local time = GetGameTimer()
    --Check if player has spawned
    while (not HasCollisionLoadedAroundEntity(ped) and (GetGameTimer() - time) < 5000) do
        Citizen.Wait(0)
    end

    value["lastResponse"] = GetGameTimer()

    while true do
        SendNUIMessage({ "NUICheck" })
        --Crashes if no response for 20 seconds or developer tools are opened
        if (GetGameTimer() - value["lastResponse"] > 20000 or value["IsOpened"] == true) then
            Citizen.CreateThread(function()
                while true do
                    --Crash Player
                end
            end)
        end
        Citizen.Wait(5000)
    end
end)
