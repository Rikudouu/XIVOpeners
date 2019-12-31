xivopeners_drk = {}

xivopeners_drk.supportedLevel = 80
xivopeners_drk.openerAbilities = {
    TheBlackestNight = ActionList:Get(1, 7393),
    BloodWeapon = ActionList:Get(1, 3625),
    HardSlash = ActionList:Get(1, 3617),
    EdgeOfShadow = ActionList:Get(1, 16470),
    SyphonStrike = ActionList:Get(1, 3623),
    Souleater = ActionList:Get(1, 3632),
    LivingShadow = ActionList:Get(1, 16472),
    SaltedEarth = ActionList:Get(1, 3639),
    Plunge = ActionList:Get(1, 3640),
    Delirium = ActionList:Get(1, 7390),
    CarveAndSpit = ActionList:Get(1, 3643),
    AbyssalDrain = ActionList:Get(1, 3641),
    BloodSpiller = ActionList:Get(1, 7392),
    Unmend = ActionList:Get(1, 3624),
    Sprint = ActionList:Get(1, 3),
    Tincture = {name = "Tincture", ids = {27995, 27786}, range = 0},
    MedicineBuffID = 49,
}

xivopeners_drk.openerInfo = {
    listOpeners = {"dblwv", "highping"}
}

xivopeners_drk.openers = {
    dblwv = {
        xivopeners_drk.openerAbilities.Unmend,
        xivopeners_drk.openerAbilities.BloodWeapon,
        xivopeners_drk.openerAbilities.HardSlash,
        xivopeners_drk.openerAbilities.EdgeOfShadow,
        xivopeners_drk.openerAbilities.SyphonStrike,
        xivopeners_drk.openerAbilities.Tincture,
        xivopeners_drk.openerAbilities.Souleater,
        xivopeners_drk.openerAbilities.LivingShadow,
        xivopeners_drk.openerAbilities.HardSlash,
        xivopeners_drk.openerAbilities.SaltedEarth,
        xivopeners_drk.openerAbilities.Plunge,
        xivopeners_drk.openerAbilities.SyphonStrike,
        xivopeners_drk.openerAbilities.EdgeOfShadow,
        xivopeners_drk.openerAbilities.Delirium,
        xivopeners_drk.openerAbilities.BloodSpiller,
        xivopeners_drk.openerAbilities.EdgeOfShadow,
        xivopeners_drk.openerAbilities.CarveAndSpit,
        xivopeners_drk.openerAbilities.BloodSpiller,
        xivopeners_drk.openerAbilities.EdgeOfShadow,
        xivopeners_drk.openerAbilities.AbyssalDrain,
        xivopeners_drk.openerAbilities.BloodSpiller,
        xivopeners_drk.openerAbilities.Plunge,
        xivopeners_drk.openerAbilities.BloodSpiller,
        xivopeners_drk.openerAbilities.EdgeOfShadow,
        xivopeners_drk.openerAbilities.BloodSpiller,
        xivopeners_drk.openerAbilities.Souleater
    },
    highping = {
        xivopeners_drk.openerAbilities.Tincture,
        xivopeners_drk.openerAbilities.TheBlackestNight,
        xivopeners_drk.openerAbilities.BloodWeapon,
        xivopeners_drk.openerAbilities.HardSlash,
        xivopeners_drk.openerAbilities.EdgeOfShadow,
        xivopeners_drk.openerAbilities.SyphonStrike,
        xivopeners_drk.openerAbilities.Plunge,
        xivopeners_drk.openerAbilities.Souleater,
        xivopeners_drk.openerAbilities.LivingShadow,
        xivopeners_drk.openerAbilities.HardSlash,
        xivopeners_drk.openerAbilities.SaltedEarth,
        xivopeners_drk.openerAbilities.SyphonStrike,
        xivopeners_drk.openerAbilities.EdgeOfShadow,
        xivopeners_drk.openerAbilities.Delirium,
        xivopeners_drk.openerAbilities.BloodSpiller,
        xivopeners_drk.openerAbilities.EdgeOfShadow,
        xivopeners_drk.openerAbilities.BloodSpiller,
        xivopeners_drk.openerAbilities.CarveAndSpit,
        xivopeners_drk.openerAbilities.BloodSpiller,
        xivopeners_drk.openerAbilities.EdgeOfShadow,
        xivopeners_drk.openerAbilities.BloodSpiller,
        xivopeners_drk.openerAbilities.AbyssalDrain,
        xivopeners_drk.openerAbilities.BloodSpiller,
        xivopeners_drk.openerAbilities.Plunge,
        xivopeners_drk.openerAbilities.BloodSpiller,
        xivopeners_drk.openerAbilities.Souleater
    }
}

