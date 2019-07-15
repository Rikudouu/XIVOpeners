xivopeners_mch = {}

xivopeners_mch.supportedLevel = 80
xivopeners_mch.openerAbilities = {
    Drill = ActionList:Get(1, 16498),
    GaussRound = ActionList:Get(1, 2874),
    Ricochet = ActionList:Get(1, 2890),
    SplitShot = ActionList:Get(1, 7411),
    BarrelStabilizer = ActionList:Get(1, 7414),
    SlugShot = ActionList:Get(1, 7412),
    WildFire = ActionList:Get(1, 2878),
    HyperCharge = ActionList:Get(1, 17209),
    HeatBlast = ActionList:Get(1, 7410),
    Reassemble = ActionList:Get(1, 2876),
    AirAnchor = ActionList:Get(1, 16500),
    CleanShot = ActionList:Get(1, 7413)
}

xivopeners_mch.listOpeners = {"Early WF", "Late WF"}
xivopeners_mch.currentOpenerIndex = 1

xivopeners_mch.openers = {
    earlyWF = {
        xivopeners_mch.openerAbilities.Drill,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.SplitShot,
        xivopeners_mch.openerAbilities.BarrelStabilizer,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.SlugShot,
        xivopeners_mch.openerAbilities.WildFire,
        xivopeners_mch.openerAbilities.HyperCharge,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.Reassemble,
        xivopeners_mch.openerAbilities.AirAnchor,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.CleanShot,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Drill,
        xivopeners_mch.openerAbilities.Ricochet,
    },

    lateWF = {
        xivopeners_mch.openerAbilities.SplitShot,
        xivopeners_mch.openerAbilities.BarrelStabilizer,
        xivopeners_mch.openerAbilities.SlugShot,
        xivopeners_mch.openerAbilities.CleanShot,
        xivopeners_mch.openerAbilities.SplitShot,
        xivopeners_mch.openerAbilities.Reassemble,
        xivopeners_mch.openerAbilities.Drill,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.SlughShot,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.AirAnchor,
        xivopeners_mch.openerAbilities.WildFire,
        xivopeners_mch.openerAbilities.HyperCharge,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.CleanShot,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.SplitShot,
        xivopeners_mch.openerAbilities.Drill
    },
}

xivopeners_mch.abilityQueue = {}
xivopeners_mch.lastCastFromQueue = nil -- might need this for some more complex openers with conditions
xivopeners_mch.openerStarted = false


function xivopeners_mch.getOpener()
    local opener
    if (xivopeners_mch.currentOpenerIndex == 1) then
        opener = xivopeners_mch.openers.earlyWF
    else
        opener = xivopeners_mch.openers.lateWF
    end
    return opener
end

function xivopeners_mch.checkOpenerIds()
    for key, action in pairs(xivopeners_mch.getOpener()) do
        if (action == nil) then
            xivopeners.log("WARNING: Action at index " .. tostring(key) .. " was nil! The id is likely incorrect.")
        end
    end
end

function xivopeners_mch.openerAvailable()
    -- check cooldowns

    for _, action in pairs(xivopeners_mch.getOpener()) do
        if (action.cd >= 1.5) then return false end
    end
    return true
end

function xivopeners_mch.main()
    if (Player.level >= xivopeners_mch.supportedLevel) then
        local target = Player:GetTarget()
        if (not target) then return end

        if (not xivopeners_mch.openerAvailable() and not xivopeners_mch.openerStarted) then return end -- don't start opener if it's not available, if it's already started then yolo

        if (ActionList:IsCasting()) then return end

--        if (xivopeners_mch.lastCastFromQueue and Player.castinginfo.lastcastid == xivopeners_mch.lastCastFromQueue.id) then
--            xivopeners_mch.dequeue()
--            xivopeners_mch.useNextAction(target)
--        elseif (xivopeners_mch.lastCastFromQueue) then
--            -- looks like casting the action failed, let's retry the ability
--            if (not xivopeners_mch.lastCastFromQueue.isoncd) then
--                xivopeners_mch.useNextAction(target)
--            else
--                -- ability wasn't last but is on cooldown, something messed up in the rotation, fuck it
--                xivopeners_mch.dequeue()
--                xivopeners_mch.useNextAction(target)
--                xivopeners.log("WARNING: Something went wrong with action " .. xivopeners_mch.lastCastFromQueue.name .. ", continuing to next ability anyway")
--            end
--        else
--            -- looks like we haven't run our opener yet, go from the start
--            xivopeners_mch.openerStarted = true
--            xivopeners_mch.useNextAction(target)
--        end

        if (not xivopeners_mch.openerStarted) then
            xivopeners_mch.openerStarted = true
            xivopeners_mch.useNextAction(target)
        elseif (Player.castinginfo.lastcastid == xivopeners_mch.lastCastFromQueue.id) then
            xivopeners_mch.dequeue()
            xivopeners_mch.useNextAction(target)
        else
            xivopeners_mch.useNextAction(target)
        end

    end
end

function xivopeners_mch.queueOpener()
    for _, action in pairs(xivopeners_mch.getOpener()) do
        xivopeners_mch.enqueue(action)
    end
    xivopeners.log("queue:")
    for k, v in pairs(xivopeners_mch.getOpener()) do
        xivopeners.log(v.name)
    end
end

function xivopeners_mch.enqueue(action)
    -- implementation of the queue can be changed later
    table.insert(xivopeners_mch.abilityQueue, action)
end

function xivopeners_mch.dequeue()
    table.remove(xivopeners_mch.abilityQueue, 1)
end

function xivopeners_mch.useNextAction(target)
    -- do the actual opener
    -- the current implementation uses a queue system
    if (target and target.attackable and xivopeners_mch.abilityQueue[1]) then
        xivopeners.log("Casting " .. xivopeners_mch.abilityQueue[1].name)
        xivopeners_mch.abilityQueue[1]:Cast(target.id)
        xivopeners_mch.lastCastFromQueue = xivopeners_mch.abilityQueue[1]
    end
end