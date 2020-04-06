xivopeners_brd = {}

xivopeners_brd.debug = false

xivopeners_brd.supportedLevel = 80
xivopeners_brd.openerAbilities = {
    BurstShot = ActionList:Get(1, 16495),
    RefulgentArrow = ActionList:Get(1, 7409),
    IronJaws = ActionList:Get(1, 3560),
    Sidewinder = ActionList:Get(1, 3562),
    EmpyrealArrow = ActionList:Get(1, 3558),
    Barrage = ActionList:Get(1, 107),
    RagingStrikes = ActionList:Get(1, 101),
    Bloodletter = ActionList:Get(1, 110),
    Stormbite = ActionList:Get(1, 7407),
    CausticBite = ActionList:Get(1, 7406),
    WanderersMinuet = ActionList:Get(1, 3559),
    BattleVoice = ActionList:Get(1, 118),
    PitchPerfect = ActionList:Get(1, 7404),
    StraightShotReadyBuffID = 122,
    RagingStrikesBuffID = 125,
    BarrageBuffID = 128,
    Tincture = {name = "Tincture", ids = {29493, 27996, 27787}, range = 0, id = 846},
    MedicineBuffID = 49,
}

xivopeners_brd.openerInfo = {
    listOpeners = {"Recommended", "TEA", "No Ninja", "Compatibility"},
}

