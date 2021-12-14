ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


if Config.Carwash.Use then
	for i = 1, #Config.Carwash.usableItem do
		ESX.RegisterUsableItem(Config.Carwash.usableItem[i].name , function(source)
			local xPlayer = ESX.GetPlayerFromId(source)
		
			assert(xPlayer ~= nil, "xPlayer could not be found")
			
			TriggerClientEvent(Config.Carwash.clientEvent, source, Config.Carwash.usableItem[i], Config.Carwash)
		end)
	end
end 

if Config.Hijack.Use then
	for i = 1, #Config.Hijack.usableItem do
		ESX.RegisterUsableItem(Config.Hijack.usableItem[i].name , function(source)
			local xPlayer = ESX.GetPlayerFromId(source)
		
			assert(xPlayer ~= nil, "xPlayer could not be found")
			
			TriggerClientEvent(Config.Hijack.clientEvent, source, Config.Hijack.usableItem[i], Config.Hijack)
		end)
	end
end 






RegisterNetEvent("DaCarActions:removeItem")
AddEventHandler('DaCarActions:removeItem', function(itemArray)
	if itemArray.removeAfterUse then 
		local _source = source
		local xPlayer = ESX.GetPlayerFromId(source)
		
		assert(xPlayer ~= nil, "xPlayer could not be found")

		xPlayer.removeInventoryItem(itemArray.name, 1)

		TriggerClientEvent("DaCarActions:notify", _source, Translations[Config.Locale].item_removed .. itemArray.label .. "(1x)")
	end 
end)