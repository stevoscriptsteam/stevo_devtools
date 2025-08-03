local config = require('config')

lib.addCommand('getcoords', {
    help = 'Use raycast to get coords',
    restricted = config.adminGroup,
}, function(source, args, raw)
    TriggerClientEvent('stevo_devtools:client:getCoords', source)
end)