xivopeners_smn = {}

xivopeners_smn.supportedLevel = 80
xivopeners_smn.openerAbilities = {
    -- all pet actions are ifrit only!!! WILL HANG IF NOT IFRIT, already know morons will complain
    Ruin3 = ActionList:Get(1, 3579),
    Tridisaster = ActionList:Get(1, 3580),
    Ruin2 = ActionList:Get(1, 172),
    EgiAssault = ActionList:Get(1, 16799),
    DreadwyrmTrance = ActionList:Get(1, 3581),
    EnergyDrain = ActionList:Get(1, 16508),
    EgiAssault2 = ActionList:Get(1, 16800),
    Aetherpact = ActionList:Get(1, 7423),
    Enkindle = ActionList:Get(1, 16803),
    Fester = ActionList:Get(1, 181),
    Deathflare = ActionList:Get(1, 3582),
    SummonBahamut = ActionList:Get(1, 7427),
    Ruin4 = ActionList:Get(1, 7426),
    EnkindleBahamut = ActionList:Get(1, 7429),
    SummonIfrit = ActionList:Get(1, 180),
    Ruin4BuffID = 1212,
    IfritPetID = 1402,
    Tincture = {name = "Tincture", ids = {27998, 27789}}, -- int
    MedicineBuffID = 49,
}

xivopeners_smn.openerInfo = {
    listOpeners = {"Tokyo Drift", "Easy Bahamut"},
    currentOpenerIndex = 1,
}

xivopeners_smn.openers = {
    tokyoDrift = {
        xivopeners_smn.openerAbilities.SummonIfrit,
        xivopeners_smn.openerAbilities.Ruin3,
        xivopeners_smn.openerAbilities.Tridisaster,
        xivopeners_smn.openerAbilities.Ruin2,
        xivopeners_smn.openerAbilities.EnergyDrain,
        xivopeners_smn.openerAbilities.DreadwyrmTrance,
        xivopeners_smn.openerAbilities.Ruin3,
        xivopeners_smn.openerAbilities.Tincture,
        xivopeners_smn.openerAbilities.Ruin3,
        xivopeners_smn.openerAbilities.EgiAssault,
        xivopeners_smn.openerAbilities.Aetherpact,
        xivopeners_smn.openerAbilities.Ruin3,
        xivopeners_smn.openerAbilities.EgiAssault2,
        xivopeners_smn.openerAbilities.EgiAssault,
        xivopeners_smn.openerAbilities.Ruin3,
        xivopeners_smn.openerAbilities.Enkindle,
        xivopeners_smn.openerAbilities.Fester,
        xivopeners_smn.openerAbilities.Ruin3,
        xivopeners_smn.openerAbilities.EgiAssault2,
        xivopeners_smn.openerAbilities.Tridisaster,
        xivopeners_smn.openerAbilities.Ruin3,
        xivopeners_smn.openerAbilities.Deathflare,
        xivopeners_smn.openerAbilities.SummonBahamut,
        xivopeners_smn.openerAbilities.Ruin4,
        xivopeners_smn.openerAbilities.EnkindleBahamut,
        xivopeners_smn.openerAbilities.Fester,
        xivopeners_smn.openerAbilities.Ruin3,
        xivopeners_smn.openerAbilities.Ruin3,
        xivopeners_smn.openerAbilities.Ruin3,
        xivopeners_smn.openerAbilities.Ruin3,
        xivopeners_smn.openerAbilities.Ruin4,
        xivopeners_smn.openerAbilities.EnkindleBahamut,
        xivopeners_smn.openerAbilities.EnergyDrain,
        xivopeners_smn.openerAbilities.Ruin4,
        xivopeners_smn.openerAbilities.Fester,
        xivopeners_smn.openerAbilities.Ruin4,
    },

    easyBahamut = {
        xivopeners_smn.openerAbilities.SummonIfrit,
        xivopeners_smn.openerAbilities.Ruin3,
        xivopeners_smn.openerAbilities.Tridisaster,
        xivopeners_smn.openerAbilities.Ruin2,
        xivopeners_smn.openerAbilities.EgiAssault,
        xivopeners_smn.openerAbilities.DreadwyrmTrance,
        xivopeners_smn.openerAbilities.Ruin3,
        xivopeners_smn.openerAbilities.EnergyDrain,
        xivopeners_smn.openerAbilities.EgiAssault2,
        xivopeners_smn.openerAbilities.Ruin3,
        xivopeners_smn.openerAbilities.EgiAssault,
        xivopeners_smn.openerAbilities.Aetherpact,
        xivopeners_smn.openerAbilities.Ruin3,
        xivopeners_smn.openerAbilities.Tincture,
        xivopeners_smn.openerAbilities.Ruin3,
        xivopeners_smn.openerAbilities.EgiAssault2,
        xivopeners_smn.openerAbilities.Enkindle,
        xivopeners_smn.openerAbilities.Ruin3,
        xivopeners_smn.openerAbilities.Fester,
        xivopeners_smn.openerAbilities.Tridisaster,
        xivopeners_smn.openerAbilities.Ruin3,
        xivopeners_smn.openerAbilities.Deathflare,
        xivopeners_smn.openerAbilities.SummonBahamut,
        xivopeners_smn.openerAbilities.Ruin3,
        xivopeners_smn.openerAbilities.Ruin4,
        xivopeners_smn.openerAbilities.EnkindleBahamut,
        xivopeners_smn.openerAbilities.Fester,
        xivopeners_smn.openerAbilities.Ruin3,
        xivopeners_smn.openerAbilities.Ruin3,
        xivopeners_smn.openerAbilities.Ruin3,
        xivopeners_smn.openerAbilities.Ruin4,
        xivopeners_smn.openerAbilities.EnkindleBahamut,
        xivopeners_smn.openerAbilities.Ruin4,
        xivopeners_smn.openerAbilities.EnergyDrain,
        xivopeners_smn.openerAbilities.Fester,
        xivopeners_smn.openerAbilities.Ruin4,
    },
}

