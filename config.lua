-- Setup a table to store the configuration options
Config = {}

-- Core esx or qb
Config.Core = "qb"

-- Text displayed when player is hurt
Config.Texts = {
    ["title"] = "You're hurt",
    ["content"] = "You're currently hurt. Please wait for a medic or search for help."
}

-- All settings
Config.Settings = {
    ["time"] = 25,
    ["effects"] = {
        enabled = true,
        effecttype = "DeathFailMPIn",
    },
    ["commands"] = "adminclear",
    ["sounds"] = true
} 
   