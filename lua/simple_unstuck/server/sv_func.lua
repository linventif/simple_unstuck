//
// Functions
//

function simpleUnstuck.isValidPlyPos(pos)
    // check if in the world with util.IsInWorld
    if !util.IsInWorld(pos) then
        return false
    end

    // made a box trace to check if the position is available
    local trace = util.TraceHull({
        start = pos + Vector(-16, -16, 0), -- start the trace from the bottom-front-left
        endpos = pos + Vector(16, 16, 72), -- end the trace at the top-back-right
    })

    // if the trace hit something, then the position is not available
    if trace.Hit then
        // identify the entity that was hit
        local ent = trace.Entity
        -- print("[unstuck] " .. ent:GetClass() .. " is blocking the spawn position.")
        return false
    end

    return pos
end

function simpleUnstuck.findValidPos(initPos, radius, maxChecks)
    // get info from the arguments
    local searchRadius = radius || 180
    local maxAttempts = maxChecks || 60

    // check if the spawn position is valid
    if simpleUnstuck.isValidPlyPos(initPos) then
        return initPos
    end

    // try to find a valid position in a random direction
    for i = 1, maxAttempts do
        local genPos = initPos + Vector(math.random(-searchRadius, searchRadius), math.random(-searchRadius, searchRadius), math.random(-searchRadius, searchRadius) )
        local validPos = simpleUnstuck.isValidPlyPos(genPos)
        if validPos then
            return validPos
        end
    end

    // if no valid position was found, return false
    return false
end

function simpleUnstuck.unstuckPlayer(ply)
    // verify if valid player
    if (!IsValid(ply) || !ply:IsPlayer()) then
        return
    end

    // verify if cooldown
    if (ply.lastUnstuck && ply.lastUnstuck > CurTime()) then
        local rest = math.Round(ply.lastUnstuck - CurTime())
        simpleUnstuck.sendPlyMsg(ply, "cooldown", { rest })
        return false
    end
    ply.lastUnstuck = CurTime() + simpleUnstuck.Config.cooldown

    // find a valid pos
    local pos = simpleUnstuck.findValidPos(ply:GetPos(), simpleUnstuck.Config.maxDistance, simpleUnstuck.Config.maxTry)
    if (pos) then
        ply:SetPos(pos)
        simpleUnstuck.sendPlyMsg(ply, "unstuck")
        return true
    end

    simpleUnstuck.sendPlyMsg(ply, "fail")
end