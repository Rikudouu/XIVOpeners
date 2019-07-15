xivopeners_mch = {}

xivopeners_mch.supportedLevel = 80
xivopeners_mch.openerAbilities = {
    Drill = ActionList:Get(0),
    GaussRound = ActionList:Get(2874),
    Ricochet = ActionList:Get(2890),
    SplitShot = ActionList:Get(8848),
    BarrelStabilizer = ActionList:Get(0),
    SlugShot = ActionList:Get(8849),
    WildFire = ActionList:Get(8855),
    HyperCharge = ActionList:Get(0),
    HeatBlast = ActionList:Get(8851),
    Reassemble = ActionList:Get(2876),
    AirAnchor = ActionList:Get(0),
    CleanShot = ActionList:Get(8850)
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
        xivopeners_mch.openerAbilities.Wildfire,
        xivopeners_mch.openerAbilities.Hypercharge,
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
        xivopeners_mch.openerAbilities.Hypercharge,
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

function xivopeners_mch.openerAvailable()
    -- check cooldowns
    for _, action in pairs(xivopeners_mch.openers[xivopeners_mch.currentOpenerIndex]) do
        if (action.cd >= 1.5) then return false end
    end
    return true
end

function xivopeners_mch.main()
    if (Player.level >= xivopeners_mch.supportedLevel) then
        local target = Player:GetTarget()
        if (not target) then return end

        if (not xivopeners_mch.openerAvailable()) then return end

        if (ActionList:IsCasting()) then return end

        if (Player.lastaction == xivopeners_mch.lastCastFromQueue) then
            xivopeners_mch.useNextAction()
        else
            -- looks like casting the action failed, let's retry the ability
            xivopeners_mch.lastCastFromQueue:Cast()
        end

    end
end

function xivopeners_mch.queueOpener()
    for _, action in pairs(xivopeners_mch.openers[xivopeners_mch.currentOpenerIndex]) do
        xivopeners_mch.enqueue(action)
    end
end

function xivopeners_mch.enqueue(action)
    -- implementation of the queue can be changed later
    table.insert(xivopeners_mch.abilityQueue, action)
end

function xivopeners_mch.dequeue()
    table.remove(xivopeners_mch.abilityQueue, 1)
end

function xivopeners_mch.useNextAction()
    -- do the actual opener
    -- the current implementation uses a queue system

    xivopeners_mch.abilityQueue[1].cast()
    xivopeners_mch.lastCastFromQueue = xivopeners_mch.abilityQueue[1]
    xivopeners_mch.dequeue()
end