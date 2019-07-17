-- MCH has a very basic opener with no duplicate ablities in a row, key word being "row". Unlike bard,
-- which has 3 burst shots in a row, MCH can rely on checking the last cast used to queue up the next cast.
-- This is faster than the checking method implemented in the bard opener, but the bard opener is also really fast,
-- you just have to be careful where you check for casts

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

xivopeners_mch.openerInfo = {
    listOpeners = {"Early WF", "Late WF"},
    currentOpenerIndex = 1,
}

xivopeners_mch.openers = {
    earlyWF = {
        xivopeners_mch.openerAbilities.Drill,
        xivopeners_mch.openerAbilities.BarrelStabilizer,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.SplitShot,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.SlugShot,
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
        xivopeners_mch.openerAbilities.Reassamble,
        xivopeners_mch.openerAbilities.AirAnchor,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.CleanShot,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.Drill,
        xivopeners_mch.openerAbilities.GaussRound
    },

    lateWF = {
        xivopeners_mch.openerAbilities.SplitShot,
        xivopeners_mch.openerAbilities.SlugShot, -- a tincture is supposed to be used after this, but i can't be fucked adding logic for that right now
        xivopeners_mch.openerAbilities.CleanShot,
        xivopeners_mch.openerAbilities.SplitShot,
        xivopeners_mch.openerAbilities.Reassemble,
        xivopeners_mch.openerAbilities.BarrelStabilizer,
        xivopeners_mch.openerAbilities.Drill,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.SlugShot,
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
        xivopeners_mch.openerAbilities.SplitShot,
        xivopeners_mch.openerAbilities.Drill
    },
}

xivopeners_mch.abilityQueue = {}
xivopeners_mch.lastCastFromQueue = nil -- might need this for some more complex openers with conditions
xivopeners_mch.openerStarted = false


function xivopeners_mch.getOpener()
    local opener
    if (xivopeners_mch.openerInfo.currentOpenerIndex == 1) then
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

function xivopeners_mch.main(event, tickcount)
    if (Player.level >= xivopeners_mch.supportedLevel) then
        local target = Player:GetTarget()
        if (not target) then return end

        if (not xivopeners_mch.openerAvailable() and not xivopeners_mch.openerStarted) then return end -- don't start opener if it's not available, if it's already started then yolo

        if (xivopeners_mch.openerStarted and next(xivopeners_mch.abilityQueue) == nil) then
            -- opener is finished, pass control to ACR
            xivopeners.log("Finished openers, handing control to ACR")
            xivopeners_mch.openerStarted = false
            if (xivopeners.running) then xivopeners.ToggleRun() end
            if (not FFXIV_Common_BotRunning) then
                ml_global_information.ToggleRun()
            end
            return
        end

        if (ActionList:IsCasting()) then return end

        if (not xivopeners_mch.openerStarted) then
            -- technically, even if you use an ability from prepull, it should still work, since the next time this loop runs it'll jump to the elseif
            xivopeners.log("Starting opener")
            xivopeners_mch.openerStarted = true
            xivopeners_mch.useNextAction(target)
        elseif (xivopeners_mch.lastCastFromQueue and Player.castinginfo.lastcastid == xivopeners_mch.lastCastFromQueue.id) then
            xivopeners_mch.dequeue()
            xivopeners_mch.useNextAction(target)
        else
            xivopeners_mch.useNextAction(target)
        end

    end
end

function xivopeners_mch.queueOpener()
    -- the only time this gets called is when the main script is toggled, so we can do more than just queue the opener
    -- empty queue first
    xivopeners_mch.abilityQueue = {}
    for _, action in pairs(xivopeners_mch.getOpener()) do
        xivopeners_mch.enqueue(action)
    end
--    xivopeners.log("queue:")
--    for _, v in pairs(xivopeners_mch.abilityQueue) do
--        xivopeners.log(v.name)
--    end
    xivopeners_mch.lastCastFromQueue = nil
    xivopeners_mch.openerStarted = false
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
        -- idk how to make it not spam console
        --xivopeners.log("Casting " .. xivopeners_mch.abilityQueue[1].name)
        xivopeners_mch.abilityQueue[1]:Cast(target.id)
        xivopeners_mch.lastCastFromQueue = xivopeners_mch.abilityQueue[1]
    end
end