xivopeners_smn.abilityQueue = {}
xivopeners_smn.lastCastFromQueue = nil -- might need this for some more complex openers with conditions
xivopeners_smn.openerStarted = false
xivopeners_smn.useTincture = false
xivopeners_smn.demiWaitTime = 300
xivopeners_smn.lastcastid = 0
xivopeners_smn.lastcastid2 = 0

function xivopeners_smn.getTincture()
    for i = 0, 3 do
        for _, id in pairs(xivopeners_smn.openerAbilities.Tincture.ids) do
            local tincture = Inventory:Get(i):Get(id)
            if (tincture) then return tincture end
        end
    end
    return nil
end


function xivopeners_smn.getOpener()
    if (xivopeners_smn.openerInfo.currentOpenerIndex == 1) then
        return xivopeners_smn.openers.tokyoDrift
    elseif (xivopeners_smn.openerInfo.currentOpenerIndex == 2) then
        return xivopeners_smn.openers.easyBahamut
    else
        return {}
    end
end

function xivopeners_smn.checkOpenerIds()
    for key, action in pairs(xivopeners_smn.openerAbilities) do
        if (action == nil) then
            xivopeners.log("WARNING: Action at index " .. tostring(key) .. " was nil! The id is likely incorrect.")
        end
    end
    for key, action in pairs(xivopeners_smn.getOpener()) do
        if (action == nil) then
            xivopeners.log("WARNING: Action at index " .. tostring(key) .. " in opener " .. tostring(xivopeners_smn.openerInfo.currentOpenerIndex) .. " is nil. Possible typo?")
        end

    end
end

function xivopeners_smn.openerAvailable()
    -- check cooldowns
    for _, action in pairs(xivopeners_smn.getOpener()) do
        if (action == xivopeners_smn.openerAbilities.Tincture) then
            local tincture = xivopeners_smn.getTincture()
            if (tincture and xivopeners_smn.useTincture and  tincture:GetAction().cd >= 1.5) then
                return false
            end
        elseif (action.cd >= 1.5) then
            return false
        end
    end
    return true
end


