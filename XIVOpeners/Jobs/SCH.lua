xivopeners_sch = {}

xivopeners_sch.supportedLevel = 80
xivopeners_sch.openerAbilities = {
    -- all pet actions are ifrit only!!! WILL HANG IF NOT IFRIT, already know morons will complain
    Broil3 = ActionList:Get(1, 16541),
    Biolysis = ActionList:Get(1, 16540),
    Aetherflow = ActionList:Get(1, 166),
    EnergyDrain = ActionList:Get(1, 167),
    Ruin2 = ActionList:Get(1, 17870),
    Swiftcast = ActionList:Get(1, 7561),
    ChainStratagem = ActionList:Get(1, 7436),
    Dissipation = ActionList:Get(1, 3587),
    SummonEos = ActionList:Get(1, 17215),
    SummonSelene = ActionList:Get(1, 17216),
    Tincture = {name = "Tincture", ids = {31897, 29496, 27790, 27999}, range = 0}, -- mind
    MedicineBuffID = 49,
    EosPetID = 1398,
    SelenePetID = 1399,
}

xivopeners_sch.openerInfo = {
    listOpeners = {"Standard", "Non-Dissipation"}
}

xivopeners_sch.openers = {
    standard = {
        xivopeners_sch.openerAbilities.Tincture,
        xivopeners_sch.openerAbilities.Broil3,
        xivopeners_sch.openerAbilities.Biolysis,
        xivopeners_sch.openerAbilities.Aetherflow,
        xivopeners_sch.openerAbilities.EnergyDrain,
        xivopeners_sch.openerAbilities.Broil3,
        xivopeners_sch.openerAbilities.Ruin2,
        xivopeners_sch.openerAbilities.Swiftcast,
        xivopeners_sch.openerAbilities.ChainStratagem,
        xivopeners_sch.openerAbilities.Broil3,
        xivopeners_sch.openerAbilities.EnergyDrain,
        xivopeners_sch.openerAbilities.Broil3,
        xivopeners_sch.openerAbilities.Ruin2,
        xivopeners_sch.openerAbilities.EnergyDrain,
        xivopeners_sch.openerAbilities.Dissipation,
        xivopeners_sch.openerAbilities.Broil3,
        xivopeners_sch.openerAbilities.Ruin2,
        xivopeners_sch.openerAbilities.EnergyDrain,
        xivopeners_sch.openerAbilities.Ruin2,
        xivopeners_sch.openerAbilities.EnergyDrain,
        xivopeners_sch.openerAbilities.Broil3,
        xivopeners_sch.openerAbilities.Broil3,
        xivopeners_sch.openerAbilities.Broil3,
        xivopeners_sch.openerAbilities.Biolysis
    },

    nonDissipation = {
        xivopeners_sch.openerAbilities.Tincture,
        xivopeners_sch.openerAbilities.Broil3,
        xivopeners_sch.openerAbilities.Biolysis,
        xivopeners_sch.openerAbilities.Aetherflow,
        xivopeners_sch.openerAbilities.EnergyDrain,
        xivopeners_sch.openerAbilities.Broil3,
        xivopeners_sch.openerAbilities.Ruin2,
        xivopeners_sch.openerAbilities.Swiftcast,
        xivopeners_sch.openerAbilities.ChainStratagem,
        xivopeners_sch.openerAbilities.Broil3,
        xivopeners_sch.openerAbilities.EnergyDrain,
        xivopeners_sch.openerAbilities.Broil3,
        xivopeners_sch.openerAbilities.Broil3,
        xivopeners_sch.openerAbilities.Broil3,
    }
}

xivopeners_sch.abilityQueue = {}
xivopeners_sch.lastCastFromQueue = nil -- might need this for some more complex openers with conditions
xivopeners_sch.openerStarted = false
xivopeners_sch.prepullSetup = false
xivopeners_sch.lastcastid = 0
xivopeners_sch.lastcastid2 = 0

