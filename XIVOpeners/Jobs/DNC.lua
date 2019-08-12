xivopeners_dnc = {}

xivopeners_dnc.debug = false

xivopeners_dnc.supportedLevel = 60
xivopeners_dnc.openerAbilities = {
    StandardStep = ActionList:Get(1, 15997),
    StandardFinish = ActionList:Get(1, 16192),
    StandardDance = {name = "Standard Dance", id = 0, cd = 0, cdmax = 0};
    Emboite = ActionList:Get(1, 15999),
    Entrechat = ActionList:Get(1, 16000),
    Jete = ActionList:Get(1, 16001),
    Pirouette = ActionList:Get(1, 16002),
    TechnicalStep = ActionList:Get(1, 15998),
    TechnicalFinish = ActionList:Get(1, 16196),
    TechnicalDance = {name = "Technical Dance", id = 0, cd = 0, cdmax = 0};
    Flourish = ActionList:Get(1, 16013),
    RisingWindmill = ActionList:Get(1, 15995),
    Devilment = ActionList:Get(1, 16011),
    StandardStepBuffID = 1818,
    StandardFinishBuffID = 1821,
    Tincture = {name = "Tincture", ids = {27996, 27787}},
    MedicineBuffID = 49,
}

xivopeners_dnc.openerInfo = {
    listOpeners = {"Preferred", "Early Devilment"},
    currentOpenerIndex = 1,
}

xivopeners_dnc.openers = {
    preferred = {
        xivopeners_dnc.openerAbilities.StandardStep,
        xivopeners_dnc.openerAbilities.StandardDance,
        xivopeners_dnc.openerAbilities.StandardDance,
        xivopeners_dnc.openerAbilities.StandardFinish,
        xivopeners_dnc.openerAbilities.TechnicalStep,
        xivopeners_dnc.openerAbilities.TechnicalDance,
        xivopeners_dnc.openerAbilities.TechnicalDance,
        xivopeners_dnc.openerAbilities.TechnicalDance,
        xivopeners_dnc.openerAbilities.TechnicalDance,
        xivopeners_dnc.openerAbilities.TechnicalFinish,
        xivopeners_dnc.openerAbilities.Flourish,
        xivopeners_dnc.openerAbilities.RisingWindmill,
        xivopeners_dnc.openerAbilities.Devilment,
    },

    earlyDevilment = {
        xivopeners_dnc.openerAbilities.StandardStep,
        xivopeners_dnc.openerAbilities.StandardDance,
        xivopeners_dnc.openerAbilities.StandardDance,
        xivopeners_dnc.openerAbilities.StandardFinish,
        xivopeners_dnc.openerAbilities.Devilment,
        xivopeners_dnc.openerAbilities.TechnicalStep,
        xivopeners_dnc.openerAbilities.TechnicalDance,
        xivopeners_dnc.openerAbilities.TechnicalDance,
        xivopeners_dnc.openerAbilities.TechnicalDance,
        xivopeners_dnc.openerAbilities.TechnicalDance,
        xivopeners_dnc.openerAbilities.TechnicalFinish,
        xivopeners_dnc.openerAbilities.Flourish,
        xivopeners_dnc.openerAbilities.RisingWindmill,
    }
}

xivopeners_dnc.danceStepCombo = {
    -- gauge 3 is first one, gauge 4 is second one, gauge 7 tells the current index
    xivopeners_dnc.openerAbilities.Emboite,
    xivopeners_dnc.openerAbilities.Entrechat,
    xivopeners_dnc.openerAbilities.Jete,
    xivopeners_dnc.openerAbilities.Pirouette,
}


xivopeners_dnc.abilityQueue = {}
xivopeners_dnc.lastCastFromQueue = nil -- might need this for some more complex openers with conditions
xivopeners_dnc.openerStarted = false
xivopeners_dnc.useTincture = false
xivopeners_dnc.lastcastid = 0
xivopeners_dnc.lastcastid2 = 0

function xivopeners_dnc.getTincture()
    for i = 0, 3 do
        for _, id in pairs(xivopeners_dnc.openerAbilities.Tincture.ids) do
            local tincture = Inventory:Get(i):Get(id)
            if (tincture) then return tincture end
        end
    end
    return nil
