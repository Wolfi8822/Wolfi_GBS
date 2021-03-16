ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('coffee', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('coffee', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('dzibies:onDrinkCoffee', source)
	xPlayer.showNotification(_U('used_gbs'))

end)

ESX.RegisterUsableItem('gbs', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	-- CZEK TERMOS
	if xPlayer.getInventoryItem('termos').count >= 1 then
		if xPlayer.getInventoryItem('water').count >= 1 then
			
			xPlayer.removeInventoryItem('gbs', 1)
			xPlayer.removeInventoryItem('water', 1)
			xPlayer.addInventoryItem('coffee', 1)
			xPlayer.showNotification(_U('paszy'))

		else
			xPlayer.showNotification(_U('wuda'))
		end
	else 
		xPlayer.showNotification(_U('termus'))
	end
end)