xivopeners_brd.openers = {
    recommended = {
        xivopeners_brd.openerAbilities.Tincture,
        xivopeners_brd.openerAbilities.RagingStrikes,
        xivopeners_brd.openerAbilities.Stormbite,
        xivopeners_brd.openerAbilities.Bloodletter,
        xivopeners_brd.openerAbilities.WanderersMinuet,
        xivopeners_brd.openerAbilities.CausticBite,
        xivopeners_brd.openerAbilities.EmpyrealArrow,
        xivopeners_brd.openerAbilities.BattleVoice, -- after this point it's either 3 burst shots, or RA procs if we get them
        xivopeners_brd.openerAbilities.BurstShot,
        xivopeners_brd.openerAbilities.BurstShot,
        xivopeners_brd.openerAbilities.BurstShot,
        xivopeners_brd.openerAbilities.RefulgentArrow, -- this will be dequeued if we don't have straight shot ready
        xivopeners_brd.openerAbilities.Barrage, -- need a check here for an RA proc, and use that instead
        xivopeners_brd.openerAbilities.RefulgentArrow,
        xivopeners_brd.openerAbilities.Sidewinder,
--        xivopeners_brd.openerAbilities.BurstShot, -- this is going to get inserted if we don't get the RA proc
        xivopeners_brd.openerAbilities.Bloodletter,
        xivopeners_brd.openerAbilities.IronJaws,
        xivopeners_brd.openerAbilities.EmpyrealArrow
    },

    tea = {
        xivopeners_brd.openerAbilities.Tincture,
        xivopeners_brd.openerAbilities.RagingStrikes,
        xivopeners_brd.openerAbilities.Stormbite,
        xivopeners_brd.openerAbilities.Bloodletter,
        xivopeners_brd.openerAbilities.WanderersMinuet,
        xivopeners_brd.openerAbilities.CausticBite,
        xivopeners_brd.openerAbilities.EmpyrealArrow,
        xivopeners_brd.openerAbilities.BattleVoice, -- after this point it's either 3 burst shots, or RA procs if we get them
        xivopeners_brd.openerAbilities.BurstShot,
        xivopeners_brd.openerAbilities.BurstShot,
        xivopeners_brd.openerAbilities.BurstShot,
        xivopeners_brd.openerAbilities.RefulgentArrow, -- this will be dequeued if we don't have straight shot ready
        xivopeners_brd.openerAbilities.Barrage, -- need a check here for an RA proc, and use that instead
        xivopeners_brd.openerAbilities.BurstShot,
--        xivopeners_brd.openerAbilities.Sidewinder, -- skipping this to use at AOE
--        xivopeners_brd.openerAbilities.BurstShot, -- this is going to get inserted if we don't get the RA proc
        xivopeners_brd.openerAbilities.Bloodletter,
        xivopeners_brd.openerAbilities.IronJaws,
        xivopeners_brd.openerAbilities.EmpyrealArrow
    },


    compatibility = {
        xivopeners_brd.openerAbilities.Tincture,
        xivopeners_brd.openerAbilities.RagingStrikes,
        xivopeners_brd.openerAbilities.Stormbite,
        xivopeners_brd.openerAbilities.Bloodletter,
        xivopeners_brd.openerAbilities.CausticBite,
        xivopeners_brd.openerAbilities.WanderersMinuet,
        xivopeners_brd.openerAbilities.BattleVoice,
        xivopeners_brd.openerAbilities.BurstShot,
        xivopeners_brd.openerAbilities.EmpyrealArrow,
        xivopeners_brd.openerAbilities.BurstShot,
        xivopeners_brd.openerAbilities.BurstShot,
        xivopeners_brd.openerAbilities.RefulgentArrow, -- this will be dequeued if we don't have straight shot ready
        xivopeners_brd.openerAbilities.Barrage,
        xivopeners_brd.openerAbilities.RefulgentArrow,
        xivopeners_brd.openerAbilities.Sidewinder,
--        xivopeners_brd.openerAbilities.BurstShot,
        xivopeners_brd.openerAbilities.Bloodletter,
        xivopeners_brd.openerAbilities.IronJaws,
        xivopeners_brd.openerAbilities.EmpyrealArrow
    },

    nonin = {
        xivopeners_brd.openerAbilities.Tincture,
        xivopeners_brd.openerAbilities.RagingStrikes,
        xivopeners_brd.openerAbilities.Stormbite,
        xivopeners_brd.openerAbilities.Bloodletter,
        xivopeners_brd.openerAbilities.WanderersMinuet,
        xivopeners_brd.openerAbilities.CausticBite,
        xivopeners_brd.openerAbilities.EmpyrealArrow,
        xivopeners_brd.openerAbilities.BattleVoice, -- after this point it's either 3 burst shots, or RA procs if we get them
        xivopeners_brd.openerAbilities.BurstShot,
        xivopeners_brd.openerAbilities.Sidewinder,
        xivopeners_brd.openerAbilities.BurstShot,
        xivopeners_brd.openerAbilities.RefulgentArrow, -- this will be dequeued if we don't have straight shot ready
        xivopeners_brd.openerAbilities.Barrage, -- need a check here for an RA proc, and use that instead
        xivopeners_brd.openerAbilities.RefulgentArrow,
        xivopeners_brd.openerAbilities.BurstShot,
        --        xivopeners_brd.openerAbilities.BurstShot, -- this is going to get inserted if we don't get the RA proc
        xivopeners_brd.openerAbilities.Bloodletter,
        xivopeners_brd.openerAbilities.IronJaws,
        xivopeners_brd.openerAbilities.EmpyrealArrow
    },
}

xivopeners_brd.abilityQueue = {}
xivopeners_brd.lastCastFromQueue = nil -- might need this for some more complex openers with conditions
xivopeners_brd.openerStarted = false
xivopeners_brd.timeLastAction = 0

function xivopeners_brd.getTincture()
    for i = 0, 3 do
        for _, id in pairs(xivopeners_brd.openerAbilities.Tincture.ids) do
            local tincture = Inventory:Get(i):Get(id)
            if (tincture) then return tincture end
        end
    end
    return nil
end

function xivopeners_brd.getOpener()
    if (xivopeners.settings[Player.job].currentOpenerIndex == 1) then
        return xivopeners_brd.openers.recommended
    elseif (xivopeners.settings[Player.job].currentOpenerIndex == 2) then
        return xivopeners_brd.openers.tea
    elseif (xivopeners.settings[Player.job].currentOpenerIndex == 3) then
        return xivopeners_brd.openers.nonin
    elseif (xivopeners.settings[Player.job].currentOpenerIndex == 4) then
        return xivopeners_brd.openers.compatibility
    end
