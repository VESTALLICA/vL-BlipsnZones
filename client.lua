local rZones = {}

local cZones = {}

if Config.ShowBlips then
    CreateThread(function()
        for _, v in pairs(Config.Blips) do
            if v.Show then
                local blip = AddBlipForCoord(v.Vector)
                SetBlipColour(blip, v.Color)
                SetBlipAlpha(blip, v.Alpha)
                SetBlipSprite(blip, v.Sprite)
                SetBlipScale(blip, v.Scale)
                SetBlipAsShortRange(blip, true)
                if v.Flash then
                    SetBlipFlashes(blip, true)
                    SetBlipFlashInterval(blip, v.MS)
                end
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(v.Text)
                EndTextCommandSetBlipName(blip)
            end
        end
    end)
end


if Config.ShowRectangleZones then
    CreateThread(function()
        for _, v in pairs(Config.RectangleZones) do
            if v.Show then
                local blip = AddBlipForArea(v.Vector, v.Width, v.Length)
                SetBlipRotation(blip, v.Rotation)
                SetBlipColour(blip, v.Color)
                SetBlipAlpha(blip, v.Alpha)
                SetBlipAsShortRange(blip, true)
                if v.Flash then
                    SetBlipFlashes(blip, true)
                    SetBlipFlashInterval(blip, v.MS)
                end
            end
        end
    end)

    CreateThread(function()
        for k, v in pairs(Config.RectangleZones) do
            if v.PolyZone then
                if not v.Points then
                    exports["ps-zones"]:CreateBoxZone(k, v.Vector, v.Length, v.Width, {
                        debugPoly = v.DebugPoly,
                        heading = v.Rotation,
                        minZ = v.MinZ,
                        maxZ = v.MaxZ,
                    })
                else
                    exports["ps-zones"]:CreatePolyZone(k, v.Points, {
                        debugPoly = v.DebugPoly,
                        minZ =  v.MinZ,
                        maxZ =  v.MaxZ,
                    })
                end
                table.insert(rZones, k)
            end
        end
    end)

    CreateThread(function()
        for _, v in pairs(rZones) do

            local zone = v
            local zoneData = Config.RectangleZones[zone]
            
            RegisterNetEvent("ps-zones:enter")
            AddEventHandler("ps-zones:enter", function(enteredzone)
                if enteredzone == zone then
                    local eventType = zoneData.PlayerIn.type
                    local eventName = zoneData.PlayerIn.event
                    local player = PlayerPedId()
                    TriggerEvent('' .. eventName .. '', player, zone)
                end
            end)

            RegisterNetEvent("ps-zones:leave")
            AddEventHandler("ps-zones:leave", function(leftzone)
                if leftzone == zone then
                    local eventType = zoneData.PlayerOut.type
                    local eventName = zoneData.PlayerOut.event
                    local player = PlayerPedId()
                    TriggerEvent('' .. eventName .. '', player, zone)
                end
            end)
        end
    end)
end




if Config.ShowCircleZones then
    CreateThread(function()
        for _, v in pairs(Config.CircleZones) do
            if v.Show then
                local blip = AddBlipForRadius(v.Vector, v.Radius) 
                SetBlipColour(blip, v.Color)
                SetBlipAlpha(blip, v.Alpha)
                SetRadiusBlipEdge(blip, v.Outline)
                SetBlipAsShortRange(blip, true)
                if v.Flash then
                    SetBlipFlashes(blip, true)
                    SetBlipFlashInterval(blip, v.MS)
                end
            end
        end
    end)

    CreateThread(function()
        for k, v in pairs(Config.CircleZones) do
            if v.PolyZone then
                if not v.Points then
                    exports["ps-zones"]:CreateCircleZone(k, v.Vector, v.Radius, {
                        debugPoly = v.DebugPoly,
                        minZ = v.MinZ,
                        maxZ = v.MaxZ,
                    })
                else
                    exports["ps-zones"]:CreatePolyZone(k, v.Points, {
                        debugPoly = v.DebugPoly,
                        minZ = v.MinZ,
                        maxZ = v.MaxZ,
                    })
                end
                table.insert(cZones, k)
            end
        end
    end)
    
    CreateThread(function()
        for _, v in pairs(cZones) do
            local zone = v
            local zoneData = Config.CircleZones[zone]
            
            RegisterNetEvent("ps-zones:enter")
            AddEventHandler("ps-zones:enter", function(enteredzone)
                if enteredzone == zone then
                    local eventType = zoneData.PlayerIn.type
                    local eventName = zoneData.PlayerIn.event
                    local player = PlayerPedId()
                    TriggerEvent('' .. eventName .. '', player, zone)
                end
            end)

            RegisterNetEvent("ps-zones:leave")
            AddEventHandler("ps-zones:leave", function(leftzone)
                if leftzone == zone then
                    local eventType = zoneData.PlayerOut.type
                    local eventName = zoneData.PlayerOut.event
                    local player = PlayerPedId()
                    TriggerEvent('' .. eventName .. '', player, zone)
                end
            end)
        end
    end)
end

RegisterNetEvent('example:1', function(player, zone)
    print('Player:'..player..' entered zone: '..zone)
end)

RegisterNetEvent('example:2', function(player, zone)
    print('Player:'..player..' left zone: '..zone)
end)

RegisterNetEvent('example:3', function(player, zone)
    print('Player:'..player..' entered zone: '..zone)
end)

RegisterNetEvent('example:4', function(player, zone)
    print('Player:'..player..' left zone: '..zone)
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for _, v in pairs(rZones) do
			exports["ps-zones"]:DestroyZone(v)
		end
        for _, v in pairs(cZones) do
			exports["ps-zones"]:DestroyZone(v)
		end
	end
end)