end

function xivopeners_dnc.getOpener()
    if (xivopeners_dnc.openerInfo.currentOpenerIndex == 1) then
        return xivopeners_dnc.openers.preferred
    else
        return xivopeners_dnc.openers.earlyDevilment
    end
end

function xivopeners_dnc.checkOpenerIds()
    for key, action in pairs(xivopeners_dnc.getOpener()) do
        if (action == nil) then
            xivopeners.log("WARNING: Action at index " .. tostring(key) .. " was nil! The id is likely incorrect.")
        end
    end
end

function xivopeners_dnc.openerAvailable()
    -- check cooldowns
    for _, action in pairs(xivopeners_dnc.getOpener()) do
        if (action == xivopeners_dnc.openerAbilities.Tincture) then
            local tincture = xivopeners_dnc.getTincture()
            if (tincture and xivopeners_dnc.useTincture and tincture:GetAction().cd >= 1.5 and not HasBuff(Player.id, xivopeners_dnc.openerAbilities.MedicineBuffID)) then
                return false
            end
        elseif (action == xivopeners_dnc.openerAbilities.StandardStep) then
            if (action.cd >= 1.5 and not HasBuff(Player.id, xivopeners_dnc.openerAbilities.StandardStepBuffID)) then
                return false
            end
        elseif (action.cd >= 1.5) then
            return false
        end
    end
    return true
end

function xivopeners_dnc.queueOpener()
    -- the only time this gets called is when the main script is toggled, so we can do more than just queue the opener
    -- empty queue first
    xivopeners_dnc.abilityQueue = {}
    for _, action in pairs(xivopeners_dnc.getOpener()) do
        xivopeners_dnc.enqueue(action)
    end
    --    xivopeners.log("queue:")
    --    for _, v in pairs(xivopeners_dnc.abilityQueue) do
    --        xivopeners.log(v.name)
    --    end
    xivopeners_dnc.lastCastFromQueue = nil
    xivopeners_dnc.openerStarted = false
    if (xivopeners_dnc.useTincture and not xivopeners_dnc.getTincture()) then
        xivopeners_dnc.useTincture = false
    end
end

function xivopeners_dnc.updateLastCast()
    --    xivopeners.log(tostring(xivopeners_dnc.lastcastid) .. ", " .. tostring(xivopeners_dnc.lastcastid2) .. ", " .. tostring(Player.castinginfo.lastcastid))
    if (xivopeners_dnc.lastCastFromQueue) then
        if (xivopeners_dnc.lastcastid == -1) then
            -- compare the real castid and see if it changed, if it did, update from -1
            if (xivopeners_dnc.lastcastid2 ~= Player.castinginfo.castingid) then
                xivopeners.log("cast changed")
                xivopeners_dnc.lastcastid = Player.castinginfo.castingid
                xivopeners_dnc.lastcastid2 = Player.castinginfo.castingid
            end
        elseif (xivopeners_dnc.lastcastid ~= Player.castinginfo.castingid) then
            xivopeners_dnc.lastcastid = Player.castinginfo.castingid
            xivopeners_dnc.lastcastid2 = Player.castinginfo.castingid
        end
    end
end

