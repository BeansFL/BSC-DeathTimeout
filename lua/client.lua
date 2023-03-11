local deathTimeOut = false

-- Functions
local function Loop(bool)
     deathTimeOut = bool
     while deathTimeOut do 
          local playerPed = PlayerPedId()
          local playerID = PlayerId()
          SetPedUsingActionMode(playerPed, false, -1, 'DEFAULT_ACTION')
          SetPedMovementClipset(playerPed, "move_m@injured", 1.0)
          SetPlayerSprint(playerID, false) 
          SetPlayerTargetingMode(0)
          SetPedUsingActionMode(playerPed, -1, -1, 1)
          DisablePlayerFiring(playerID, true)
          Wait(5)
     end
end

local function DeathTimeOut()
     if not deathTimeOut then
          SendNUIMessage({type = "startTimer",text = Config.Texts,settings = Config.Settings,})
          if Config.Settings["effects"].enabled then 
               AnimpostfxPlay(Config.Settings["effects"].effecttype, 0, true)
          end
          Loop(true)
     end
end

exports('DeathTimeOut', DeathTimeOut)

local function StopTimer()
     DisablePlayerFiring(PlayerId(), false)
     ResetPedMovementClipset(PlayerPedId(), 0)
     AnimpostfxStop(Config.Settings["effects"].effecttype)
end

-- Events
RegisterNetEvent('bsc-deathtimeout:client:adminClear', function()
     if deathTimeOut then 
          SendNUIMessage({ type = "stopTimer"})
     end
end)

-- Callbacks
RegisterNuiCallback('finished', function(_, cb)
     Loop(false)
     StopTimer()
     cb('ok')
end)

CreateThread(function()
     RequestAnimSet("move_m@injured")
     while not HasAnimSetLoaded("move_m@injured") do
          Wait(0)
     end
end)