end

function xivopeners_brd.checkOpenerIds()
    for key, action in pairs(xivopeners_brd.getOpener()) do
        if (action == nil) then
            xivopeners.log("WARNING: Action at index " .. tostring(key) .. " was nil! The id is likely incorrect.")
        end
    end
end

function xivopeners_brd.openerAvailable()
    -- check cooldowns
    for _, action in pairs(xivopeners_brd.getOpener()) do
        if (action == xivopeners_brd.openerAbilities.Tincture) then
            local tincture = xivopeners_brd.getTincture()
            if (tincture and xivopeners.settings[Player.job].useTincture and tincture:GetAction().cd >= 1.5 and not HasBuff(Player.id, xivopeners_brd.openerAbilities.MedicineBuffID)) then
                return false
            end
        elseif (action == xivopeners_brd.openerAbilities.RagingStrikes) then
            if (action.cd >= 1.5 and not HasBuff(Player.id, xivopeners_brd.openerAbilities.RagingStrikesBuffID)) then
                return false
            end
        elseif (action.cd >= 1.5) then
            return false
        end
    end
    return true
end

function xivopeners_brd.queueOpener()
    -- the only time this gets called is when the main script is toggled, so we can do more than just queue the opener
    -- empty queue first
    xivopeners_brd.abilityQueue = {}
    for _, action in pairs(xivopeners_brd.getOpener()) do
        xivopeners_brd.enqueue(action)
    end
    --    xivopeners.log("queue:")
    --    for _, v in pairs(xivopeners_brd.abilityQueue) do
    --        xivopeners.log(v.name)
    --    end
    xivopeners_brd.lastCastFromQueue = nil
    xivopeners_brd.openerStarted = false
    if (xivopeners.settings[Player.job].useTincture and not xivopeners_brd.getTincture()) then
        xivopeners.settings[Player.job].useTincture = false
    end
end

function xivopeners_brd.drawCall(event, tickcount)
    GUI:AlignFirstTextHeightToWidgets()
    GUI:BeginGroup()
    GUI:Text("Use Tincture")
    GUI:NextColumn()
    xivopeners.settings[Player.job].useTincture = GUI:Checkbox("##xivopeners_brd_tincturecheck", xivopeners.settings[Player.job].useTincture)
    GUI:EndGroup()
    GUI:NextColumn()

    if (xivopeners_brd.debug) then
        GUI:AlignFirstTextHeightToWidgets()
        GUI:Text("lastcastid")
        GUI:NextColumn()
        GUI:InputText("##xivopeners_brd_lastcastid_display", tostring(xivopeners_brd.lastcastid))
        GUI:NextColumn()

        GUI:AlignFirstTextHeightToWidgets()
        GUI:Text("lastcastid2")
        GUI:NextColumn()
        GUI:InputText("##xivopeners_brd_lastcastid2_display", tostring(xivopeners_brd.lastcastid2))
        GUI:NextColumn()

        GUI:AlignFirstTextHeightToWidgets()
        GUI:Text("lastcastid_o")
        GUI:NextColumn()
        GUI:InputText("##xivopeners_brd_lastcastid_original_display", tostring(Player.castinginfo.lastcastid))
        GUI:NextColumn()

        GUI:AlignFirstTextHeightToWidgets()
        GUI:Text("castingid")
        GUI:NextColumn()
        GUI:InputText("##xivopeners_brd_castingid", tostring(Player.castinginfo.castingid))
        GUI:NextColumn()

        if (xivopeners_brd.abilityQueue[1]) then
            GUI:AlignFirstTextHeightToWidgets()
            GUI:Text("queue[1]")
            GUI:NextColumn()
            GUI:InputText("##xivopeners_brd_queue[1]", xivopeners_brd.abilityQueue[1].name)
            GUI:NextColumn()
        end

        if (xivopeners_brd.lastCastFromQueue) then
            GUI:AlignFirstTextHeightToWidgets()
            GUI:Text("lastCastFromQueue")
            GUI:NextColumn()
            GUI:InputText("##xivopeners_brd_lastcastfromqueue", xivopeners_brd.lastCastFromQueue.name)
            GUI:NextColumn()
        end
    end
