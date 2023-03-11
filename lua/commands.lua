if Config.Core == "qb" then 
	local QBCore = exports['qb-core']:GetCoreObject()

	QBCore.Commands.Add(Config.Settings["commands"],"Clear death time out", {{name = 'id', help = "Id of the Player (empty for yourself)"}}, false, function(source, args)
		if args[1] then
			local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
			if Player then 
				TriggerClientEvent('bsc-deathtimeout:client:adminClear', Player.PlayerData.source)
			end
		else
			TriggerClientEvent('bsc-deathtimeout:client:adminClear', source)
		end
	end, 'admin')
elseif Config.Core == "esx" then 
	local ESX = exports["es_extended"]:getSharedObject()
	-- !  I haven't tried this
	ESX.RegisterCommand(Config.ResetCommand, "admin",  function(xPlayer, args, showError)
		if not args.playerId then args.playerId = xPlayer.source end
		TriggerClientEvent('bsc-deathtimeout:client:adminClear', args.playerId)
	end, false, {help = "Clear death time out", arguments = {{name = 'id', help = "Id of the Player (empty for yourself)", type = 'number'}}})
else
	print("Config.Core is empty")
end

