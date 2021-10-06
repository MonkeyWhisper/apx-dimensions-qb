QBCore.Commands.Add(Config.ChangeDimension, 'Command to change the dimension of the selected player.', {{name = 'playerId', help = 'Player ID'}, {name = 'dimension', help = 'Dimension'}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local playerId = tonumber(args[1])
    local dimension = tonumber(args[2])
    local Target = QBCore.Functions.GetPlayer(playerId)


    if args[1] and tonumber(args[1]) and Target then
        if args[2] and tonumber(args[2]) then
            SetPlayerRoutingBucket(playerId, dimension)
            TriggerClientEvent('QBCore:Notify', src, 'You have changed the ' ..GetPlayerName(playerId).. ' dimension to ' ..GetPlayerRoutingBucket(playerId).. '.', 'success')
        else
            TriggerClientEvent('QBCore:Notify', src, 'You must set the dimension.', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'You must enter a correct Player ID.', 'error')
    end
end, 'admin')

QBCore.Commands.Add(Config.AutoFixCommand, 'Command to return to the default dimension. (( 0 ))', {}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    SetPlayerRoutingBucket(src, 0)
    TriggerClientEvent('QBCore:Notify', src, 'The dimension has been reset to ' ..GetPlayerRoutingBucket(src).. '.', 'success')
end)

QBCore.Commands.Add(Config.ViewDimension, 'Command to view the current dimension.', {}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    TriggerClientEvent('QBCore:Notify', src, 'You are in dimension: ' ..GetPlayerRoutingBucket(src), 'success')
end)