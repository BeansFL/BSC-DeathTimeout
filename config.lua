-- Set up a table to store the configuration options
Config = {}

-- Title displayed when player is hurt
Config.Title = "You're hurt"

-- Text displayed when player is hurt
Config.Text = "You're currently hurt. Please wait for a medic or search for help."

-- Time in seconds for which the player will be hurt
Config.Time = 25 

-- Event to  trigger the DeathTimeout. Add your revive event here.
Config.revive = "esx_ambulancejob:revive"

-- Enable/disable special screen effects when player is hurt
Config.EnableEffects = true

-- Effect to be applied when player is hurt. Full list of effects can be found here: https://forum.cfx.re/t/all-gta-v-screen-effects/2028172
Config.Effect = "DeathFailMPIn"
 
-- Use your defined Command in Config.ResetCommand + ID (example: /adminclear <ID>). If you dont  speficy an id you will clear youself. This only works for admins to reset their players or themselves. 
Config.ResetCommand = "adminclear"
   

-- btw Read JS to deactivate heartbeat sounds