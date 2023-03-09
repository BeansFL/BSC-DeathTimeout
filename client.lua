local isDead, revivetimer, timerOver = false, 0, false



function runtimer()
     SendNUIMessage({
          type = "startTimer",
          title = Config.Title,
          text = Config.Text,
          time = Config.Time
     })
end

RegisterNetEvent(Config.revive)
AddEventHandler(Config.revive, function()
isDead = true
revivetimer = Config.Time
end)
 
function RunProcess()
     RequestAnimSet("move_m@injured")
     while not HasAnimSetLoaded("move_m@injured") do
          Wait(0)
     end
     SetPedMovementClipset(PlayerPedId(), "move_m@injured", 1.0)
     SetPlayerSprint(PlayerId(), false) 
end

function ScreenEffect()
     if Config.EnableEffects then
          StartScreenEffect(Config.Effect, 0, true)
     end
end

function ToggleDead(bool)
     isDead = bool
     while isDead do
          Wait(1)
          DisablePlayerFiring(PlayerId(), true)
     end
     if not isDead then
          DisablePlayerFiring(PlayerId(), false)
     end
end

CreateThread(function()
local sleep = 1500
while true do
     if isDead then
          sleep = 1
          if revivetimer >= 1 then
               SetPedUsingActionMode(PlayerPedId(), false, -1, 'DEFAULT_ACTION')
               RunProcess()
               ScreenEffect()
               SetPlayerTargetingMode(0)
               SetPedUsingActionMode(PlayerPedId(), -1, -1, 1)
               runtimer()
               ToggleDead(true)
          end
     end
     Wait(sleep)
end
end)

RegisterNuiCallback('finished', function(data, cb)
ToggleDead(false)
ResetPedMovementClipset(PlayerPedId(), 0)
StopAllScreenEffects()
isDead = false
cb('ok')
end)

RegisterCommand(Config.ResetCommand, function(source, args)
local playerId = tonumber(args[1])

if playerId == nil then
     ToggleDead(false)
     ResetPedMovementClipset(0)
     StopAllScreenEffects()

     SendNUIMessage({ type = "stopTimer"})
end

local player = GetPlayerFromServerId(playerId)

if player == -1 then
print("Cleared yourself cause ID didnt exist.")
end 

local playerPed = GetPlayerPed(player)

-- Reset the player's state
ToggleDead(false)
ResetPedMovementClipset(playerPed, 0)
StopAllScreenEffects(playerPed)

SendNUIMessage({ type = "stopTimer"})

end, true)

















