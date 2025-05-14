local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("mechanickit", function(source, item)
    TriggerClientEvent("d3-mechanicupgrades:useKit", source)
end)

QBCore.Functions.CreateUseableItem("aftermarketkit", function(source, item)
    TriggerClientEvent("d3-mechanicupgrades:useAfterMarketKit", source)
end)

QBCore.Functions.CreateUseableItem("repairkit", function(source, item)
    TriggerClientEvent("d3-vehiclefix:useRepairKit", source)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem("repairkit", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["repairkit"], "remove")
end)

RegisterNetEvent('d3-mechanicupgrades:saveVehicleData', function(vehicleData)
    local playerId = vehicleData.citizenid
    local vehiclePlate = vehicleData.plate
    local mods = json.encode(vehicleData.mods)

    local query = "INSERT INTO player_vehicles (citizenid, vehicle, plate, mods) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE mods = ?"
    MySQL.Async.execute(query, {playerId, vehicleData.vehicle, vehiclePlate, mods, mods}, function(affectedRows)
        if affectedRows > 0 then
            QBCore.Functions.Notify("Vehicle data saved successfully!", "success")
        else
            QBCore.Functions.Notify("Failed to save vehicle data.", "error")
        end
    end)
end)

RegisterNetEvent('d3-mechanicupgrades:getVehicleData', function(plate)
    local query = "SELECT * FROM player_vehicles WHERE plate = ?"
    MySQL.Async.fetchAll(query, {plate}, function(result)
        if result[1] then
            TriggerClientEvent('d3-mechanicupgrades:receiveVehicleData', source, result[1])
        else
            TriggerClientEvent('d3-mechanicupgrades:receiveVehicleData', source, nil)
        end
    end)
end)
