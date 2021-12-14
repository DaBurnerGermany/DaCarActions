ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(0)
    end
    
end)



RegisterNetEvent("DaCarActions:Car-Hijack")
AddEventHandler('DaCarActions:Car-Hijack', function(itemArray, cfg)
	if cfg.Use then
		local playerPed = PlayerPedId()
		local vehicle   = ESX.Game.GetVehicleInDirection()
		local coords    = GetEntityCoords(playerPed)

		if IsPedSittingInAnyVehicle(playerPed) then
			TShowNotification(Translations[Config.Locale].not_available_in_car)
			return
		end

		if DoesEntityExist(vehicle) then
			isBusy = true
			TaskStartScenarioInPlace(playerPed, cfg.animation, 0, true)
			
			Citizen.CreateThread(function()
				showProgressBar(cfg.timeToExecute, Translations[Config.Locale].progress_hijack)
				Citizen.Wait(cfg.timeToExecute)

				SetVehicleDoorsLocked(vehicle, 1)
				SetVehicleDoorsLockedForAllPlayers(vehicle, false)
				ClearPedTasksImmediately(playerPed)

				TriggerServerEvent("DaCarActions:removeItem", itemArray)
				ShowNotification(Translations[Config.Locale].vehicle_hijacked)
				isBusy = false
			end)
		else
			ShowNotification(Translations[Config.Locale].no_vehicle_nearby)
		end
	end
	end)


RegisterNetEvent("DaCarActions:Car-Wash")
AddEventHandler('DaCarActions:Car-Wash', function(itemArray, cfg)
	if cfg.Use then
		local playerPed = PlayerPedId()
		local vehicle   = ESX.Game.GetVehicleInDirection()
		local coords    = GetEntityCoords(playerPed)

		if IsPedSittingInAnyVehicle(playerPed) then
			ShowNotification(Translations[Config.Locale].not_available_in_car)
			return
		end

		if DoesEntityExist(vehicle) then
			isBusy = true

			TaskStartScenarioInPlace(playerPed, cfg.animation, 0, true)
			Citizen.CreateThread(function()

				showProgressBar(cfg.timeToExecute, Translations[Config.Locale].progress_wash)
				Citizen.Wait(cfg.timeToExecute)

				SetVehicleDirtLevel(vehicle, 0)
				ClearPedTasksImmediately(playerPed)

				TriggerServerEvent("DaCarActions:removeItem", itemArray)				
				ShowNotification(Translations[Config.Locale].vehicle_washed)
				isBusy = false
			end)
		else
			ShowNotification(Translations[Config.Locale].no_vehicle_nearby)
		end
	end
end)

RegisterNetEvent("DaCarActions:notify")
AddEventHandler("DaCarActions:notify", function(text)
	ShowNotification(text)
end)


function showProgressBar(duration, text)
	if Config.progressBars.TigerScripts then
		exports['progressBars']:startUI(duration, text)
	elseif Config.progressBars.MyScripts then
		exports['pogressBar']:drawBar(duration, text)
	elseif Config.progressBars.Custom then
		--here your custom code...
	end 
end 

function ShowNotification(notificationtext)
	if Config.notifications.BtwLouis then
		TriggerEvent('notifications', '#07b95e', '', notificationtext)
	elseif Config.notifications.DefaultFiveM then
		SetNotificationTextEntry('STRING')
		AddTextComponentString(notificationtext)
		return DrawNotification(false, true)
	elseif Config.notifications.Custom then
		--here your custom code...
	end
end