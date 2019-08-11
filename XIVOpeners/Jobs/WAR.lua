xivopeners_war = {}

xivopeners_war.supportedLevel = 80
xivopeners_war.openerAbilities = {
    Tomahawk = ActionList:Get(1, 46),
    Infuriate = ActionList:Get(1, 52),
    HeavySwing = ActionList:Get(1, 31),
    Maim = ActionList:Get(1, 37),
    StormsEye = ActionList:Get(1, 45),
    InnerChaos = ActionList:Get(1, 16465),
    InnerRelease = ActionList:Get(1, 7389),
    FellCleave = ActionList:Get(1, 3549),
    Upheaval = ActionList:Get(1, 7387),
    Onslaught = ActionList:Get(1, 7386),
    StormsPath = ActionList:Get(1, 42),
    Sprint = ActionList:Get(1, 3),
    Tincture = {name = "Tincture", ids = {27995, 27786}},
    MedicineBuffID = 49,
}

xivopeners_war.openerInfo = {
    listOpeners = {"IC IC IR", "IC IR IC"},
    currentOpenerIndex = 1
}

xivopeners_war.openers = {
    ICICIR = {
        xivopeners_war.openerAbilities.Tomahawk,
        xivopeners_war.openerAbilities.Infuriate,
        xivopeners_war.openerAbilities.HeavySwing,
        xivopeners_war.openerAbilities.Maim,
        xivopeners_war.openerAbilities.StormsEye,
        xivopeners_war.openerAbilities.Tincture,
        xivopeners_war.openerAbilities.InnerChaos,
        xivopeners_war.openerAbilities.Infuriate,
        xivopeners_war.openerAbilities.InnerChaos,
        xivopeners_war.openerAbilities.InnerRelease,
        xivopeners_war.openerAbilities.FellCleave,
        xivopeners_war.openerAbilities.Upheaval,
        xivopeners_war.openerAbilities.FellCleave,
        xivopeners_war.openerAbilities.Onslaught,
        xivopeners_war.openerAbilities.FellCleave,
        xivopeners_war.openerAbilities.FellCleave,
        xivopeners_war.openerAbilities.FellCleave,
        xivopeners_war.openerAbilities.HeavySwing,
        xivopeners_war.openerAbilities.Maim,
        xivopeners_war.openerAbilities.StormsPath,
        xivopeners_war.openerAbilities.HeavySwing,
        xivopeners_war.openerAbilities.Maim,
        xivopeners_war.openerAbilities.StormsEye,
    },

    ICIRIC = {
        xivopeners_war.openerAbilities.Tomahawk,
        xivopeners_war.openerAbilities.Infuriate,
        xivopeners_war.openerAbilities.HeavySwing,
        xivopeners_war.openerAbilities.Maim,
        xivopeners_war.openerAbilities.StormsEye,
        xivopeners_war.openerAbilities.Tincture,
        xivopeners_war.openerAbilities.InnerChaos,
        xivopeners_war.openerAbilities.InnerRelease,
        xivopeners_war.openerAbilities.FellCleave,
        xivopeners_war.openerAbilities.Upheaval,
        xivopeners_war.openerAbilities.FellCleave,
        xivopeners_war.openerAbilities.Onslaught,
        xivopeners_war.openerAbilities.FellCleave,
        xivopeners_war.openerAbilities.FellCleave,
        xivopeners_war.openerAbilities.FellCleave,
        xivopeners_war.openerAbilities.Infuriate,
        xivopeners_war.openerAbilities.InnerChaos,
        xivopeners_war.openerAbilities.HeavySwing,
        xivopeners_war.openerAbilities.Maim,
        xivopeners_war.openerAbilities.StormsPath,
        xivopeners_war.openerAbilities.HeavySwing,
        xivopeners_war.openerAbilities.Maim,
        xivopeners_war.openerAbilities.StormsEye,
    },
}

xivopeners_war.abilityQueue = {}
xivopeners_war.lastCastFromQueue = nil -- might need this for some more complex openers with conditions
xivopeners_war.openerStarted = false
xivopeners_war.useTincture = false
xivopeners_war.lastcastid = 0
xivopeners_war.lastcastid2 = 0

function xivopeners_war.getTincture()
    for i = 0, 3 do
        for _, id in pairs(xivopeners_war.openerAbilities.Tincture.ids) do
            local tincture = Inventory:Get(i):Get(id)
            if (tincture) then return tincture end
        end
    end
    return nil
end

function xivopeners_war.getOpener()
    if (xivopeners_war.openerInfo.currentOpenerIndex == 1) then
        return xivopeners_war.openers.ICICIR
    elseif (xivopeners_war.openerInfo.currentOpenerIndex == 2) then
        return xivopeners_war.openers.ICIRIC
    end
    return {}
end

function xivopeners_war.checkOpenerIds()
    for key, action in pairs(xivopeners_war.getOpener()) do
        if (action == nil) then
            xivopeners.log("WARNING: Action at index " .. tostring(key) .. " was nil! The id is likely incorrect.")
        end
    end
end

function xivopeners_war.openerAvailable()
    -- check cooldowns
    for _, action in pairs(xivopeners_war.getOpener()) do
        if (action == xivopeners_war.openerAbilities.Tincture) then
            local tincture = xivopeners_war.getTincture()
            if (tincture and xivopeners_war.useTincture and tincture:GetAction().cd >= 1.5 and not HasBuff(Player.id, xivopeners_war.openerAbilities.MedicineBuffID)) then
                return false
            end
        elseif (action.cd >= 1.5) then
            return false
        end
    end
    return true