function xivopeners_dnc.drawCall(event, tickcount)
    GUI:AlignFirstTextHeightToWidgets()
    GUI:BeginGroup()
    GUI:Text("Use Tincture")
    GUI:NextColumn()
    xivopeners_dnc.useTincture = GUI:Checkbox("##xivopeners_dnc_tincturecheck", xivopeners_dnc.useTincture)
    GUI:EndGroup()
    GUI:NextColumn()

    if (xivopeners_dnc.debug) then
        GUI:AlignFirstTextHeightToWidgets()
        GUI:Text("lastcastid")
        GUI:NextColumn()
        GUI:InputText("##xivopeners_dnc_lastcastid_display", tostring(xivopeners_dnc.lastcastid))
        GUI:NextColumn()

        GUI:AlignFirstTextHeightToWidgets()
        GUI:Text("lastcastid2")
        GUI:NextColumn()
        GUI:InputText("##xivopeners_dnc_lastcastid2_display", tostring(xivopeners_dnc.lastcastid2))
        GUI:NextColumn()

        GUI:AlignFirstTextHeightToWidgets()
        GUI:Text("lastcastid_o")
        GUI:NextColumn()
        GUI:InputText("##xivopeners_dnc_lastcastid_original_display", tostring(Player.castinginfo.lastcastid))
        GUI:NextColumn()

        GUI:AlignFirstTextHeightToWidgets()
        GUI:Text("castingid")
        GUI:NextColumn()
        GUI:InputText("##xivopeners_dnc_castingid", tostring(Player.castinginfo.castingid))
        GUI:NextColumn()

        if (xivopeners_dnc.abilityQueue[1]) then
            GUI:AlignFirstTextHeightToWidgets()
            GUI:Text("queue[1]")
            GUI:NextColumn()
            GUI:InputText("##xivopeners_dnc_queue[1]", xivopeners_dnc.abilityQueue[1].name)
            GUI:NextColumn()
        end

        if (xivopeners_dnc.lastCastFromQueue) then
            GUI:AlignFirstTextHeightToWidgets()
            GUI:Text("lastCastFromQueue")
            GUI:NextColumn()
            GUI:InputText("##xivopeners_dnc_lastcastfromqueue", xivopeners_dnc.lastCastFromQueue.name)
            GUI:NextColumn()
        end
    end
end

function xivopeners_dnc.main(event, tickcount)
    if (Player.level >= xivopeners_dnc.supportedLevel) then
        local target = Player:GetTarget()

        if (not target or not target.attackable) then return end

        if (not xivopeners_dnc.openerAvailable() and not xivopeners_dnc.openerStarted) then return end -- don't start opener if it's not available, if it's already started then yolo

        if (xivopeners_dnc.openerStarted and next(xivopeners_dnc.abilityQueue) == nil) then
            -- opener is finished, pass control to ACR
            xivopeners.log("Finished openers, handing control to ACR")
            xivopeners_dnc.openerStarted = false
            if (xivopeners.running) then xivopeners.ToggleRun() end
            if (not FFXIV_Common_BotRunning) then
                ml_global_information.ToggleRun()
            end
            return
        end

        xivopeners_dnc.updateLastCast()

        if (not xivopeners_dnc.openerStarted) then
            -- technically, even if you use an ability from prepull, it should still work, since the next time this loop runs it'll jump to the elseif
            xivopeners.log("Starting opener")
            xivopeners_dnc.openerStarted = true
            xivopeners_dnc.useNextAction(target)
            -- rewrite this to be for dnc procs
            --        elseif (xivopeners_dnc.abilityQueue[1] == xivopeners_dnc.openerAbilities.RefulgentArrow and xivopeners_dnc.abilityQueue[2] == xivopeners_dnc.openerAbilities.Barrage and (xivopeners_dnc.abilityQueue[1].cdmax - xivopeners_dnc.abilityQueue[1].cd < 1.5) and not HasBuff(Player.id, xivopeners_dnc.openerAbilities.StraightShotReadyBuffID)) then
            --            xivopeners.log("Didn't get RA proc before Barrage, dequeuing")
            --            -- need to insert burst shot back in between Sidewinder and BL
            --            -- i could just do table.insert(queue, 5, burstshot) and it would be faster than looping through, but looping would be more reliable and flexible to opener changes in the future
            --            for k, v in ipairs(xivopeners_dnc.abilityQueue) do
            --                if (v == xivopeners_dnc.openerAbilities.Sidewinder) then
            --                    xivopeners.log("Added BurstShot back")
            --                    table.insert(xivopeners_dnc.abilityQueue, k + 1, xivopeners_dnc.openerAbilities.BurstShot)
            --                    break
            --                end
            --            end
            --            xivopeners_dnc.dequeue()
            --            xivopeners_dnc.useNextAction(target)
        elseif (xivopeners_dnc.lastCastFromQueue and xivopeners_dnc.lastcastid == xivopeners_dnc.lastCastFromQueue.id) then
            xivopeners_dnc.lastcastid = -1
            xivopeners_dnc.dequeue()
            xivopeners_dnc.useNextAction(target)
        else
            xivopeners_dnc.useNextAction(target)
        end

    end
