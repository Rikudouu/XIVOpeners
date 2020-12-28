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
    Wildfire = ActionList:Get(1, 2878),
    Hypercharge = ActionList:Get(1, 17209),
    HeatBlast = ActionList:Get(1, 7410),
    Reassemble = ActionList:Get(1, 2876),
    AirAnchor = ActionList:Get(1, 16500),
    CleanShot = ActionList:Get(1, 7413),
    ReassembleBuffID = 851,
    Tincture = {name = "Tincture", ids = {31894, 29493, 27996, 27787}, range = 0, id = 846},
    MedicineBuffID = 49,
}

xivopeners_mch.openerInfo = {
    listOpeners = {"General", "Quick", "Early Crit DH Buffs", "Late Crit DH Buffs", "Multiplier Buffs", "Delayed Burst", "Late Hypercharge", "High Ping"}
}

xivopeners_mch.openers = {
    general = {
        xivopeners_mch.openerAbilities.Reassemble,
        xivopeners_mch.openerAbilities.Tincture,
        xivopeners_mch.openerAbilities.Drill,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.SplitShot,
        xivopeners_mch.openerAbilities.BarrelStabilizer,
        xivopeners_mch.openerAbilities.SlugShot,
        xivopeners_mch.openerAbilities.AirAnchor,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.CleanShot,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Hypercharge,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.Wildfire,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Drill,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.SplitShot,
        xivopeners_mch.openerAbilities.Ricochet,
    },

    quick = {
        xivopeners_mch.openerAbilities.Reassemble,
        xivopeners_mch.openerAbilities.Tincture,
        xivopeners_mch.openerAbilities.Drill,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.SplitShot,
        xivopeners_mch.openerAbilities.BarrelStabilizer,
        xivopeners_mch.openerAbilities.Wildfire,
        xivopeners_mch.openerAbilities.AirAnchor,
        xivopeners_mch.openerAbilities.GaussRound,
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
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.SlugShot,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.CleanShot,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.Drill,
    },

    earlycdh = {
        xivopeners_mch.openerAbilities.Reassemble,
        xivopeners_mch.openerAbilities.Tincture,
        xivopeners_mch.openerAbilities.Drill,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.SplitShot,
        xivopeners_mch.openerAbilities.BarrelStabilizer,
        xivopeners_mch.openerAbilities.SlugShot,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.AirAnchor,
        xivopeners_mch.openerAbilities.Wildfire,
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
        xivopeners_mch.openerAbilities.Drill,
        xivopeners_mch.openerAbilities.Ricochet,
    },

    latecdh = {
        xivopeners_mch.openerAbilities.Reassemble,
        xivopeners_mch.openerAbilities.Tincture,
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
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.CleanShot,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.AirAnchor,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.Drill,
    },

    latemultiplier = {
        xivopeners_mch.openerAbilities.Tincture,
        xivopeners_mch.openerAbilities.Drill,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.SplitShot,
        xivopeners_mch.openerAbilities.BarrelStabilizer,
        xivopeners_mch.openerAbilities.SlugShot,
        xivopeners_mch.openerAbilities.AirAnchor,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.CleanShot,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Hypercharge,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.Wildfire,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.Reassemble,
        xivopeners_mch.openerAbilities.Drill,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.SplitShot,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
    },

    delayedmultiplier = {
        xivopeners_mch.openerAbilities.SplitShot,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.SlugShot,
        xivopeners_mch.openerAbilities.Tincture,
        xivopeners_mch.openerAbilities.CleanShot,
        xivopeners_mch.openerAbilities.BarrelStabilizer,
        xivopeners_mch.openerAbilities.SplitShot,
        xivopeners_mch.openerAbilities.Reassemble,
        xivopeners_mch.openerAbilities.Drill,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.SlugShot,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.AirAnchor,
        xivopeners_mch.openerAbilities.Wildfire,
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
        xivopeners_mch.openerAbilities.SplitShot,
        xivopeners_mch.openerAbilities.Drill,
    },

    lateHypercharge = {
        xivopeners_mch.openerAbilities.Tincture,
        xivopeners_mch.openerAbilities.Drill,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.SplitShot,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Wildfire,
        xivopeners_mch.openerAbilities.SlugShot,
        xivopeners_mch.openerAbilities.BarrelStabilizer,
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

    highPing = {
        xivopeners_mch.openerAbilities.Tincture,
        xivopeners_mch.openerAbilities.SplitShot,
        xivopeners_mch.openerAbilities.Reassemble,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Drill,
        xivopeners_mch.openerAbilities.BarrelStabilizer,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.SlugShot,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.CleanShot,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.AirAnchor,
        xivopeners_mch.openerAbilities.Wildfire,
        xivopeners_mch.openerAbilities.Hypercharge,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.SplitShot,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.Drill,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
    },
}

xivopeners_mch.abilityQueue = {}
xivopeners_mch.lastCastFromQueue = nil -- might need this for some more complex openers with conditions
xivopeners_mch.openerStarted = false
xivopeners_mch.timeLastAction = 0

function xivopeners_mch.getTincture()
    if TensorCore.API[gACRSelectedProfiles[Player.job]] ~= nil then
        local pot = TensorCore.API[gACRSelectedProfiles[Player.job]].getPotion()
        if pot ~= nil and pot:isReady() then
            return pot
        end

        return nil
    end

    for i = 0, 3 do
        for _, id in ipairs(xivopeners_mch.openerAbilities.Tincture.ids) do
            local tincture = Inventory:Get(i):Get(id)
            if (tincture and tincture:GetAction().cdmax - tincture:GetAction().cd < 1.5) then return tincture end
        end
    end
    return nil
end

function xivopeners_mch.getOpener()
    if (xivopeners.settings[Player.job].currentOpenerIndex == 1) then
        return xivopeners_mch.openers.general
    elseif (xivopeners.settings[Player.job].currentOpenerIndex == 2) then
        return xivopeners_mch.openers.quick
    elseif (xivopeners.settings[Player.job].currentOpenerIndex == 3) then
        return xivopeners_mch.openers.earlycdh
    elseif (xivopeners.settings[Player.job].currentOpenerIndex == 4) then
        return xivopeners_mch.openers.latecdh
    elseif (xivopeners.settings[Player.job].currentOpenerIndex == 5) then
        return xivopeners_mch.openers.latemultiplier
    elseif (xivopeners.settings[Player.job].currentOpenerIndex == 6) then
        return xivopeners_mch.openers.delayedmultiplier
    elseif (xivopeners.settings[Player.job].currentOpenerIndex == 7) then
        return xivopeners_mch.openers.lateHypercharge
    elseif (xivopeners.settings[Player.job].currentOpenerIndex == 8) then
        return xivopeners_mch.openers.highPing
    else
        return {}
    end
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
        if (action == xivopeners_mch.openerAbilities.Tincture) then
            local tincture = xivopeners_mch.getTincture()
            if (tincture and xivopeners.settings[Player.job].useTincture and tincture:GetAction().cd >= 1.5 and not HasBuff(Player.id, xivopeners_mch.openerAbilities.MedicineBuffID)) then
                return false
            end
        elseif (action == xivopeners_mch.openerAbilities.Reassemble) then
            if (action.cd >= 1.5 and not HasBuff(Player.id, xivopeners_mch.openerAbilities.ReassembleBuffID)) then
                return false
            end
        elseif (action.cd >= 1.5) then
            return false
        end
    end
    return true
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
    -- if (xivopeners.settings[Player.job].useTincture and not xivopeners_mch.getTincture()) then
    --     xivopeners.settings[Player.job].useTincture = false
    -- end
end

function xivopeners_mch.drawCall(event, tickcount)
    GUI:AlignFirstTextHeightToWidgets()
    GUI:BeginGroup()
    GUI:Text("Use Tincture")
    GUI:NextColumn()
    xivopeners.settings[Player.job].useTincture = GUI:Checkbox("##xivopeners_mch_tincturecheck", xivopeners.settings[Player.job].useTincture)
    GUI:EndGroup()
    GUI:NextColumn()
end

function xivopeners_mch.isStalled()
    local nextQueuedAction = TensorCore.getLastAction()
    local lastSuccessfulAction = TensorCore.getLastSuccessfulCast()
    local nextAction = xivopeners_mch.abilityQueue[1]

    -- have not used an action for longer than a gcd
    if TimeSince(xivopeners_mch.timeLastAction) > TensorCore.currentGCD + 1000 then
        xivopeners.log("Inactivity stall")
        return true
    end

    -- mch specific checks

    -- not enough heat to use hc, something messed up
    if nextAction
    and nextAction.id == xivopeners_mch.openerAbilities.Hypercharge.id
    and Player.gauge[1] < 50
    and (not nextQueuedAction or (nextQueuedAction.id ~= xivopeners_mch.openerAbilities.BarrelStabilizer.id and nextQueuedAction.id ~= xivopeners_mch.openerAbilities.Hypercharge.id))
    and (not lastSuccessfulAction or lastSuccessfulAction.id ~= xivopeners_mch.openerAbilities.BarrelStabilizer.id)
    then
        xivopeners.log("HC no heat stall")
        return true
    end

    -- heat blast is next but no overheat left
    if nextAction and nextAction.id == xivopeners_mch.openerAbilities.HeatBlast.id and Player.gauge[3] <= 0 and (not lastSuccessfulAction or lastSuccessfulAction.id ~= xivopeners_mch.openerAbilities.Hypercharge.id) then
        xivopeners.log("HB no Overheat stall")
        return true
    end

    return false
end

function xivopeners_mch.main(event, tickcount)
    if (Player.level >= xivopeners_mch.supportedLevel) then
        local target = Player:GetTarget()

        if (not target or not target.attackable) then return end

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

        if (not xivopeners_mch.openerStarted) then
            -- technically, even if you use an ability from prepull, it should still work, since the next time this loop runs it'll jump to the elseif
            xivopeners.log("Starting opener")
            xivopeners_mch.openerStarted = true
            xivopeners_mch.timeLastAction = Now()
            xivopeners_mch.useNextAction(target)
        elseif xivopeners_mch.isStalled() then -- stall check
            xivopeners.log("Stall detected, handing control to ACR")
            xivopeners_mch.openerStarted = false
            if (xivopeners.running) then xivopeners.ToggleRun() end
            if (not FFXIV_Common_BotRunning) then
                ml_global_information.ToggleRun()
            end
            return
        elseif xivopeners_mch.lastCastFromQueue and xivopeners_mch.lastCastFromQueue.used == true then
            -- if (xivopeners_mch.lastCastFromQueue == xivopeners_mch.openerAbilities.BarrelStabilizer and Player.gauge[1] < 50) then
            --     xivopeners_mch.useNextAction(target)
            --     return
            -- end
            xivopeners_mch.timeLastAction = Now()
            xivopeners_mch.lastCastFromQueue.used = nil
            xivopeners_mch.lastCastFromQueue = nil
            xivopeners_mch.dequeue()
            xivopeners_mch.useNextAction(target)
        else
            xivopeners_mch.useNextAction(target)
        end

    end
end

function xivopeners_mch.enqueue(action)
    -- implementation of the queue can be changed later
    action.used = nil
    table.insert(xivopeners_mch.abilityQueue, action)
end

function xivopeners_mch.dequeue()
    xivopeners.log("Dequeing " .. xivopeners_mch.abilityQueue[1].name)
    xivopeners_mch.abilityQueue[1].used = nil
    table.remove(xivopeners_mch.abilityQueue, 1)
end

function xivopeners_mch.useNextAction(target)
    -- do the actual opener
    -- the current implementation uses a queue system
    if (target and target.attackable and xivopeners_mch.abilityQueue[1] and (xivopeners_mch.abilityQueue[1].range <= 0 or target.distance2d <= xivopeners_mch.abilityQueue[1].range)) then
        -- tincture check
        if (xivopeners_mch.abilityQueue[1] == xivopeners_mch.openerAbilities.Tincture) then
            local tincture = xivopeners_mch.getTincture()
            if (HasBuff(Player.id, xivopeners_mch.openerAbilities.MedicineBuffID) or not xivopeners.settings[Player.job].useTincture or not tincture) then
                xivopeners.log("Tincture already used during opener, not enabled, or not available, dequeueing")
                xivopeners_mch.dequeue()
                return
            end

            if (tincture) then
                xivopeners.log("Casting tincture")
                tincture:Cast(Player.id)
                xivopeners_mch.lastCastFromQueue = xivopeners_mch.abilityQueue[1]
                TensorCore.awaitCastCompletion(xivopeners_mch.lastCastFromQueue)
            end
            -- don't want to continue past this point or we risk breaking shit
            return
        end
        
        -- prepull reassemble
        if (xivopeners_mch.abilityQueue[1] == xivopeners_mch.openerAbilities.Reassemble and HasBuff(Player.id, xivopeners_mch.openerAbilities.ReassembleBuffID)) then
            xivopeners.log("Player already used reassemble prepull, continue with opener")
            xivopeners_mch.dequeue()
            return
        end
    
        -- idk how to make it not spam console
        --xivopeners.log("Casting " .. xivopeners_mch.abilityQueue[1].name)
        xivopeners_mch.abilityQueue[1]:Cast(target.id)
        xivopeners_mch.lastCastFromQueue = xivopeners_mch.abilityQueue[1]
        TensorCore.awaitCastCompletion(xivopeners_mch.lastCastFromQueue)
    end
end