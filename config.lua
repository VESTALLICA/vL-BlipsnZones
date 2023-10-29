Config = Config or {}
-- must restart the resource when editing blips


Config.ShowBlips = true 

Config.Blips = {
    [1] = {
        Show = true,

        Vector = vector3(-494.69, 5.88, 45.05), -- blip location
        Text = "Example", 

        Color = 1, -- https://docs.fivem.net/docs/game-references/blips/ sprites + colors 
        Alpha = 255, -- transparency of blip. min-max = 0-255 
        
        Sprite = 727, 
        Scale = 1.0, 

        Flash = false,
        MS = 0, -- flashes the blip every x milliseconds 
    },
    [2] = {
        Show = false,

        Vector = vector3(0, 0, 0), 
        Text = "text", 

        Color = 0, 
        Alpha = 0, 
        
        Sprite = 0, 
        Scale = 0.0, 

        Flash = false,
        MS = 0,
    },
}



Config.ShowRectangleZones = true

--[[
if points = false and polyzone = true then a box zone will be created with the same dimensions as the rectangle  blip. you can instead define custom points to build a custom shape instead.  
please note that, if you are making a custom shape, the blip will still be rectangular. custom blips are not possible as the only native blip functions are
for an entity, coord, circle radius, or rectangle area. 

to define a custom poly shape, make a table of vector2 coords: 
Points = {
    vector2(0, 0),
    vector2(0, 0),
    vector2(0, 0),
    vector2(0, 0),
},   
]]
Config.RectangleZones = {
    ['Example1'] = { -- name of the zone. this will also be the name of the polyzone if enabled
        Show = true,

        Vector = vector3(-880.72, -118.52, 37.97), -- blip location
        Width = 250.0, -- must end with a decimal value
        Length = 100.0, -- ^^
        
        Rotation = 27, -- rotation of the rectangle
        Color = 1,
        Alpha = 155,

        Flash = false,
        MS = 0, -- flashes the blip every x milliseconds 

        -- polyzones. must have ps-zones
        PolyZone = true, -- set to true to create a polyzone for this blip.
        DebugPoly = true, -- draws the poly
        MinZ = 37.97 - 10, -- make sure to set 
        MaxZ = 37.37 + 10, -- ^^
        Points = false, -- see the note
        
        -- trigger an event that contains whatever codeblocks you want to run. leave false to disable the event trigger.
        PlayerIn = { event = 'example:1' }, -- the events that triggers when a player enters this zone.
        PlayerOut = { event = 'example:2' },  -- the events that triggers when a player leaves this zone.

    },
    ['Example2'] = {
        Show = false,

        Vector = vector3(0, 0, 0), 
        Width = 0.0, 
        Length = 0.0, 
        
        Rotation = 0, 
        Color = 0,
        Alpha = 0,

        Flash = false,
        MS = 0, 

        PolyZone = false,
        DebugPoly = false,
        MinZ = 0, 
        MaxZ = 0,
        Points = false,

        PlayerIn = { event = 'example:1' }, 
        PlayerOut = { event = 'example:2' },  
    },
}



Config.ShowCircleZones = true

Config.CircleZones = {
    ['Example3'] = {
        Show = true,
        
        Vector = vector3(-627.01, -6.51, 41.7), -- blip location
        Radius = 100.0, -- must end in decimal value
        Outline = false, -- will make the radius an outline 
        Color = 1,
        Alpha = 155,

        Flash = false, 
        MS = 0, -- flashes the blip every x milliseconds 

        -- must have ps-zones
        PolyZone = true,
        DebugPoly = true, -- draws the poly
        MinZ = 49.54 - 10, -- make sure to set 
        MaxZ = 49.54 + 10, -- ^^
        Points = false, -- if false and polyzone is true then it will default to a circle zone with the same dimensions. 

        PlayerIn = { event = 'example:3' }, 
        PlayerOut = { event = 'example:4' },  
    },
    ['Example4'] = {
        Show = false,
        
        Vector = vector3(0, 0, 0), 
        Radius = 0.0,
        Outline = false, 
        Color = 0,
        Alpha = 0,

        Flash = false,
        MS = 0, 

        PolyZone = false,
        DebugPoly = false, 
        MinZ = 0, 
        MaxZ = 0,
        Points = false,

        PlayerIn = { event = 'example:3' }, 
        PlayerOut = { event = 'example:4' },  
    },
}