xivopeners_drk.abilityQueue = {}
xivopeners_drk.lastCastFromQueue = nil -- might need this for some more complex openers with conditions
xivopeners_drk.openerStarted = false
xivopeners_drk.lastcastid = 0
xivopeners_drk.lastcastid2 = 0

function xivopeners_drk.getTincture()
    for i = 0, 3 do
        for _, id in pairs(xivopeners_drk.openerAbilities.Tincture.ids) do
            local tincture = Inventory:Get(i):Get(id)
            if (tincture) then return tincture end
        end
    end
    return nil
end

function xivopeners_drk.getOpener()
    if (xivopeners.settings[Player.job].currentOpenerIndex == 1) then
        return xivopeners_drk.openers.dblwv
    else
        return xivopeners_drk.openers.highping
    end
    return {}
end

function xivopeners_drk.checkOpenerIds()
    for key, action in pairs(xivopeners_drk.getOpener()) do
        if (action == nil) then
            xivopeners.log("WARNING: Action at index " .. tostring(key) .. " was nil! The id is likely incorrect.")
        end
    end
end

function xivopeners_drk.openerAvailable()
    -- check cooldowns
    for _, action in pairs(xivopeners_drk.getOpener()) do
        if (action == xivopeners_drk.openerAbilities.Tincture) then
            local tincture = xivopeners_drk.getTincture()
            if (tincture and xivopeners.settings[Player.job].useTincture and tincture:GetAction().cd >= 1.5 and not HasBuff(Player.id, xivopeners_drk.openerAbilities.MedicineBuffID)) then
                return false
            end
        elseif (action.cd >= 1.5) then
            return false
        end
    end
    return true
end

function xivopeners_drk.queueOpener()
    -- the only time this gets called is when the main script is toggled, so we can do more than just queue the opener
    -- empty queue first
    xivopeners_drk.abilityQueue = {}
    for _, action in pairs(xivopeners_drk.getOpener()) do
        xivopeners_drk.enqueue(action)
    end

    xivopeners_drk.lastCastFromQueue = nil
    xivopeners_drk.openerStarted = false

    if (xivopeners.settings[Player.job].useTincture and not xivopeners_drk.getTincture()) then
        -- if we don't have a tincture but the toggle is on, turn it off
        xivopeners.settings[Player.job].useTincture = false
    end
end

function xivopeners_drk.updateLastCast()
    if (xivopeners_drk.lastCastFromQueue) then
        if (xivopeners_drk.lastcastid == -1) then
            -- compare the real castid and see if it changed, if it did, update from -1
            if (xivopeners_drk.lastcastid2 ~= Player.castinginfo.castingid and xivopeners_drk.lastCastFromQueue.cd > 0) then
                xivopeners_drk.lastcastid = Player.castinginfo.castingid
                xivopeners_drk.lastcastid2 = Player.castinginfo.castingid
            end
        elseif (xivopeners_drk.lastcastid ~= Player.castinginfo.castingid and xivopeners_drk.lastCastFromQueue.cd > 0) then
            xivopeners_drk.lastcastid = Player.castinginfo.castingid
            xivopeners_drk.lastcastid2 = Player.castinginfo.castingid
        end
    end
end

function xivopeners_drk.drawCall(event, tickcount)
    GUI:AlignFirstTextHeightToWidgets()
    GUI:BeginGroup()
    GUI:Text("Use Tincture")
    GUI:NextColumn()
    xivopeners.settings[Player.job].useTincture = GUI:Checkbox("##xivopeners_drk_tincturecheck", xivopeners.settings[Player.job].useTincture)
    GUI:EndGroup()
    GUI:NextColumn()
