xivopeners_drg = {}

xivopeners_drg.supportedLevel = 80
xivopeners_drg.openerAbilities = {
    BloodOfTheDragon = ActionList:Get(1, 3553),
    TrueThrust = ActionList:Get(1, 75),
    DragonSight = ActionList:Get(1, 7398),
    Disembowel = ActionList:Get(1, 87),
    BattleLitany = ActionList:Get(1, 3557),
    LanceCharge = ActionList:Get(1, 85),
    ChaosThrust = ActionList:Get(1, 88),
    HighJump = ActionList:Get(1, 16478),
    WheelingThrust = ActionList:Get(1, 3556),
    FangAndClaw = ActionList:Get(1, 3554),
    Geirskogul = ActionList:Get(1, 3555),
    RaidenThrust = ActionList:Get(1, 16479),
    SpineshatterDive = ActionList:Get(1, 95),
    VorpalThrust = ActionList:Get(1, 78),
    LifeSurge = ActionList:Get(1, 83),
    MirageDive = ActionList:Get(1, 7399),
    FullThrust = ActionList:Get(1, 84),
    DragonfireDive = ActionList:Get(1, 96),
    BloodOfTheDragonBuffID = 0,
    Tincture = {name = "Tincture", ids = {27995, 27786}},
    MedicineBuffID = 49
}

xivopeners_drg.openerInfo = {
    listOpeners = {"Standard [2.36-2.5]", "Gotta go fast [2.35 and below]"},
    currentOpenerIndex = 1
}

xivopeners_drg.openers = {
    standard = {
        xivopeners_drg.openerAbilities.BloodOfTheDragon,
        xivopeners_drg.openerAbilities.Tincture,
        xivopeners_drg.openerAbilities.TrueThrust,
        xivopeners_drg.openerAbilities.DragonSight,
        xivopeners_drg.openerAbilities.Disembowel,
        xivopeners_drg.openerAbilities.BattleLitany,
        xivopeners_drg.openerAbilities.LanceCharge,
        xivopeners_drg.openerAbilities.ChaosThrust,
        xivopeners_drg.openerAbilities.HighJump,
        xivopeners_drg.openerAbilities.WheelingThrust,
        xivopeners_drg.openerAbilities.FangAndClaw,
        xivopeners_drg.openerAbilities.Geirskogul,
        xivopeners_drg.openerAbilities.RaidenThrust,
        xivopeners_drg.openerAbilities.SpineshatterDive,
        xivopeners_drg.openerAbilities.VorpalThrust,
        xivopeners_drg.openerAbilities.LifeSurge,
        xivopeners_drg.openerAbilities.MirageDive,
        xivopeners_drg.openerAbilities.FullThrust,
        xivopeners_drg.openerAbilities.DragonfireDive,
        xivopeners_drg.openerAbilities.FangAndClaw,
        xivopeners_drg.openerAbilities.WheelingThrust
    },

    fast = {
        xivopeners_drg.openerAbilities.BloodOfTheDragon,
        xivopeners_drg.openerAbilities.Tincture,
        xivopeners_drg.openerAbilities.TrueThrust,
        xivopeners_drg.openerAbilities.BattleLitany,
        xivopeners_drg.openerAbilities.Disembowel,
        xivopeners_drg.openerAbilities.DragonSight,
        xivopeners_drg.openerAbilities.LanceCharge,
        xivopeners_drg.openerAbilities.ChaosThrust,
        xivopeners_drg.openerAbilities.WheelingThrust,
        xivopeners_drg.openerAbilities.FangAndClaw,
        xivopeners_drg.openerAbilities.Geirskogul,
        xivopeners_drg.openerAbilities.RaidenThrust,
        xivopeners_drg.openerAbilities.HighJump,
        xivopeners_drg.openerAbilities.VorpalThrust,
        xivopeners_drg.openerAbilities.LifeSurge,
        xivopeners_drg.openerAbilities.MirageDive,
        xivopeners_drg.openerAbilities.FullThrust,
        xivopeners_drg.openerAbilities.SpineshatterDive,
        xivopeners_drg.openerAbilities.FangAndClaw,
        xivopeners_drg.openerAbilities.DragonfireDive,
        xivopeners_drg.openerAbilities.WheelingThrust,
    }
}