end

function xivopeners_brd.isStalled()
    local nextQueuedAction = TensorCore.getLastAction()
    local lastSuccessfulAction = TensorCore.getLastSuccessfulCast()
    local nextAction = xivopeners_brd.abilityQueue[1]

    -- have not used an action for longer than a gcd
    if TimeSince(xivopeners_brd.timeLastAction) > TensorCore.currentGCD + 1000 then
        xivopeners.log("Inactivity stall")
        return true
    end


    return false
end

function xivopeners_brd.main(event, tickcount)
    if (Player.level >= xivopeners_brd.supportedLevel) then
        local target = Player:GetTarget()

        if (not target or not target.attackable) then return end

        if (not xivopeners_brd.openerAvailable() and not xivopeners_brd.openerStarted) then return end -- don't start opener if it's not available, if it's already started then yolo

        if (xivopeners_brd.openerStarted and next(xivopeners_brd.abilityQueue) == nil) then
            -- opener is finished, pass control to ACR
            xivopeners.log("Finished openers, handing control to ACR")
            xivopeners_brd.openerStarted = false
            if (xivopeners.running) then xivopeners.ToggleRun() end
            if (not FFXIV_Common_BotRunning) then
                ml_global_information.ToggleRun()
            end
            return
        end

        if (not xivopeners_brd.openerStarted) then
            -- technically, even if you use an ability from prepull, it should still work, since the next time this loop runs it'll jump to the elseif
            xivopeners.log("Starting opener")
            xivopeners_brd.openerStarted = true
            xivopeners_brd.useNextAction(target)
            xivopeners_brd.timeLastAction = Now()
        elseif xivopeners_brd.isStalled() then
            xivopeners.log("Stall detected, handing control to ACR")
            xivopeners_brd.openerStarted = false
            if (xivopeners.running) then xivopeners.ToggleRun() end
            if (not FFXIV_Common_BotRunning) then
                ml_global_information.ToggleRun()
            end
            return
        elseif xivopeners_brd.abilityQueue[1] == xivopeners_brd.openerAbilities.RefulgentArrow
        and xivopeners_brd.abilityQueue[2] == xivopeners_brd.openerAbilities.Barrage
        and xivopeners_brd.abilityQueue[1].cdmax - xivopeners_brd.abilityQueue[1].cd <= 1.1
        and not HasBuff(Player.id, xivopeners_brd.openerAbilities.StraightShotReadyBuffID)
        then
            xivopeners.log("Didn't get RA proc before Barrage, dequeuing")
            -- need to insert burst shot back in between Sidewinder and BL
            -- i could just do table.insert(queue, 5, burstshot) and it would be faster than looping through, but looping would be more reliable and flexible to opener changes in the future
            for k, v in ipairs(xivopeners_brd.abilityQueue) do
                if (v == xivopeners_brd.openerAbilities.Bloodletter) then
                    xivopeners.log("Added BurstShot back")
                    table.insert(xivopeners_brd.abilityQueue, k - 1, xivopeners_brd.openerAbilities.BurstShot)
                    break
                end
            end

--            table.insert(xivopeners_brd.abilityQueue, 5, xivopeners_brd.openerAbilities.BurstShot)
            xivopeners_brd.dequeue()
            xivopeners_brd.useNextAction(target)
        elseif (xivopeners_brd.lastCastFromQueue and xivopeners_brd.lastCastFromQueue.used == true) then
            if (xivopeners_brd.lastCastFromQueue ~= xivopeners_brd.openerAbilities.PitchPerfect) then
                xivopeners_brd.lastCastFromQueue.used = nil
                xivopeners_brd.lastCastFromQueue = nil
                xivopeners_brd.timeLastAction = Now()
                xivopeners_brd.dequeue()
            end
            xivopeners_brd.useNextAction(target)
        else
            xivopeners_brd.useNextAction(target)
        end

    end
