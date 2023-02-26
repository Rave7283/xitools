local currentLevel = 0

local function CheckLevelSync(sets)
    local player = gData.GetPlayer()
    if currentLevel ~= player.MainJobSync and player.MainJobSync > 0 then
        currentLevel = player.MainJobSync
        gFunc.EvaluateLevels(sets, currentLevel)
    end
end

return CheckLevelSync
