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
    HyperCharge = ActionList:Get(1, 17209),
    HeatBlast = ActionList:Get(1, 7410),
    Reassemble = ActionList:Get(1, 2876),
    AirAnchor = ActionList:Get(1, 16500),
    CleanShot = ActionList:Get(1, 7413),
    Tincture = {name = "Tincture", ids = {27996, 27787}},
    MedicineBuffID = 49,
}

xivopeners_mch.openerInfo = {
    listOpeners = {"General", "Early WF", "Late WF", "Top Parse", "Late Hypercharge"},
    currentOpenerIndex = 1,
}

xivopeners_mch.openers = {
    general = {
        xivopeners_mch.openerAbilities.Reassemble,
        xivopeners_mch.openerAbilities.Drill,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.SplitShot,
        xivopeners_mch.openerAbilities.Reassemble,
        xivopeners_mch.openerAbilities.AirAnchor,
        xivopeners_mch.openerAbilities.SlugShot,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.CleanShot,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.HyperCharge,
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

    earlyWF = {
        xivopeners_mch.openerAbilities.Tincture,
        xivopeners_mch.openerAbilities.Drill,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.SplitShot,
        xivopeners_mch.openerAbilities.BarrelStabilizer,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.SlugShot,
        xivopeners_mch.openerAbilities.Wildfire,
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
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.CleanShot,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.AirAnchor,
        xivopeners_mch.openerAbilities.Reassemble,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Drill,
        xivopeners_mch.openerAbilities.Ricochet
        },

    lateWF = {
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
        xivopeners_mch.openerAbilities.Drill,
    },

    topParse = {
        xivopeners_mch.openerAbilities.Tincture,
        xivopeners_mch.openerAbilities.Reassemble,
        xivopeners_mch.openerAbilities.AirAnchor,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.Drill,
        xivopeners_mch.openerAbilities.BarrelStabilizer,
        xivopeners_mch.openerAbilities.SplitShot,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Richochet,
        xivopeners_mch.openerAbilities.SlugShot,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Richochet,
        xivopeners_mch.openerAbilities.CleanShot,
        xivopeners_mch.openerAbilities.Wildfire,
        xivopeners_mch.openerAbilities.HyperCharge,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.HeatBlast,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.SplitShot,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Drill,
        xivopeners_mch.openerAbilities.Ricochet,
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
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.CleanShot,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Ricochet,
        xivopeners_mch.openerAbilities.AirAnchor,
        xivopeners_mch.openerAbilities.Reassemble,
        xivopeners_mch.openerAbilities.GaussRound,
        xivopeners_mch.openerAbilities.Drill,
        xivopeners_mch.openerAbilities.Ricochet
    }
}

xivopeners_mch.abilityQueue = {}
xivopeners_mch.lastCastFromQueue = nil -- might need this for some more complex openers with conditions
xivopeners_mch.openerStarted = false
xivopeners_mch.useTincture = false
xivopeners_mch.lastcastid = 0
xivopeners_mch.lastcastid2 = 0

function xivopeners_mch.getTincture()
    for i = 0, 3 do
        for _, id in pairs(xivopeners_mch.openerAbilities.Tincture.ids) do
            local tincture = Inventory:Get(i):Get(id)
            if (tincture) then return tincture end
        end
    end
    return nil
end

function xivopeners_mch.getOpener()
    if (xivopeners_mch.openerInfo.currentOpenerIndex == 1) then
        return xivopeners_mch.openers.general
    elseif (xivopeners_mch.openerInfo.currentOpenerIndex == 2) then
        return xivopeners_mch.openers.earlyWF
    elseif (xivopeners_mch.openerInfo.currentOpenerIndex == 3) then
        return xivopeners_mch.openers.lateWF
    elseif (xivopeners_mch.openerInfo.currentOpenerIndex == 4) then
        return xivopeners_mch.openers.topParse
    elseif (xivopeners_mch.openerInfo.currentOpenerIndex == 5) then
        return xivopeners_mch.openers.lateHypercharge
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
            if (tincture and xivopeners_mch.useTincture and tincture:GetAction().cd >= 1.5 and not HasBuff(Player.id, xivopeners_mch.openerAbilities.MedicineBuffID)) then
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
    if (xivopeners_mch.useTincture and not xivopeners_mch.getTincture()) then
        xivopeners_mch.useTincture = false
    end
end

function xivopeners_mch.updateLastCast()
    --    xivopeners.log(tostring(xivopeners_mch.lastcastid) .. ", " .. tostring(xivopeners_mch.lastcastid2) .. ", " .. tostring(Player.castinginfo.lastcastid))
    if (xivopeners_mch.lastCastFromQueue) then
        if (xivopeners_mch.lastcastid == -1) then
            -- compare the real castid and see if it changed, if it did, update from -1
            if (xivopeners_mch.lastcastid2 ~= Player.castinginfo.castingid and xivopeners_mch.lastCastFromQueue.cd > 0) then
                xivopeners.log("cast changed")
                xivopeners_mch.lastcastid = Player.castinginfo.castingid
                xivopeners_mch.lastcastid2 = Player.castinginfo.castingid
            end
        elseif (xivopeners_mch.lastcastid ~= Player.castinginfo.castingid and xivopeners_mch.lastCastFromQueue.cd > 0) then
            xivopeners_mch.lastcastid = Player.castinginfo.castingid
            xivopeners_mch.lastcastid2 = Player.castinginfo.castingid
        end
    end
end

function xivopeners_mch.drawCall(event, tickcount)
    GUI:AlignFirstTextHeightToWidgets()
    GUI:BeginGroup()
    GUI:Text("Use Tincture")
    GUI:NextColumn()
    xivopeners_mch.useTincture = GUI:Checkbox("##xivopeners_mch_tincturecheck", xivopeners_mch.useTincture)
    GUI:EndGroup()
    GUI:NextColumn()
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

        xivopeners_mch.updateLastCast()

        if (not xivopeners_mch.openerStarted) then
            -- technically, even if you use an ability from prepull, it should still work, since the next time this loop runs it'll jump to the elseif
            xivopeners.log("Starting opener")
            xivopeners_mch.openerStarted = true
            xivopeners_mch.useNextAction(target)
        elseif (xivopeners_mch.lastCastFromQueue and xivopeners_mch.lastcastid == xivopeners_mch.lastCastFromQueue.id) then
            if (xivopeners_mch.lastCastFromQueue == xivopeners_mch.openerAbilities.BarrelStabilizer and Player.gauge[1] < 50) then
                xivopeners_mch.useNextAction(target)
                return
            end
            xivopeners_mch.lastcastid = -1
            xivopeners_mch.dequeue()
            xivopeners_mch.useNextAction(target)
        else
            xivopeners_mch.useNextAction(target)
        end

    end
end

function xivopeners_mch.enqueue(action)
    -- implementation of the queue can be changed later
    table.insert(xivopeners_mch.abilityQueue, action)
end

function xivopeners_mch.dequeue()
    xivopeners.log("Dequeing " .. xivopeners_mch.abilityQueue[1].name)
    table.remove(xivopeners_mch.abilityQueue, 1)
end

function xivopeners_mch.useNextAction(target)
    -- do the actual opener
    -- the current implementation uses a queue system
    if (target and target.attackable and xivopeners_mch.abilityQueue[1]) then
        -- tincture check
        if (xivopeners_mch.abilityQueue[1] == xivopeners_mch.openerAbilities.Tincture) then
            local tincture = xivopeners_mch.getTincture()
            if (HasBuff(Player.id, xivopeners_mch.openerAbilities.MedicineBuffID) or not xivopeners_mch.useTincture or not tincture) then
                xivopeners.log("Tincture already used during opener, not enabled, or not available, dequeueing")
                xivopeners_mch.dequeue()
                return
            end

            if (tincture) then
                xivopeners.log("Casting tincture")
                tincture:Cast()
                xivopeners_mch.lastCastFromQueue = tincture:GetAction()
            end
            -- don't want to continue past this point or we risk breaking shit
            return
        end
        -- idk how to make it not spam console
        --xivopeners.log("Casting " .. xivopeners_mch.abilityQueue[1].name)
        xivopeners_mch.abilityQueue[1]:Cast(target.id)
        xivopeners_mch.lastCastFromQueue = xivopeners_mch.abilityQueue[1]
    end
end