end

function xivopeners_dnc.enqueueNext(action)
    table.insert(xivopeners_dnc.abilityQueue, 1, action)
end

function xivopeners_dnc.enqueue(action)
    -- implementation of the queue can be changed later
    table.insert(xivopeners_dnc.abilityQueue, action)
end

function xivopeners_dnc.dequeue()
    xivopeners.log("Dequeing " .. xivopeners_dnc.abilityQueue[1].name)
    table.remove(xivopeners_dnc.abilityQueue, 1)
end

function xivopeners_dnc.getNextStdStep()
    -- gauge 3 is first one, gauge 4 is second one, gauge 7 tells the current index
    local stepIndexes = {
        Player.gauge[3],
        Player.gauge[4],
    }
    return xivopeners_dnc.danceStepCombo[stepIndexes[Player.gauge[7] + 1]]
end

function xivopeners_dnc.getNextTechStep()
    -- gauge 3 is first one, gauge 4 is second one, gauge 7 tells the current index
    local stepIndexes = {
        Player.gauge[3],
        Player.gauge[4],
        Player.gauge[5],
        Player.gauge[6],
    }
    return xivopeners_dnc.danceStepCombo[stepIndexes[Player.gauge[7] + 1]]
end


function xivopeners_dnc.useNextAction(target)
    -- do the actual opener
    -- the current implementation uses a queue system
    if (target and target.attackable and xivopeners_dnc.abilityQueue[1]) then
        -- tincture check
        if (xivopeners_dnc.abilityQueue[1] == xivopeners_dnc.openerAbilities.Tincture) then
            local tincture = xivopeners_dnc.getTincture()
            if (HasBuff(Player.id, xivopeners_dnc.openerAbilities.MedicineBuffID) or not xivopeners_dnc.useTincture or not tincture) then
                xivopeners.log("Tincture already used during opener, not enabled, or not available, dequeueing")
                xivopeners_dnc.dequeue()
                return
            end

            if (tincture) then
                xivopeners.log("Casting tincture")
                tincture:Cast()
                xivopeners_dnc.lastCastFromQueue = tincture:GetAction()
            end
            -- don't want to continue past this point or we risk breaking shit
            return
        end

        -- check if we're already in std step
        if (xivopeners_dnc.abilityQueue[1] == xivopeners_dnc.openerAbilities.StandardStep and HasBuff(Player.id, xivopeners_dnc.openerAbilities.StandardStepBuffID)) then
            xivopeners.log("Player already used standard step prepull, continue with opener")
            xivopeners_dnc.dequeue()
            return
        end

        -- handle std steps
        if (xivopeners_dnc.abilityQueue[1] == xivopeners_dnc.openerAbilities.StandardDance) then
            -- dequeue all steps if we've already done
            if (Player.gauge[7] == 2) then
                xivopeners_dnc.dequeue()
                return
            end

            local nextDanceStep = xivopeners_dnc.getNextStdStep()
            if (nextDanceStep) then
                nextDanceStep:Cast(target.id)
                xivopeners_dnc.lastCastFromQueue = nextDanceStep
            end
            return
        end

        -- handle tech steps
        if (xivopeners_dnc.abilityQueue[1] == xivopeners_dnc.openerAbilities.TechnicalDance) then
            -- dequeue all steps if we've already done
            if (Player.gauge[7] == 4) then
                xivopeners_dnc.dequeue()
                return
            end

            local nextDanceStep = xivopeners_dnc.getNextTechStep()
            if (nextDanceStep) then
                nextDanceStep:Cast(target.id)
                xivopeners_dnc.lastCastFromQueue = nextDanceStep
            end
            return
        end

        -- idk how to make it not spam console
        --        xivopeners.log("Casting " .. xivopeners_dnc.abilityQueue[1].name)
        xivopeners_dnc.abilityQueue[1]:Cast(target.id)
        xivopeners_dnc.lastCastFromQueue = xivopeners_dnc.abilityQueue[1]
    end
end