xivopeners_drg.abilityQueue = {}
xivopeners_drg.lastCastFromQueue = nil -- might need this for some more complex openers with conditions
xivopeners_drg.openerStarted = false
xivopeners_drg.useTincture = false
xivopeners_drg.lastcastid = 0
xivopeners_drg.lastcastid2 = 0
xivopeners_drg.nextPos = "any"
xivopeners_drg.rear = "rear"
xivopeners_drg.flank = "flank"

function xivopeners_drg.getTincture()
    for i = 0, 3 do
        for _, id in pairs(xivopeners_drg.openerAbilities.Tincture.ids) do
            local tincture = Inventory:Get(i):Get(id)
            if (tincture) then return tincture end
        end
    end
    return nil
end

function xivopeners_drg.getOpener()
    if (xivopeners_drg.openerInfo.currentOpenerIndex == 1) then
        return xivopeners_drg.openers.standard
    elseif (xivopeners_drg.openerInfo.currentOpenerIndex == 2) then
        return xivopeners_drg.openers.fast
    end
    return {}
end

function xivopeners_drg.checkOpenerIds()
    for key, action in pairs(xivopeners_drg.getOpener()) do
        if (action == nil) then
            xivopeners.log("WARNING: Action at index " .. tostring(key) .. " was nil! The id is likely incorrect.")
        end
    end
end

function xivopeners_drg.openerAvailable()
    -- check cooldowns
    for _, action in pairs(xivopeners_drg.getOpener()) do
        if (action == xivopeners_drg.openerAbilities.Tincture) then
            local tincture = xivopeners_drg.getTincture()
            if (tincture and xivopeners_drg.useTincture and tincture:GetAction().cd >= 1.5 and not HasBuff(Player.id, xivopeners_mnk.openerAbilities.MedicineBuffID)) then
                return false
            end
        elseif (action == xivopeners_drg.openerAbilities.BloodOfTheDragon) then
            if (action.cd >= 1.5 and not HasBuff(Player.id, xivopeners_drg.openerAbilities.BloodOfTheDragonBuffID)) then
                return false
            end
        elseif (action.cd >= 1.5) then
            return false
        end
    end
    return true
end

function xivopeners_drg.queueOpener()
    -- the only time this gets called is when the main script is toggled, so we can do more than just queue the opener
    -- empty queue first
    xivopeners_drg.abilityQueue = {}
    for _, action in pairs(xivopeners_drg.getOpener()) do
        xivopeners_drg.enqueue(action)
    end
    --    xivopeners.log("queue:")
    --    for _, v in pairs(xivopeners_drg.abilityQueue) do
    --        xivopeners.log(v.name)
    --    end
    xivopeners_drg.lastCastFromQueue = nil
    xivopeners_drg.openerStarted = false

    if (xivopeners_drg.useTincture and not xivopeners_drg.getTincture()) then
        -- if we don't have a tincture but the toggle is on, turn it off
        xivopeners_drg.useTincture = false
    end
end

function xivopeners_drg.updateLastCast()
    --    xivopeners.log(tostring(xivopeners_drg.lastcastid) .. ", " .. tostring(xivopeners_drg.lastcastid2) .. ", " .. tostring(Player.castinginfo.lastcastid))
    if (xivopeners_drg.lastCastFromQueue) then
        if (xivopeners_drg.lastcastid == -1) then
            -- compare the real castid and see if it changed, if it did, update from -1
            if (xivopeners_drg.lastcastid2 ~= Player.castinginfo.castingid and xivopeners_drg.lastCastFromQueue.cd > 0) then
                xivopeners.log("cast changed")
                xivopeners_drg.lastcastid = Player.castinginfo.castingid
                xivopeners_drg.lastcastid2 = Player.castinginfo.castingid
            end
        elseif (xivopeners_drg.lastcastid ~= Player.castinginfo.castingid and xivopeners_drg.lastCastFromQueue.cd > 0) then
            xivopeners_drg.lastcastid = Player.castinginfo.castingid
            xivopeners_drg.lastcastid2 = Player.castinginfo.castingid
        end
    end