function xivopeners_smn.queueOpener()
    -- the only time this gets called is when the main script is toggled, so we can do more than just queue the opener
    -- empty queue first
    xivopeners_smn.abilityQueue = {}
    for _, action in pairs(xivopeners_smn.getOpener()) do
        xivopeners_smn.enqueue(action)
    end
    --    xivopeners.log("queue:")
    --    for _, v in pairs(xivopeners_smn.abilityQueue) do
    --        xivopeners.log(v.name)
    --    end
    xivopeners_smn.lastCastFromQueue = nil
    xivopeners_smn.openerStarted = false
    if (xivopeners_smn.useTincture and not xivopeners_smn.getTincture()) then
        xivopeners_smn.useTincture = false
    end
end

function xivopeners_smn.updateLastCast()
    if (xivopeners_smn.lastCastFromQueue) then
--        xivopeners.log(tostring(xivopeners_smn.lastcastid) .. ", " .. tostring(xivopeners_smn.lastcastid2) .. ", " .. tostring(Player.castinginfo.lastcastid))
        if (xivopeners_smn.lastcastid == -1) then
            -- compare the real castid and see if it changed, if it did, update from -1
            if (xivopeners_smn.lastcastid2 ~= Player.castinginfo.castingid and xivopeners_smn.lastCastFromQueue.cd > 0) then
                xivopeners.log("cast changed")
                xivopeners_smn.lastcastid = Player.castinginfo.castingid
                xivopeners_smn.lastcastid2 = Player.castinginfo.castingid
            end
        elseif (xivopeners_smn.lastcastid ~= Player.castinginfo.castingid and xivopeners_smn.lastCastFromQueue.cd > 0) then
            xivopeners_smn.lastcastid = Player.castinginfo.castingid
            xivopeners_smn.lastcastid2 = Player.castinginfo.castingid
        end
    end
end

function xivopeners_smn.drawCall(event, tickcount)
    GUI:AlignFirstTextHeightToWidgets()
    GUI:BeginGroup()
    GUI:Text("Use Tincture")
    GUI:NextColumn()
    xivopeners_smn.useTincture = GUI:Checkbox("##xivopeners_smn_tincturecheck", xivopeners_smn.useTincture)
    GUI:EndGroup()
    GUI:NextColumn()

    GUI:AlignFirstTextHeightToWidgets()
    GUI:BeginGroup()
    GUI:Text("GCD Clip after Demi (ms)")
    GUI:NextColumn()
    xivopeners_smn.demiWaitTime = GUI:InputInt("##xivopeners_smn_demiwaittime", xivopeners_smn.demiWaitTime, 5, 50)
    GUI:NextColumn()
    GUI:EndGroup()
    if (GUI:IsItemHovered()) then
        GUI:SetTooltip("This is for the GCD clip after summoning bahamut that you have to do for Tokyo Drift.\nIf this is set too low, the first r4 after summoning won't get a WW.\nIf it's too high, you risk not getting 8 WW. 28ms ping and 600ms delay should be able to get 8 WW")
    end
end

function xivopeners_smn.main(event, tickcount)
    if (Player.level >= xivopeners_smn.supportedLevel) then
        local target = Player:GetTarget()

        if (not target) then return end

        if (not xivopeners_smn.openerAvailable() and not xivopeners_smn.openerStarted) then return end -- don't start opener if it's not available, if it's already started then yolo

        if (xivopeners_smn.openerStarted and next(xivopeners_smn.abilityQueue) == nil) then
            -- opener is finished, pass control to ACR
            xivopeners.log("Finished openers, handing control to ACR")
            xivopeners_smn.openerStarted = false
            if (xivopeners.running) then xivopeners.ToggleRun() end
            if (not FFXIV_Common_BotRunning) then
                ml_global_information.ToggleRun()
            end
            return
        end

        xivopeners_smn.updateLastCast()

        if (ActionList:IsCasting()) then return end

        if (not xivopeners_smn.openerStarted) then
            -- technically, even if you use an ability from prepull, it should still work, since the next time this loop runs it'll jump to the elseif
            xivopeners.log("Starting opener")
            xivopeners_smn.openerStarted = true
            xivopeners_smn.useNextAction(target)
        elseif (xivopeners_smn.lastCastFromQueue and xivopeners_smn.lastcastid == xivopeners_smn.lastCastFromQueue.id) then
            xivopeners_smn.lastcastid = -1
            xivopeners_smn.dequeue()
            xivopeners_smn.useNextAction(target)
        else
            xivopeners_smn.useNextAction(target)
        end

    end