end

function xivopeners_brd.enqueueNext(action)
    action.used = nil
    table.insert(xivopeners_brd.abilityQueue, 1, action)
end

function xivopeners_brd.enqueue(action)
    -- implementation of the queue can be changed later
    action.used = nil
    table.insert(xivopeners_brd.abilityQueue, action)
end

function xivopeners_brd.dequeue()
    xivopeners.log("Dequeing " .. xivopeners_brd.abilityQueue[1].name)
    xivopeners_brd.abilityQueue[1].used = nil
    table.remove(xivopeners_brd.abilityQueue, 1)
end

function xivopeners_brd.cast(action, target)
    if (action.oCast ~= nil) then
        action:Cast(target, true)
    else
        action:Cast(target)
    end
    TensorCore.awaitCastCompletion(action)
end

function xivopeners_brd.useNextAction(target)
    -- do the actual opener
    -- the current implementation uses a queue system
    if (target and target.attackable and xivopeners_brd.abilityQueue[1] and (xivopeners_brd.abilityQueue[1].range <= 0 or target.distance2d <= xivopeners_brd.abilityQueue[1].range)) then
        if (xivopeners_brd.abilityQueue[1] == xivopeners_brd.openerAbilities.RagingStrikes and HasBuff(Player.id, xivopeners_brd.openerAbilities.RagingStrikesBuffID)) then
            xivopeners.log("Player already used raging strikes prepull, continue with opener")
--            xivopeners_brd.lastCastFromQueue = xivopeners_brd.openerAbilities.RagingStrikes
            xivopeners_brd.dequeue()
            return
        end
        if (Player.gauge[2] >= 3 and TensorCore.canWeaveOGCD()) then
            -- don't want to dequeue here
            -- xivopeners.log("Using PP3 proc")
            xivopeners_brd.cast(xivopeners_brd.openerAbilities.PitchPerfect, target.id)
--            xivopeners_brd.lastCastFromQueue = xivopeners_brd.openerAbilities.PitchPerfect
            return
        end
        if (xivopeners_brd.abilityQueue[1] == xivopeners_brd.openerAbilities.BurstShot and HasBuff(Player.id, xivopeners_brd.openerAbilities.StraightShotReadyBuffID)) then
            -- xivopeners.log("Using RA proc during BurstShot window")
            xivopeners_brd.cast(xivopeners_brd.openerAbilities.RefulgentArrow, target.id)
            xivopeners_brd.lastCastFromQueue = xivopeners_brd.openerAbilities.RefulgentArrow
            return
        end

        -- tincture check
        if (xivopeners_brd.abilityQueue[1] == xivopeners_brd.openerAbilities.Tincture) then
            local tincture = xivopeners_brd.getTincture()
            if (HasBuff(Player.id, xivopeners_brd.openerAbilities.MedicineBuffID) or not xivopeners.settings[Player.job].useTincture or not tincture) then
                xivopeners.log("Tincture already used during opener, not enabled, or not available, dequeueing")
                xivopeners_brd.dequeue()
                return
            end

            if (tincture) then
                xivopeners.log("Casting tincture")
                xivopeners_brd.cast(tincture, Player.id)
                xivopeners_brd.lastCastFromQueue = tincture
            end
            -- don't want to continue past this point or we risk breaking shit
            return
        end

        -- idk how to make it not spam console
--        xivopeners.log("Casting " .. xivopeners_brd.abilityQueue[1].name)
        xivopeners_brd.cast(xivopeners_brd.abilityQueue[1], target.id)
        xivopeners_brd.lastCastFromQueue = xivopeners_brd.abilityQueue[1]
    end
end