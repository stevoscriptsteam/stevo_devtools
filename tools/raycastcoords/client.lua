-- https://gist.github.com/unitysync/a3bb2f2bae761f9ab5bfe40476651ee6


local function getCoordsFromRaycast()
    lib.showTextUI('**[E]** to Confirm Location  \n**[Arrow Up/Down]** To Adjust Distance')
    local distance = 20.0
    local coords = vec3(0, 0, 0)
    repeat
        if IsControlJustPressed(0, 187) then distance -= 0.5 end
        if IsControlJustPressed(0, 188) then distance += 0.5 end

        _, _, coords = lib.raycast.fromCamera(511, 4, distance)

        ---@diagnostic disable-next-line: param-type-mismatch
        DrawMarker(28, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, 255, 0, 0, 100, false, false, 0, true, false, false, false)
    until IsControlJustPressed(0, 38)
    lib.hideTextUI()
    return coords
end

RegisterNetEvent('stevo_devtools:client:getCoords', function()
	if GetInvokingResource() then return end

    local coords = getCoordsFromRaycast()
    if coords then
        local coordsString = ('vec3(%s, %s, %s)'):format(coords.x, coords.y, coords.z)
        print(('Coordinates: %s'):format(coordsString))
        lib.setClipboard(coordsString)
    end
end)