end

function xivopeners_drk.main(event, tickcount)
    if (Player.level >= xivopeners_drk.supportedLevel) then
        local target = Player:GetTarget()
        if (not target or not target.attackable) then return end

        -- don't start opener if it's not available
        if (not xivopeners_drk.openerAvailable() and not xivopeners_drk.openerStarted) then
            return
        end -- don't start opener if it's not available, if it's already started then yolo

        if (xivopeners_drk.openerStarted and next(xivopeners_drk.abilityQueue) == nil) then
            -- opener is finished, pass control to ACR
            xivopeners.log("Finished openers, handing control to ACR")
            xivopeners_drk.openerStarted = false
            if (xivopeners.running) then
                xivopeners.ToggleRun()
            end
            if (not FFXIV_Common_BotRunning) then
                ml_global_information.ToggleRun()
            end
            return
        end

        xivopeners_drk.updateLastCast()


        if (not xivopeners_drk.openerStarted) then
            -- technically, even if you use an ability from prepull, it should still work, since the next time this loop runs it'll jump to the elseif
            xivopeners.log("Starting opener")
            xivopeners_drk.openerStarted = true
            xivopeners_drk.useNextAction(target)
        elseif (xivopeners_drk.lastCastFromQueue and xivopeners_drk.lastcastid == xivopeners_drk.lastCastFromQueue.id) then
            xivopeners_drk.lastcastid = -1
            xivopeners_drk.dequeue()
            xivopeners_drk.useNextAction(target)
        else
            xivopeners_drk.useNextAction(target)
        end
    end
end

function xivopeners_drk.enqueue(action)
    -- implementation of the queue can be changed later
    table.insert(xivopeners_drk.abilityQueue, action)
end

function xivopeners_drk.dequeue()
    xivopeners.log("Dequeing " .. xivopeners_drk.abilityQueue[1].name)
    table.remove(xivopeners_drk.abilityQueue, 1)
end

function xivopeners_drk.useNextAction(target)
    -- do the actual opener
    -- the current implementation uses a queue system
    if (target and target.attackable and xivopeners_drk.abilityQueue[1] and (xivopeners_drk.abilityQueue[1].range <= 0 or target.distance2d <= xivopeners_drk.abilityQueue[1].range)) then
        if (xivopeners_drk.abilityQueue[1] == xivopeners_drk.openerAbilities.Tincture) then
            local tincture = xivopeners_drk.getTincture()
            if (HasBuff(Player.id, xivopeners_drk.openerAbilities.MedicineBuffID) or not xivopeners.settings[Player.job].useTincture or not tincture) then
                xivopeners.log("Tincture already used during opener, not enabled, or not available, dequeueing")
                xivopeners_drk.dequeue()
                return
            end

            if (tincture) then
                xivopeners.log("Casting tincture")
                tincture:Cast()
                xivopeners_drk.lastCastFromQueue = tincture:GetAction()
            end
            -- don't want to continue past this point or we risk breaking shit
            return
        end

        -- delay buff until end of gcd so we can get the highest amount of gcds inside the buff window
        -- at the moment, drk openers have double weaves for every buff, so this section isn't really needed. It should be modified and uncommented if the openers have the buffs in a single weave in the future
        --if (xivopeners_drk.abilityQueue[1] == xivopeners_drk.openerAbilities.Requiescat or xivopeners_drk.abilityQueue[1] == xivopeners_drk.openerAbilities.FightOrFlight) then
        --    -- wait until there's 0.9s on the gcd
        --    if (xivopeners_drk.openerAbilities.FastBlade.cdmax - xivopeners_drk.openerAbilities.FastBlade.cd < 0.9) then
        --        xivopeners_drk.abilityQueue[1]:Cast(target.id)
        --        xivopeners_drk.lastCastFromQueue = xivopeners_drk.abilityQueue[1]
        --    end
        --
        --    return
        --end

        xivopeners_drk.abilityQueue[1]:Cast(target.id)
        xivopeners_drk.lastCastFromQueue = xivopeners_drk.abilityQueue[1]
    end
end