end

function xivopeners_drg.drawCall(event, tickcount)
    GUI:AlignFirstTextHeightToWidgets()
    GUI:BeginGroup()
    GUI:Text("Use Tincture")
    GUI:NextColumn()
    xivopeners_drg.useTincture = GUI:Checkbox("##xivopeners_drg_tincturecheck", xivopeners_drg.useTincture)
    GUI:EndGroup()
    GUI:NextColumn()
end

function xivopeners_drg.main(event, tickcount)
    if (Player.level >= xivopeners_drg.supportedLevel) then
        local target = Player:GetTarget()
        if (not target) then
            return
        end

        if (not xivopeners_drg.openerAvailable() and not xivopeners_drg.openerStarted) then
            return
        end -- don't start opener if it's not available, if it's already started then yolo

        if (xivopeners_drg.openerStarted and next(xivopeners_drg.abilityQueue) == nil) then
            -- opener is finished, pass control to ACR
            xivopeners.log("Finished openers, handing control to ACR")
            xivopeners_drg.openerStarted = false
            if (xivopeners.running) then
                xivopeners.ToggleRun()
            end
            if (not FFXIV_Common_BotRunning) then
                ml_global_information.ToggleRun()
            end
            return
        end

        xivopeners_drg.updateLastCast()

        if (ActionList:IsCasting()) then return end

        if (not xivopeners_drg.openerStarted) then
            -- technically, even if you use an ability from prepull, it should still work, since the next time this loop runs it'll jump to the elseif
            xivopeners.log("Starting opener")
            xivopeners_drg.openerStarted = true
            xivopeners_drg.useNextAction(target)
        elseif (xivopeners_drg.lastCastFromQueue and xivopeners_drg.lastcastid == xivopeners_drg.lastCastFromQueue.id) then
            xivopeners_drg.lastcastid = -1
            xivopeners_drg.dequeue()
            xivopeners_drg.useNextAction(target)
        else
            xivopeners_drg.useNextAction(target)
        end
    end
end

function xivopeners_drg.enqueue(action)
    -- implementation of the queue can be changed later
    table.insert(xivopeners_drg.abilityQueue, action)
end

function xivopeners_drg.dequeue()
    xivopeners.log("Dequeing " .. xivopeners_drg.abilityQueue[1].name)
    table.remove(xivopeners_drg.abilityQueue, 1)
end

function xivopeners_drg.useNextAction(target)
    -- do the actual opener
    -- the current implementation uses a queue system
    if (target and target.attackable and xivopeners_drg.abilityQueue[1]) then
        if (xivopeners_drg.abilityQueue[1] == xivopeners_drg.openerAbilities.Tincture) then
            local tincture = xivopeners_drg.getTincture()
            if (HasBuff(Player.id, xivopeners_drg.openerAbilities.MedicineBuffID) or not xivopeners_drg.useTincture or not tincture) then
                xivopeners.log("Tincture already used during opener, not enabled, or not available, dequeueing")
                xivopeners_drg.dequeue()
                return
            end

            if (tincture) then
                xivopeners.log("Casting tincture")
                tincture:Cast()
                xivopeners_drg.lastCastFromQueue = tincture:GetAction()
            end
            -- don't want to continue past this point or we risk breaking shit
            return
        end
        
        -- check for prepull blood of the dragon
        if (xivopeners_drg.abilityQueue[1] == xivopeners_drg.openerAbilities.BloodOfTheDragon and HasBuff(Player.id, xivopeners_drg.openerAbilities.BloodOfTheDragonBuffID)) then
            xivopeners.log("Player already used botd prepull, continue with opener")
            xivopeners_drg.dequeue()
            return
        end



        -- idk how to make it not spam console
        --xivopeners.log("Casting " .. xivopeners_drg.abilityQueue[1].name)
        xivopeners_drg.abilityQueue[1]:Cast(target.id)
        xivopeners_drg.lastCastFromQueue = xivopeners_drg.abilityQueue[1]
    end
end
