local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("d3-mechanicupgrades:useKit", function()
    local playerPed = PlayerPedId()
    local playerData = QBCore.Functions.GetPlayerData()

    if playerData.job.name ~= "tuner" then
        QBCore.Functions.Notify("You need to be a tuner to use the mechanic kit.", "error")
        return
    end

    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if vehicle == 0 or GetPedInVehicleSeat(vehicle, -1) ~= playerPed then
        QBCore.Functions.Notify("You must be the driver in a vehicle to use this kit.", "error")
        return
    end

    TriggerEvent("d3-mechanicupgrades:openMenu")
end)


RegisterNetEvent("d3-mechanicupgrades:useAfterMarketKit", function()
    local playerPed = PlayerPedId()
    local playerData = QBCore.Functions.GetPlayerData()

    if playerData.job.name ~= "tuner" then
        QBCore.Functions.Notify("You need to be a tuner to use the mechanic kit.", "error")
        return
    end

    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if vehicle == 0 or GetPedInVehicleSeat(vehicle, -1) ~= playerPed then
        QBCore.Functions.Notify("You must be the driver in a vehicle to use this kit.", "error")
        return
    end

    TriggerEvent("d3-mechanicupgrades:openBulletproofMenu")
end)


RegisterNetEvent("d3-mechanicupgrades:openMenu", function()
    local menu = {
        { header = "Mechanic Kit Menu", isMenuHeader = true },
        {
            header = "Change Color",
            txt = "Modify your vehicle's paint color",
            params = { event = "d3-mechanicupgrades:changeColor" }
        },
        {
            header = "Change Window Tint",
            txt = "Modify your vehicle's window tint",
            params = { event = "d3-mechanicupgrades:changeWindowTint" }
        },
        {
            header = "Change Livery",
            txt = "Modify your vehicle's livery",
            params = { event = "d3-mechanicupgrades:changeLivery" }
        },
        {
            header = "Change Wheels",
            txt = "Modify your vehicle's wheels",
            params = { event = "d3-mechanicupgrades:changeWheels" }
        },
        {
            header = "Change Grills",
            txt = "Modify your vehicle's front grill",
            params = { event = "d3-mechanicupgrades:changeGrill" }
        },
        {
            header = "Change Spoilers",
            txt = "Modify your vehicle's spoiler",
            params = { event = "d3-mechanicupgrades:changeSpoiler" }
        },
        {
            header = "Change Horn",
            txt = "Modify your vehicle's horn",
            params = { event = "d3-mechanicupgrades:changeHorn" }
        },
        {
            header = "Change Lips",
            txt = "Modify your vehicle's front lips",
            params = { event = "d3-mechanicupgrades:changeLip" }
        },
        {
            header = "Change Bumpers",
            txt = "Modify your vehicle's bumpers",
            params = { event = "d3-mechanicupgrades:changeBumper" }
        },
        {
            header = "Change Interior",
            txt = "Modify your vehicle's interior",
            params = { event = "d3-mechanicupgrades:changeInterior" }
        },
        {
            header = "Modify Neons",
            txt = "Modify your vehicle's neon lights",
            params = { event = "d3-mechanicupgrades:changeNeons" }
        },
        {
            header = "Modify Xenons",
            txt = "Toggle Xenon headlights",
            params = { event = "d3-mechanicupgrades:changeXenons" }
        },
        {
            header = "Modify Tire Smoke",
            txt = "Change tire smoke color",
            params = { event = "d3-mechanicupgrades:changeSmokeColor" }
        },
        {
            header = "Modify Extras",
            txt = "Modify your vehicle's extra components",
            params = { event = "d3-mechanicupgrades:changeExtras" }
        },
        {
            header = "Functions",
            txt = "Special vehicle functions",
            params = { event = "d3-mechanicupgrades:specialFunctions" }
        },
        {
            header = "Close",
            params = { event = "d3-menu:closeMenu" }
        }
    }

    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('d3-mechanicupgrades:changeColor', function()
    local colors = {
        {label = "Black", value = 0},
        {label = "Carbon Black", value = 147},
        {label = "Graphite", value = 1},
        {label = "Anhracite Black", value = 11},
        {label = "Red", value = 27},
        {label = "Torino Red", value = 28},
        {label = "Formula Red", value = 29},
        {label = "Lava Red", value = 150},
        {label = "Blue", value = 64},
        {label = "Dark Blue", value = 62},
        {label = "Saxon Blue", value = 63},
        {label = "Nautical Blue", value = 69},
        {label = "Ultra Blue", value = 70},
        {label = "White", value = 111},
        {label = "Frost White", value = 112},
        {label = "Green", value = 55},
        {label = "Dark Green", value = 49},
        {label = "Racing Green", value = 50},
        {label = "Olive Green", value = 52},
        {label = "Bright Green", value = 53},
        {label = "Yellow", value = 88},
        {label = "Race Yellow", value = 89},
        {label = "Bronze", value = 90},
        {label = "Orange", value = 38},
        {label = "Bright Orange", value = 138},
        {label = "Gold", value = 37},
        {label = "Brushed Gold", value = 158},
        {label = "Chrome", value = 120},
        {label = "Matte Black", value = 12},
        {label = "Matte Gray", value = 13},
        {label = "Matte Light Gray", value = 14},
        {label = "Matte White", value = 131},
        {label = "Matte Red", value = 39},
        {label = "Matte Dark Red", value = 40},
        {label = "Matte Orange", value = 41},
        {label = "Matte Yellow", value = 42},
        {label = "Matte Green", value = 128},
        {label = "Matte Blue", value = 83},
        {label = "Matte Midnight Blue", value = 82},
        {label = "Matte Purple", value = 149},
        {label = "Matte Dark Purple", value = 145},
    }

    local options = {
        { header = "Choose Paint Color", isMenuHeader = true }
    }

    for _, color in ipairs(colors) do
        table.insert(options, {
            header = color.label,
            params = {
                event = "d3-mechanicupgrades:applyColor",
                args = color.value
            }
        })
    end

    table.insert(options, { header = "⬅ Back", params = { event = "d3-mechanicupgrades:openMenu" } })

    exports['qb-menu']:openMenu(options)
end)



RegisterNetEvent('d3-mechanicupgrades:applyColor', function(color)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleColours(vehicle, color, color)
    QBCore.Functions.Notify("Color changed successfully!", "success")
end)

RegisterNetEvent('d3-mechanicupgrades:changeWindowTint', function()
    local tints = {
        {label = "None", value = 0},
        {label = "Pure Black", value = 1},
        {label = "Dark Smoke", value = 2},
        {label = "Light Smoke", value = 3},
        {label = "Limo", value = 4},
        {label = "Green", value = 5},
    }

    local options = {
        { header = "Choose Window Tint", isMenuHeader = true }
    }

    for _, tint in ipairs(tints) do
        table.insert(options, {
            header = tint.label,
            params = {
                event = "d3-mechanicupgrades:applyWindowTint",
                args = tint.value
            }
        })
    end

    table.insert(options, { header = "⬅ Back", params = { event = "d3-mechanicupgrades:openMenu" } })

    exports['qb-menu']:openMenu(options)
end)



RegisterNetEvent('d3-mechanicupgrades:applyWindowTint', function(tint)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleWindowTint(vehicle, tint)
    QBCore.Functions.Notify("Window tint applied!", "success")
end)



RegisterNetEvent('d3-mechanicupgrades:changeLivery', function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleModKit(vehicle, 0)
    local liveryCount = GetVehicleLiveryCount(vehicle)

    if liveryCount <= 0 then
        QBCore.Functions.Notify("This vehicle has no liveries.", "error")
        return
    end

    local options = {
        { header = "Choose Livery", isMenuHeader = true }
    }

    for i = 0, liveryCount - 1 do
        table.insert(options, {
            header = "Livery " .. (i + 1),
            params = {
                event = "d3-mechanicupgrades:applyLivery",
                args = i
            }
        })
    end

    table.insert(options, { header = "⬅ Back", params = { event = "d3-mechanicupgrades:openMenu" } })

    exports['qb-menu']:openMenu(options)
end)



RegisterNetEvent('d3-mechanicupgrades:applyLivery', function(index)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleModKit(vehicle, 0)
    SetVehicleLivery(vehicle, index)
    QBCore.Functions.Notify("Livery applied!", "success")
end)



RegisterNetEvent('d3-mechanicupgrades:changeWheels', function()
    local categories = {
        { label = "Sport", value = 0 },
        { label = "Muscle", value = 1 },
        { label = "Lowrider", value = 2 },
        { label = "SUV", value = 3 },
        { label = "Offroad", value = 4 },
        { label = "Tuner", value = 5 },
        { label = "Bike", value = 6 },
        { label = "High End", value = 7 },
        { label = "Benny's", value = 8 },
        { label = "Open Wheel", value = 9 },
        { label = "Street", value = 11 },
        { label = "Track", value = 10 }
    }

    local options = {
        { header = "Choose Wheel Category", isMenuHeader = true }
    }

    for _, category in ipairs(categories) do
        table.insert(options, {
            header = category.label,
            params = {
                event = "d3-mechanicupgrades:showWheelOptions",
                args = category.value
            }
        })
    end

    table.insert(options, { header = "⬅ Back", params = { event = "d3-mechanicupgrades:openMenu" } })

    exports['qb-menu']:openMenu(options)
end)


RegisterNetEvent('d3-mechanicupgrades:showWheelOptions', function(category)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleModKit(vehicle, 0)
    SetVehicleWheelType(vehicle, category)
    local wheelCount = GetNumVehicleMods(vehicle, 23)
    local options = {
        { header = "Choose Wheel", isMenuHeader = true }
    }

    for i = 0, wheelCount - 1 do
        table.insert(options, {
            header = "Wheel " .. i,
            params = {
                event = "d3-mechanicupgrades:applyWheel",
                args = {index = i, category = category}
            }
        })
    end

    table.insert(options, { header = "⬅ Back", params = { event = "d3-mechanicupgrades:changeWheels" } })

    exports['qb-menu']:openMenu(options)
end)


RegisterNetEvent('d3-mechanicupgrades:applyWheel', function(data)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleModKit(vehicle, 0)
    SetVehicleWheelType(vehicle, data.category)
    SetVehicleMod(vehicle, 23, data.index, false)
    QBCore.Functions.Notify("Wheel applied!", "success")
end)


RegisterNetEvent('d3-mechanicupgrades:changeGrill', function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleModKit(vehicle, 0)
    local grillCount = GetNumVehicleMods(vehicle, 1) 

    local options = {
        { header = "Choose Grill", isMenuHeader = true }
    }

    for i = 0, grillCount - 1 do
        table.insert(options, {
            header = "Grill " .. i,
            params = {
                event = "d3-mechanicupgrades:applyGrill",
                args = i
            }
        })
    end

    table.insert(options, { header = "⬅ Back", params = { event = "d3-mechanicupgrades:openMenu" } })

    exports['qb-menu']:openMenu(options)
end)

RegisterNetEvent('d3-mechanicupgrades:applyGrill', function(index)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleMod(vehicle, 1, index, false)
    QBCore.Functions.Notify("Grill updated!", "success")
end)

-- Spoilers Modification
RegisterNetEvent('d3-mechanicupgrades:changeSpoiler', function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleModKit(vehicle, 0)
    local spoilerCount = GetNumVehicleMods(vehicle, 0)  -- Spoilers are mod type 0

    local options = {
        { header = "Choose Spoiler", isMenuHeader = true }
    }

    for i = 0, spoilerCount - 1 do
        table.insert(options, {
            header = "Spoiler " .. i,
            params = {
                event = "d3-mechanicupgrades:applySpoiler",
                args = i
            }
        })
    end

    table.insert(options, { header = "⬅ Back", params = { event = "d3-mechanicupgrades:openMenu" } })

    exports['qb-menu']:openMenu(options)
end)

RegisterNetEvent('d3-mechanicupgrades:applySpoiler', function(index)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleMod(vehicle, 0, index, false)
    QBCore.Functions.Notify("Spoiler updated!", "success")
end)


RegisterNetEvent('d3-mechanicupgrades:changeHorn', function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleModKit(vehicle, 0)
    local hornCount = GetNumVehicleMods(vehicle, 14)
    local options = {
        { header = "Choose Horn", isMenuHeader = true }
    }

    for i = 0, hornCount - 1 do
        table.insert(options, {
            header = "Horn " .. i,
            params = {
                event = "d3-mechanicupgrades:applyHorn",
                args = i
            }
        })
    end

    table.insert(options, { header = "⬅ Back", params = { event = "d3-mechanicupgrades:openMenu" } })

    exports['qb-menu']:openMenu(options)
end)

RegisterNetEvent('d3-mechanicupgrades:applyHorn', function(index)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleMod(vehicle, 14, index, false)
    QBCore.Functions.Notify("Horn updated!", "success")
end)

RegisterNetEvent('d3-mechanicupgrades:changeLip', function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleModKit(vehicle, 0)
    local lipCount = GetNumVehicleMods(vehicle, 2)

    local options = {
        { header = "Choose Front Lip", isMenuHeader = true }
    }

    for i = 0, lipCount - 1 do
        table.insert(options, {
            header = "Lip " .. i,
            params = {
                event = "d3-mechanicupgrades:applyLip",
                args = i
            }
        })
    end

    table.insert(options, { header = "⬅ Back", params = { event = "d3-mechanicupgrades:openMenu" } })

    exports['qb-menu']:openMenu(options)
end)

RegisterNetEvent('d3-mechanicupgrades:applyLip', function(index)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleMod(vehicle, 2, index, false)
    QBCore.Functions.Notify("Front lip updated!", "success")
end)


RegisterNetEvent('d3-mechanicupgrades:changeBumper', function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleModKit(vehicle, 0)
    local bumperCount = GetNumVehicleMods(vehicle, 3)

    local options = {
        { header = "Choose Bumper", isMenuHeader = true }
    }

    for i = 0, bumperCount - 1 do
        table.insert(options, {
            header = "Bumper " .. i,
            params = {
                event = "d3-mechanicupgrades:applyBumper",
                args = i
            }
        })
    end

    table.insert(options, { header = "⬅ Back", params = { event = "d3-mechanicupgrades:openMenu" } })

    exports['qb-menu']:openMenu(options)
end)

RegisterNetEvent('d3-mechanicupgrades:applyBumper', function(index)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleMod(vehicle, 3, index, false)
    QBCore.Functions.Notify("Bumper updated!", "success")
end)


RegisterNetEvent('d3-mechanicupgrades:changeInterior', function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleModKit(vehicle, 0)
    local interiorCount = GetNumVehicleMods(vehicle, 27)

    local options = {
        { header = "Interior Upgrades", isMenuHeader = true },
    }

    for i = 0, interiorCount - 1 do
        local label = GetLabelText(GetModTextLabel(vehicle, 27, i))
        table.insert(options, {
            header = label ~= "NULL" and label or ("Interior Style " .. i),
            params = {
                event = "d3-mechanicupgrades:applyInterior",
                args = i
            }
        })
    end


    table.insert(options, {
        header = "Change Interior Color",
        params = {
            event = "d3-mechanicupgrades:changeInteriorColor"
        }
    })


    table.insert(options, { header = "⬅ Back", params = { event = "d3-mechanicupgrades:openMenu" } })

    exports['qb-menu']:openMenu(options)
end)

RegisterNetEvent('d3-mechanicupgrades:applyInterior', function(index)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleMod(vehicle, 27, index, false)
    QBCore.Functions.Notify("Interior style updated!", "success")
end)

-- Interior Color Menu
RegisterNetEvent('d3-mechanicupgrades:changeInteriorColor', function()
    local colors = {
        { name = "Black", id = 0 },
        { name = "Graphite", id = 1 },
        { name = "Light Grey", id = 2 },
        { name = "Dark Grey", id = 3 },
        { name = "Red", id = 4 },
        { name = "Pink", id = 5 },
        { name = "Green", id = 6 },
        { name = "Blue", id = 7 },
        { name = "Yellow", id = 8 },
        { name = "Purple", id = 9 },
        { name = "Brown", id = 10 },
        { name = "Orange", id = 11 },
        { name = "Ivory", id = 112 },
        { name = "Cream", id = 107 }
    }

    local menu = {
        { header = "Select Interior Color", isMenuHeader = true }
    }

    for _, color in ipairs(colors) do
        table.insert(menu, {
            header = color.name,
            params = {
                event = "d3-mechanicupgrades:applyInteriorColor",
                args = color.id
            }
        })
    end

    table.insert(menu, { header = "⬅ Back", params = { event = "d3-mechanicupgrades:changeInterior" } })

    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('d3-mechanicupgrades:applyInteriorColor', function(colorId)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleInteriorColour(vehicle, colorId)
    QBCore.Functions.Notify("Interior color updated!", "success")
end)



-- Neon Lights Menu
RegisterNetEvent('d3-mechanicupgrades:changeNeons', function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local neonState = IsVehicleNeonLightEnabled(vehicle, 0)

    local menu = {
        { header = "Neon Lights", isMenuHeader = true },
        {
            header = neonState and "Turn Off Neons" or "Turn On Neons",
            txt = "Toggle neon lights on/off",
            params = {
                event = "d3-mechanicupgrades:applyNeons",
                args = not neonState
            }
        },
        {
            header = "Change Neon Color",
            txt = "Select a neon light color",
            params = {
                event = "d3-mechanicupgrades:neonColorMenu"
            }
        },
        {
            header = "⬅ Back",
            params = { event = "d3-mechanicupgrades:openMenu" }
        }
    }

    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('d3-mechanicupgrades:applyNeons', function(state)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    for i = 0, 3 do
        SetVehicleNeonLightEnabled(vehicle, i, state)
    end
    QBCore.Functions.Notify(state and "Neons activated!" or "Neons deactivated!", "success")
end)

-- Neon Color Selection Menu
RegisterNetEvent('d3-mechanicupgrades:neonColorMenu', function()
    local colors = {
        { name = "White", rgb = {255, 255, 255} },
        { name = "Blue", rgb = {0, 0, 255} },
        { name = "Electric Blue", rgb = {0, 150, 255} },
        { name = "Mint Green", rgb = {50, 255, 155} },
        { name = "Lime Green", rgb = {0, 255, 0} },
        { name = "Yellow", rgb = {255, 255, 0} },
        { name = "Golden Shower", rgb = {204, 204, 0} },
        { name = "Orange", rgb = {255, 128, 0} },
        { name = "Red", rgb = {255, 0, 0} },
        { name = "Pony Pink", rgb = {255, 102, 255} },
        { name = "Hot Pink", rgb = {255, 0, 255} },
        { name = "Purple", rgb = {153, 0, 153} },
        { name = "Blacklight", rgb = {15, 3, 255} }
    }

    local menu = {
        { header = "Select Neon Color", isMenuHeader = true }
    }

    for _, color in ipairs(colors) do
        table.insert(menu, {
            header = color.name,
            params = {
                event = "d3-mechanicupgrades:setNeonColor",
                args = color.rgb
            }
        })
    end

    table.insert(menu, {
        header = "⬅ Back",
        params = { event = "d3-mechanicupgrades:changeNeons" }
    })

    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('d3-mechanicupgrades:setNeonColor', function(rgb)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleNeonLightsColour(vehicle, rgb[1], rgb[2], rgb[3])
    QBCore.Functions.Notify("Neon color changed!", "success")
end)

-- Vehicle Extras Menu
RegisterNetEvent('d3-mechanicupgrades:changeExtras', function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local options = {
        { header = "Choose Extra", isMenuHeader = true }
    }

    for i = 0, 20 do
        if DoesExtraExist(vehicle, i) then
            local isActive = IsVehicleExtraTurnedOn(vehicle, i)
            table.insert(options, {
                header = "Extra " .. i .. (isActive and " (Active)" or " (Inactive)"),
                params = {
                    event = "d3-mechanicupgrades:applyExtra",
                    args = { i, not isActive }
                }
            })
        end
    end

    table.insert(options, { header = "⬅ Back", params = { event = "d3-mechanicupgrades:openMenu" } })

    exports['qb-menu']:openMenu(options)
end)

RegisterNetEvent('d3-mechanicupgrades:applyExtra', function(data)
    local index = data[1]
    local state = data[2]
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleExtra(vehicle, index, state and 0 or 1)
    QBCore.Functions.Notify(state and "Extra activated!" or "Extra deactivated!", "success")
end)





RegisterNetEvent('d3-mechanicupgrades:changeSmokeColor', function()
    local colors = {
        { name = "White", r = 255, g = 255, b = 255 },
        { name = "Red", r = 255, g = 0, b = 0 },
        { name = "Green", r = 0, g = 255, b = 0 },
        { name = "Blue", r = 0, g = 0, b = 255 },
        { name = "Purple", r = 153, g = 0, b = 153 },
        { name = "Orange", r = 255, g = 128, b = 0 }
    }

    local menu = {
        { header = "Select Tire Smoke Color", isMenuHeader = true }
    }

    for _, color in ipairs(colors) do
        table.insert(menu, {
            header = color.name,
            params = {
                event = "d3-mechanicupgrades:applySmokeColor",
                args = color
            }
        })
    end

    table.insert(menu, { header = "⬅ Back", params = { event = "d3-mechanicupgrades:openMenu" } })

    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('d3-mechanicupgrades:applySmokeColor', function(color)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    ToggleVehicleMod(vehicle, 20, true)
    SetVehicleTyreSmokeColor(vehicle, color.r, color.g, color.b)
    QBCore.Functions.Notify("Tire smoke color changed to " .. color.name, "success")
end)


RegisterNetEvent("d3-mechanicupgrades:changeXenons", function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleModKit(vehicle, 0)

    local xenonEnabled = IsToggleModOn(vehicle, 22)

    local menu = {
        { header = "Xenon Headlights", isMenuHeader = true },
        {
            header = xenonEnabled and "Disable Xenon Headlights" or "Enable Xenon Headlights",
            params = {
                event = "d3-mechanicupgrades:toggleXenons",
                args = not xenonEnabled
            }
        }
    }

    if xenonEnabled then
        local colors = {
            { name = "White", id = 0 },
            { name = "Blue", id = 1 },
            { name = "Electric Blue", id = 2 },
            { name = "Mint Green", id = 3 },
            { name = "Lime Green", id = 4 },
            { name = "Yellow", id = 5 },
            { name = "Golden Shower", id = 6 },
            { name = "Orange", id = 7 },
            { name = "Red", id = 8 },
            { name = "Pink", id = 9 },
            { name = "Hot Pink", id = 10 },
            { name = "Purple", id = 11 },
            { name = "Blacklight", id = 12 }
        }

        table.insert(menu, { header = "Select Xenon Color", isMenuHeader = true })

        for _, color in ipairs(colors) do
            table.insert(menu, {
                header = color.name,
                params = {
                    event = "d3-mechanicupgrades:applyXenonColor",
                    args = color.id
                }
            })
        end
    end

    table.insert(menu, { header = "⬅ Back", params = { event = "d3-mechanicupgrades:openMenu" } })

    exports['qb-menu']:openMenu(menu)
end)


RegisterNetEvent("d3-mechanicupgrades:applyXenonColor", function(colorId)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleModKit(vehicle, 0)

    ToggleVehicleMod(vehicle, 22, true)
    SetVehicleHeadlightsColour(vehicle, colorId)

    QBCore.Functions.Notify("Xenon color set!", "success")
end)



RegisterNetEvent("d3-mechanicupgrades:toggleXenons", function(state)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleModKit(vehicle, 0)

    ToggleVehicleMod(vehicle, 22, state)

    QBCore.Functions.Notify(state and "Xenon headlights enabled!" or "Xenon headlights disabled!", "success")
end)



------------------------------------------

RegisterNetEvent("d3-vehiclefix:useRepairKit", function()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if vehicle ~= 0 then
        QBCore.Functions.Notify("You must be outside the vehicle to repair it.", "error")
        return
    end

    local closestVehicle = GetClosestVehicle(GetEntityCoords(playerPed), 10.0, 0, 70)
    if closestVehicle == 0 then
        QBCore.Functions.Notify("No vehicle nearby to repair.", "error")
        return
    end

    local dict = "mini@repair"
    local anim = "fixing_a_ped"

    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(0)
    end

    TaskPlayAnim(playerPed, dict, anim, 8.0, -8, -1, 1, 0, false, false, false)

    QBCore.Functions.Progressbar("repair_vehicle", "Repairing vehicle...", 7000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        ClearPedTasks(playerPed)
        SetVehicleFixed(closestVehicle)
        SetVehicleDeformationFixed(closestVehicle)
        SetVehicleUndriveable(closestVehicle, false)
        QBCore.Functions.Notify("Vehicle repaired!", "success")
    end, function()
        ClearPedTasks(playerPed)
        QBCore.Functions.Notify("Repair cancelled.", "error")
    end)
end)


-------------------------


RegisterNetEvent("d3-mechanicupgrades:openBulletproofMenu", function()
    local menu = {
        { header = "Bulletproof Features", isMenuHeader = true },
        {
            header = "Bulletproof Tires",
            txt = "Install bulletproof tires on your vehicle",
            params = { event = "d3-mechanicupgrades:applyBulletproofTires" }
        },
        {
            header = "Close",
            params = { event = "d3-menu:closeMenu" }
        }
    }

    exports['qb-menu']:openMenu(menu)
end)



RegisterNetEvent('d3-mechanicupgrades:applyBulletproofTires', function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle ~= 0 then
        SetVehicleTyresCanBurst(vehicle, false)
        QBCore.Functions.Notify("Bulletproof tires installed!", "success")
    end
end)
