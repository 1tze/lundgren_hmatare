Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local isInVehicle = IsPedInAnyVehicle(ped, false)

        Citizen.Wait(Config.TickTime)

        if isInVehicle then
            Citizen.Wait(0)

            local vehicle = GetVehiclePedIsIn(ped, false)
            local fuel = GetVehicleFuelLevel(vehicle)
            local speed = GetEntitySpeed(vehicle) * 3.6

            SendVehicleInfoToNUI(isInVehicle, speed, fuel)
        else
            SendVehicleInfoToNUI(false)
        end
    end
end)

function SendVehicleInfoToNUI(isInVehicle, speed, fuel)
    local vehicleInfo = {
        isInVehicle = isInVehicle,
        speed = speed,
        fuel = fuel,
    }

    SendNUIMessage(vehicleInfo)
end