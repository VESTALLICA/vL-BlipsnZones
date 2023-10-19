Config = Config or {}
-- must restart the resource when editing blips


Config.ShowBlips = true 

Config.Blips = {
    [1] = {
        show = true,

        vector = vector3(-494.69, 5.88, 45.05), -- blip location
        text = "Example", 

        color = 1, -- https://docs.fivem.net/docs/game-references/blips/ sprites + colors 
        alpha = 255, -- transparency of blip. min-max = 0-255 
        
        sprite = 727, 
        scale = 1.0, 

        flash = false,
        ms = 0, -- flashes the blip every x milliseconds 
    },
    [2] = {
        show = false,

        vector = vector3(0, 0, 0), 
        text = "text", 

        color = 0, 
        alpha = 0, 
        
        sprite = 0, 
        scale = 0.0, 

        flash = false,
        ms = 0,
    },
}



Config.ShowRectangleZones = true

Config.RectangleZones = {
    [1] = {
        show = true,

        vector = vector3(-880.72, -118.52, 37.97), -- blip location
        width = 250.0, -- must end with a decimal value
        height = 100.0, -- ^^
        
        rotation = 27, -- rotation of the rectangle
        color = 1,
        alpha = 155,

        flash = false,
        ms = 0, -- flashes the blip every x milliseconds 
    },
    [2] = {
        show = false,

        vector = vector3(0, 0, 0), 
        width = 0.0, 
        height = 0.0, 
        
        rotation = 0, 
        color = 0,
        alpha = 0,

        flash = false,
        ms = 0, 
    },
}



Config.ShowCircleZones = true

Config.CircleZones = {
    [1] = {
        show = true,
        
        vector = vector3(-256.46, -49.26, 49.54), -- blip location
        radius = 100.0, -- must end in decimal value
        outline = false, -- will make the radius an outline 
        color = 1,
        alpha = 155,

        flash = false, 
        ms = 0, -- flashes the blip every x milliseconds 
    },
    [2] = {
        show = false,
        
        vector = vector3(0, 0, 0), 
        radius = 0.0,
        outline = false, 
        color = 0,
        alpha = 0,

        flash = false,
        ms = 0, 
    },
}