function xivopeners_sch.getTincture()
    if TensorCore.API[gACRSelectedProfiles[Player.job]] ~= nil then
        local pot = TensorCore.API[gACRSelectedProfiles[Player.job]].getPotion()
        if pot ~= nil and pot:isReady() then
            return pot
        end

        return nil
    end

    for i = 0, 3 do
        for _, id in ipairs(xivopeners_sch.openerAbilities.Tincture.ids) do
            local tincture = Inventory:Get(i):Get(id)
            if (tincture and tincture:GetAction().cdmax - tincture:GetAction().cd < 1.5) then return tincture end
        end
    end
    return nil
end


function xivopeners_sch.getOpener()
    if (xivopeners.settings[Player.job].currentOpenerIndex == 1) then
        return xivopeners_sch.openers.standard
    elseif (xivopeners.settings[Player.job].currentOpenerIndex == 2) then
        return xivopeners_sch.openers.nonDissipation
    else
        return {}
    end
end

function xivopeners_sch.checkOpenerIds()
    for key, action in pairs(xivopeners_sch.openerAbilities) do
        if (action == nil) then
            xivopeners.log("WARNING: Action at index " .. tostring(key) .. " was nil! The id is likely incorrect.")
        end
    end
    for key, action in pairs(xivopeners_sch.getOpener()) do
        if (action == nil) then
            xivopeners.log("WARNING: Action at index " .. tostring(key) .. " in opener " .. tostring(xivopeners.settings[Player.job].currentOpenerIndex) .. " is nil. Possible typo?")
        end

    end
end

function xivopeners_sch.openerAvailable()
    -- check cooldowns
    for _, action in pairs(xivopeners_sch.getOpener()) do
        if (action == xivopeners_sch.openerAbilities.Tincture) then
            local tincture = xivopeners_sch.getTincture()
            if (tincture and xivopeners.settings[Player.job].useTincture and tincture:GetAction().cd >= 1.5 and not HasBuff(Player.id, xivopeners_sch.openerAbilities.MedicineBuffID)) then
                return false
            end
        elseif (action.cd >= 1.5) then
            return false
        end
    end
    return true
end


function xivopeners_sch.queueOpener()
    -- the only time this gets called is when the main script is toggled, so we can do more than just queue the opener
    -- empty queue first
    xivopeners_sch.abilityQueue = {}
    for _, action in pairs(xivopeners_sch.getOpener()) do
        xivopeners_sch.enqueue(action)
    end
    --    xivopeners.log("queue:")
    --    for _, v in pairs(xivopeners_sch.abilityQueue) do
    --        xivopeners.log(v.name)
    --    end
    xivopeners_sch.lastCastFromQueue = nil
    xivopeners_sch.openerStarted = false
    -- if (xivopeners.settings[Player.job].useTincture and not xivopeners_sch.getTincture()) then
    --     xivopeners.settings[Player.job].useTincture = false
    -- end
end

function xivopeners_sch.updateLastCast()
    if (xivopeners_sch.lastCastFromQueue) then
        --        xivopeners.log(tostring(xivopeners_sch.lastcastid) .. ", " .. tostring(xivopeners_sch.lastcastid2) .. ", " .. tostring(Player.castinginfo.lastcastid))
        if (xivopeners_sch.lastcastid == -1) then
            -- compare the real castid and see if it changed, if it did, update from -1
            if (xivopeners_sch.lastcastid2 ~= Player.castinginfo.castingid and xivopeners_sch.lastCastFromQueue.cd > 0) then
                xivopeners.log("cast changed")
                xivopeners_sch.lastcastid = Player.castinginfo.castingid
                xivopeners_sch.lastcastid2 = Player.castinginfo.castingid
            end
        elseif (xivopeners_sch.lastcastid ~= Player.castinginfo.castingid and xivopeners_sch.lastCastFromQueue.cd > 0) then
            xivopeners_sch.lastcastid = Player.castinginfo.castingid
            xivopeners_sch.lastcastid2 = Player.castinginfo.castingid
        end
    end
end

function xivopeners_sch.drawCall(event, tickcount)
    GUI:AlignFirstTextHeightToWidgets()
    GUI:BeginGroup()
    GUI:Text("Use Tincture")
    GUI:NextColumn()
    xivopeners.settings[Player.job].useTincture = GUI:Checkbox("##xivopeners_sch_tincturecheck", xivopeners.settings[Player.job].useTincture)
    GUI:EndGroup()
    GUI:NextColumn()