end

function xivopeners_war.queueOpener()
    -- the only time this gets called is when the main script is toggled, so we can do more than just queue the opener
    -- empty queue first
    xivopeners_war.abilityQueue = {}
    for _, action in pairs(xivopeners_war.getOpener()) do
        xivopeners_war.enqueue(action)
    end

    xivopeners_war.lastCastFromQueue = nil
    xivopeners_war.openerStarted = false

    if (xivopeners_war.useTincture and not xivopeners_war.getTincture()) then
        -- if we don't have a tincture but the toggle is on, turn it off
        xivopeners_war.useTincture = false
    end
end

function xivopeners_war.updateLastCast()
    if (xivopeners_war.lastCastFromQueue) then
        if (xivopeners_war.lastcastid == -1) then
            -- compare the real castid and see if it changed, if it did, update from -1
            if (xivopeners_war.lastcastid2 ~= Player.castinginfo.castingid and xivopeners_war.lastCastFromQueue.cd > 0) then
                xivopeners_war.lastcastid = Player.castinginfo.castingid
                xivopeners_war.lastcastid2 = Player.castinginfo.castingid
            end
        elseif (xivopeners_war.lastcastid ~= Player.castinginfo.castingid and xivopeners_war.lastCastFromQueue.cd > 0) then
            xivopeners_war.lastcastid = Player.castinginfo.castingid
            xivopeners_war.lastcastid2 = Player.castinginfo.castingid
        end
    end
end

function xivopeners_war.drawCall(event, tickcount)
    GUI:AlignFirstTextHeightToWidgets()
    GUI:BeginGroup()
    GUI:Text("Use Tincture")
    GUI:NextColumn()
    xivopeners_war.useTincture = GUI:Checkbox("##xivopeners_war_tincturecheck", xivopeners_war.useTincture)
    GUI:EndGroup()
    GUI:NextColumn()
end

function xivopeners_war.main(event, tickcount)
    if (Player.level >= xivopeners_war.supportedLevel) then
        local target = Player:GetTarget()

        if (not target or not target.attackable) then return end

        -- don't start opener if it's not available
        if (not xivopeners_war.openerAvailable() and not xivopeners_war.openerStarted) then
            return
        end -- don't start opener if it's not available, if it's already started then yolo

        if (xivopeners_war.openerStarted and next(xivopeners_war.abilityQueue) == nil) then
            -- opener is finished, pass control to ACR
            xivopeners.log("Finished openers, handing control to ACR")
            xivopeners_war.openerStarted = false
            if (xivopeners.running) then
                xivopeners.ToggleRun()
            end
            if (not FFXIV_Common_BotRunning) then
                ml_global_information.ToggleRun()
            end
            return
        end

        xivopeners_war.updateLastCast()

        if (not xivopeners_war.openerStarted) then
            -- technically, even if you use an ability from prepull, it should still work, since the next time this loop runs it'll jump to the elseif
            xivopeners.log("Starting opener")
            xivopeners_war.openerStarted = true
            xivopeners_war.useNextAction(target)
        elseif (xivopeners_war.lastCastFromQueue and xivopeners_war.lastcastid == xivopeners_war.lastCastFromQueue.id) then
            xivopeners_war.lastcastid = -1
            xivopeners_war.dequeue()
            xivopeners_war.useNextAction(target)
        else
            xivopeners_war.useNextAction(target)
        end
    end
end

function xivopeners_war.enqueue(action)
    -- implementation of the queue can be changed later
    table.insert(xivopeners_war.abilityQueue, action)
end

function xivopeners_war.dequeue()
    xivopeners.log("Dequeing " .. xivopeners_war.abilityQueue[1].name)
    table.remove(xivopeners_war.abilityQueue, 1)
end

function xivopeners_war.useNextAction(target)
    -- do the actual opener
    -- the current implementation uses a queue system
    if (target and target.attackable and xivopeners_war.abilityQueue[1]) then
        if (xivopeners_war.abilityQueue[1] == xivopeners_war.openerAbilities.Tincture) then
            local tincture = xivopeners_war.getTincture()
            if (HasBuff(Player.id, xivopeners_war.openerAbilities.MedicineBuffID) or not xivopeners_war.useTincture or not tincture) then
                xivopeners.log("Tincture already used during opener, not enabled, or not available, dequeueing")
                xivopeners_war.dequeue()
                return
            end

            if (tincture) then
                xivopeners.log("Casting tincture")
                tincture:Cast()
                xivopeners_war.lastCastFromQueue = tincture:GetAction()
            end
            -- don't want to continue past this point or we risk breaking shit
            return
        end

        -- delay buff until end of gcd so we can get the highest amount of gcds inside the buff window
        if (xivopeners_war.abilityQueue[1] == xivopeners_war.openerAbilities.InnerRelease) then
            -- wait until there's 0.9s on the gcd
            if (xivopeners_war.openerAbilities.HeavySwing.cdmax - xivopeners_war.openerAbilities.HeavySwing.cd < 0.9) then
                xivopeners_war.abilityQueue[1]:Cast(target.id)
                xivopeners_war.lastCastFromQueue = xivopeners_war.abilityQueue[1]
            end
            return
        end

        xivopeners_war.abilityQueue[1]:Cast(target.id)
        xivopeners_war.lastCastFromQueue = xivopeners_war.abilityQueue[1]
    end
end