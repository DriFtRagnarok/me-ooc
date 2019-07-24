----------------------------------------
----------------------------------------
---- Made By DriFt Ragnarok for MRP ----
----------------------------------------
----------------------------------------

displayLocation = true
blips = true
disableChatCalls = false

RegisterServerEvent('911')
AddEventHandler('911', function(location, msg, x, y, z, name, ped)
	local playername = GetPlayerName(source)
	local ped = GetPlayerPed(source)
	if displayLocation == false then
		if disableChatCalls == false then
			TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^4[911] | [Caller ID]: ^r' .. playername .. '^*^4  [Report]: ^r' .. msg)
			sendDiscord('911 Communications', '**911 | Caller ID: **' .. playername .. '** | Report: **' .. msg)  
		else
			sendDiscord('911 Communications', '**911 | Caller ID: **' .. playername .. '** | Report: **' .. msg)  
		end
	else
		if disableChatCalls == false then
			TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^4[911]^8 [Caller ID]: ^r' .. playername .. '^*^8 [Location]: ^r' .. location .. '^*^8 [Report]: ^r' .. msg)
			sendDiscord('911 Communications', '**911 | Caller ID: **' .. playername .. '** | Location: **' .. location .. '** | Report: **' .. msg)
		else
			sendDiscord('911 Communications', '**911 | Caller ID: **' .. playername .. '** | Location: **' .. location .. '** | Report: **' .. msg)
		end
		if blips == true then
			TriggerClientEvent('911:setBlip', -1, name, x, y, z)
		end
	end
end)

function sendDiscord(name, message)
  	PerformHttpRequest(webhookurl, function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end