end

function xivopeners_smn.enqueue(action)
    -- implementation of the queue can be changed later
    table.insert(xivopeners_smn.abilityQueue, action)
end

function xivopeners_smn.dequeue()
    xivopeners.log("Dequeing " .. xivopeners_smn.abilityQueue[1].name)
    table.remove(xivopeners_smn.abilityQueue, 1)
end

function xivopeners_smn.useNextAction(target)
    -- do the actual opener
    -- the current implementation uses a queue system
    if (target and target.attackable and xivopeners_smn.abilityQueue[1]) then
        -- tincture check
        if (xivopeners_smn.abilityQueue[1] == xivopeners_smn.openerAbilities.Tincture) then
            local tincture = xivopeners_smn.getTincture()
            if (HasBuff(Player.id, xivopeners_smn.openerAbilities.MedicineBuffID) or not xivopeners_smn.useTincture or not tincture) then
                xivopeners.log("Tincture already used during opener, not enabled, or not available, dequeueing")
                xivopeners_smn.dequeue()
                return
            end

            if (tincture) then
                xivopeners.log("Casting tincture")
                tincture:Cast()
                xivopeners_smn.lastCastFromQueue = tincture:GetAction()
            end
            -- don't want to continue past this point or we risk breaking shit
            return
        end

        -- summon ifrit if we haven't already
        if (xivopeners_smn.abilityQueue[1] == xivopeners_smn.openerAbilities.SummonIfrit) then
            if (not Player.pet or Player.pet.contentid ~= xivopeners_smn.openerAbilities.IfritPetID) then
                xivopeners_smn.abilityQueue[1]:Cast(target.id)
                xivopeners_smn.lastCastFromQueue = xivopeners_smn.abilityQueue[1]
            else
                xivopeners.log("Ifrit was already summoned, dequeueing")
                xivopeners_smn.dequeue()
            end
            return
        end

        -- if we need to use r2 but we have an r4 proc, we need to dequeue r2
        if (xivopeners_smn.abilityQueue[1] == xivopeners_smn.openerAbilities.Ruin2 and HasBuff(Player.id, xivopeners_smn.openerAbilities.Ruin4BuffID)) then
            xivopeners.log("Has r4 proc during r2, adjusting lastcast")
            xivopeners_smn.abilityQueue[1]:Cast(target.id)
            xivopeners_smn.lastCastFromQueue = xivopeners_smn.openerAbilities.Ruin4
            return
        end

        -- need to clip gcd for a split second here to make sure r4 procs WW
        if (xivopeners_smn.abilityQueue[1] == xivopeners_smn.openerAbilities.Ruin4 and xivopeners_smn.lastCastFromQueue == xivopeners_smn.openerAbilities.SummonBahamut) then
            if (Player.castinginfo.timesincecast >= xivopeners_smn.demiWaitTime) then
                xivopeners.log("Clipped gcd, continuing with r4")
                xivopeners_smn.abilityQueue[1]:Cast(target.id)
                xivopeners_smn.lastCastFromQueue = xivopeners_smn.abilityQueue[1]
            else
                xivopeners.log("Waiting for gcd clip")
            end
            return
        end

        -- check for ruin 4 proc before using ruin 4
        if (xivopeners_smn.abilityQueue[1] == xivopeners_smn.openerAbilities.Ruin4 and not HasBuff(Player.id, xivopeners_smn.openerAbilities.Ruin4BuffID)) then
            -- it's actually really bad if this happens because it means we miss a WW, so let's recover with an r2 instead
            xivopeners.log("Didn't have r4 proc for ruin 4 cast, casting r2 instead")
            xivopeners_smn.openerAbilities.Ruin2:Cast(target.id)
            xivopeners_smn.lastCastFromQueue = xivopeners_smn.openerAbilities.Ruin2
            return
        end

                -- idk how to make it not spam console
        --xivopeners.log("Casting " .. xivopeners_smn.abilityQueue[1].name)
        xivopeners_smn.abilityQueue[1]:Cast(target.id)
        xivopeners_smn.lastCastFromQueue = xivopeners_smn.abilityQueue[1]
    end
end