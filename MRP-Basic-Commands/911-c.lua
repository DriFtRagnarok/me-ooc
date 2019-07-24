----------------------------------------
----------------------------------------
---- Made By DriFt Ragnarok for MRP ----
----------------------------------------
----------------------------------------

displayTime = 300
        blip = nil
        blips = {}
        
        Citizen.CreateThread(function()
            TriggerEvent('chat:addSuggestion', '/911', 'Submits a 911 call to the Emergency Services!', {
            { name="Report", help="Enter the incident/report here!" }
        })
        end)
        
        RegisterNetEvent('911:setBlip')
        AddEventHandler('911:setBlip', function(name, x, y, z)
            blip = AddBlipForCoord(x, y, z)
            SetBlipSprite(blip, 66)
            SetBlipScale(blip, 1.0)
            SetBlipColour(blip, 3)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString('911 Call - ' .. name)
            EndTextCommandSetBlipName(blip)
            table.insert(blips, blip)
            Wait(displayTime * 1000)
            for i, blip in pairs(blips) do 
                RemoveBlip(blip)
            end
        end)
        
        RegisterCommand('911', function(source, args)
            local name = GetPlayerName(PlayerId())
            local ped = GetPlayerPed(PlayerId())
            local x, y, z = table.unpack(GetEntityCoords(ped, true))
            local street = GetStreetNameAtCoord(x, y, z)
            local location = GetStreetNameFromHashKey(street)
            local msg = table.concat(args, ' ')
            if args[1] == nil then
                TriggerEvent('chatMessage', '^5911', {255,255,255}, ' ^7Please enter your ^1report/issue.')
            else
                TriggerServerEvent('911', location, msg, x, y, z, name)
            end
        end)