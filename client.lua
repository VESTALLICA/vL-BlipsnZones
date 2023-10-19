if Config.ShowBlips then
    CreateThread(function()
        for _, v in pairs(Config.Blips) do
            if v.show then
                local blip = AddBlipForCoord(v.vector)
                SetBlipColour(blip, v.color)
                SetBlipAlpha(blip, v.alpha)
                SetBlipSprite(blip, v.sprite)
                SetBlipScale(blip, v.scale)
                SetBlipAsShortRange(blip, true)
                if v.flash then
                    SetBlipFlashes(blip, true)
                    SetBlipFlashInterval(blip, v.ms)
                end
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(v.text)
                EndTextCommandSetBlipName(blip)
            end
        end
    end)
end

if Config.ShowRectangleZones then
    CreateThread(function()
        for _, v in pairs(Config.RectangleZones) do
            if v.show then
                local blip = AddBlipForArea(v.vector, v.width, v.height)
                SetBlipRotation(blip, v.rotation)
                SetBlipColour(blip, v.color)
                SetBlipAlpha(blip, v.alpha)
                SetBlipAsShortRange(blip, true)
                if v.flash then
                    SetBlipFlashes(blip, true)
                    SetBlipFlashInterval(blip, v.ms)
                end
            end
        end
    end)
end

if Config.ShowCircleZones then
    CreateThread(function()
        for _, v in pairs(Config.CircleZones) do
            if v.show then
                local blip = AddBlipForRadius(v.vector, v.radius) 
                SetBlipColour(blip, v.color)
                SetBlipAlpha(blip, v.alpha)
                SetRadiusBlipEdge(blip, v.outline)
                SetBlipAsShortRange(blip, true)
                if v.flash then
                    SetBlipFlashes(blip, true)
                    SetBlipFlashInterval(blip, v.ms)
                end
            end
        end
    end)
end