end

function xivopeners_sch.main(event, tickcount)
    if (Player.level >= xivopeners_sch.supportedLevel) then
        -- summon selene if we haven't already
        if (not Player.pet or (Player.pet.contentid ~= xivopeners_sch.openerAbilities.EosPetID and Player.pet.contentid ~= xivopeners_sch.openerAbilities.SelenePetID)) then
            xivopeners_sch.prepullSetup = true
        else
            xivopeners_sch.prepullSetup = false
        end

        if (xivopeners.running and not xivopeners_sch.openerStarted and xivopeners_sch.prepullSetup and not ActionList:IsCasting() and Player.castinginfo.timesincecast > 2000) then
            xivopeners.log("Summoning healing slave prepull")
            xivopeners_sch.openerAbilities.SummonSelene:Cast()
        end

        local target = Player:GetTarget()

        if (not target or not target.attackable) then return end

        if (not xivopeners_sch.openerAvailable() and not xivopeners_sch.openerStarted) then return end -- don't start opener if it's not available, if it's already started then yolo

        if (xivopeners_sch.openerStarted and next(xivopeners_sch.abilityQueue) == nil) then
            -- opener is finished, pass control to ACR
            xivopeners.log("Finished openers, handing control to ACR")
            xivopeners_sch.openerStarted = false
            if (xivopeners.running) then xivopeners.ToggleRun() end
            if (not FFXIV_Common_BotRunning) then
                ml_global_information.ToggleRun()
            end
            return
        end

        xivopeners_sch.updateLastCast()

        if (ActionList:IsCasting()) then return end

        if (not xivopeners_sch.openerStarted) then
            -- technically, even if you use an ability from prepull, it should still work, since the next time this loop runs it'll jump to the elseif
            xivopeners.log("Starting opener")
            xivopeners_sch.openerStarted = true
            xivopeners_sch.useNextAction(target)
        elseif (xivopeners_sch.lastCastFromQueue and xivopeners_sch.lastcastid == xivopeners_sch.lastCastFromQueue.id) then
            xivopeners_sch.lastcastid = -1
            xivopeners_sch.dequeue()
            xivopeners_sch.useNextAction(target)
        else
            xivopeners_sch.useNextAction(target)
        end

    end
end

function xivopeners_sch.enqueue(action)
    -- implementation of the queue can be changed later
    table.insert(xivopeners_sch.abilityQueue, action)
end

function xivopeners_sch.dequeue()
    xivopeners.log("Dequeing " .. xivopeners_sch.abilityQueue[1].name)
    table.remove(xivopeners_sch.abilityQueue, 1)
end

function xivopeners_sch.useNextAction(target)
    -- do the actual opener
    -- the current implementation uses a queue system
    if (target and target.attackable and xivopeners_sch.abilityQueue[1] and (xivopeners_sch.abilityQueue[1].range <= 0 or target.distance2d <= xivopeners_sch.abilityQueue[1].range)) then
        -- tincture check
        if (xivopeners_sch.abilityQueue[1] == xivopeners_sch.openerAbilities.Tincture) then
            local tincture = xivopeners_sch.getTincture()
            if (HasBuff(Player.id, xivopeners_sch.openerAbilities.MedicineBuffID) or not xivopeners.settings[Player.job].useTincture or not tincture) then
                xivopeners.log("Tincture already used during opener, not enabled, or not available, dequeueing")
                xivopeners_sch.dequeue()
                return
            end

            if (tincture) then
                xivopeners.log("Casting tincture")
                tincture:Cast()
                xivopeners_sch.lastCastFromQueue = tincture:GetAction()
            end
            -- don't want to continue past this point or we risk breaking shit
            return
        end

        -- idk how to make it not spam console
        --xivopeners.log("Casting " .. xivopeners_sch.abilityQueue[1].name)
        xivopeners_sch.abilityQueue[1]:Cast(target.id)
        xivopeners_sch.lastCastFromQueue = xivopeners_sch.abilityQueue[1]
    end
end