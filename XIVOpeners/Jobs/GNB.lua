xivopeners_gnb = {}

xivopeners_gnb.supportedLevel = 80
xivopeners_gnb.openerAbilities = {
    LightningShot = ActionList:Get(1, 16143),
    Bloodfest = ActionList:Get(1, 16164),
    KeenEdge = ActionList:Get(1, 16137),
    BrutalShell = ActionList:Get(1, 16139),
    NoMercy = ActionList:Get(1, 16138),
    GnashingFang = ActionList:Get(1, 16146),
    JugularRip = ActionList:Get(1, 16156),
    SonicBreak = ActionList:Get(1, 16153),
    BowShock = ActionList:Get(1, 16159),
    BlastingZone = ActionList:Get(1, 16165),
    SavageClaw = ActionList:Get(1, 16147),
    AbdomenTear = ActionList:Get(1, 16157),
    WickedTalon = ActionList:Get(1, 16150),
    EyeGouge = ActionList:Get(1, 16158),
    SolidBarrel = ActionList:Get(1, 16145),
    RoughDivide = ActionList:Get(1, 16154),
    BurstStrike = ActionList:Get(1, 16162),
    Sprint = ActionList:Get(1, 3),
    Tincture = {name = "Tincture", ids = {29492, 27995, 27786}, range = 0},
    MedicineBuffID = 49,
}

xivopeners_gnb.openerInfo = {
    listOpeners = {"EarlyBF", "Standard"}
}

xivopeners_gnb.openers = {
    EarlyBF = {
        xivopeners_gnb.openerAbilities.LightningShot,
        xivopeners_gnb.openerAbilities.Bloodfest,
        xivopeners_gnb.openerAbilities.KeenEdge,
        xivopeners_gnb.openerAbilities.Tincture,
        xivopeners_gnb.openerAbilities.BrutalShell,
        xivopeners_gnb.openerAbilities.NoMercy,
        xivopeners_gnb.openerAbilities.GnashingFang,
        xivopeners_gnb.openerAbilities.JugularRip,
        xivopeners_gnb.openerAbilities.SonicBreak,
        xivopeners_gnb.openerAbilities.BowShock,
        xivopeners_gnb.openerAbilities.BlastingZone,
        xivopeners_gnb.openerAbilities.SavageClaw,
        xivopeners_gnb.openerAbilities.AbdomenTear,
        xivopeners_gnb.openerAbilities.WickedTalon,
        xivopeners_gnb.openerAbilities.EyeGouge,
        xivopeners_gnb.openerAbilities.SolidBarrel,
        xivopeners_gnb.openerAbilities.RoughDivide,
        xivopeners_gnb.openerAbilities.BurstStrike,
        xivopeners_gnb.openerAbilities.RoughDivide,
        xivopeners_gnb.openerAbilities.BurstStrike,
        xivopeners_gnb.openerAbilities.KeenEdge,
        xivopeners_gnb.openerAbilities.BrutalShell,
        xivopeners_gnb.openerAbilities.SolidBarrel,
        xivopeners_gnb.openerAbilities.KeenEdge,
        xivopeners_gnb.openerAbilities.BrutalShell,
        xivopeners_gnb.openerAbilities.GnashingFang,
        xivopeners_gnb.openerAbilities.JugularRip,
        xivopeners_gnb.openerAbilities.SavageClaw,
        xivopeners_gnb.openerAbilities.AbdomenTear,
        xivopeners_gnb.openerAbilities.BlastingZone,
        xivopeners_gnb.openerAbilities.WickedTalon,
        xivopeners_gnb.openerAbilities.EyeGouge,
        xivopeners_gnb.openerAbilities.SolidBarrel
    },

    Standard = {
        xivopeners_gnb.openerAbilities.LightningShot,
        xivopeners_gnb.openerAbilities.KeenEdge,
        xivopeners_gnb.openerAbilities.BrutalShell,
        xivopeners_gnb.openerAbilities.Tincture,
        xivopeners_gnb.openerAbilities.SolidBarrel,
        xivopeners_gnb.openerAbilities.KeenEdge,
        xivopeners_gnb.openerAbilities.NoMercy,
        xivopeners_gnb.openerAbilities.GnashingFang,
        xivopeners_gnb.openerAbilities.Bloodfest,
        xivopeners_gnb.openerAbilities.JugularRip,
        xivopeners_gnb.openerAbilities.SonicBreak,
        xivopeners_gnb.openerAbilities.BowShock,
        xivopeners_gnb.openerAbilities.BlastingZone,
        xivopeners_gnb.openerAbilities.SavageClaw,
        xivopeners_gnb.openerAbilities.RoughDivide,
        xivopeners_gnb.openerAbilities.AbdomenTear,
        xivopeners_gnb.openerAbilities.WickedTalon,
        xivopeners_gnb.openerAbilities.RoughDivide,
        xivopeners_gnb.openerAbilities.EyeGouge,
        xivopeners_gnb.openerAbilities.BrutalShell,
        xivopeners_gnb.openerAbilities.BurstStrike,
        xivopeners_gnb.openerAbilities.BurstStrike,
        xivopeners_gnb.openerAbilities.SolidBarrel,
        xivopeners_gnb.openerAbilities.BurstStrike,
        xivopeners_gnb.openerAbilities.KeenEdge,
        xivopeners_gnb.openerAbilities.BrutalShell,
        xivopeners_gnb.openerAbilities.SolidBarrel
    }

}

xivopeners_gnb.abilityQueue = {}
xivopeners_gnb.lastCastFromQueue = nil -- might need this for some more complex openers with conditions
xivopeners_gnb.openerStarted = false
xivopeners_gnb.lastcastid = 0
xivopeners_gnb.lastcastid2 = 0

function xivopeners_gnb.getTincture()
    for i = 0, 3 do
        for _, id in pairs(xivopeners_gnb.openerAbilities.Tincture.ids) do
            local tincture = Inventory:Get(i):Get(id)
            if (tincture) then return tincture end
        end
    end
    return nil
end

function xivopeners_gnb.getOpener()
    if (xivopeners.settings[Player.job].currentOpenerIndex == 1) then
        return xivopeners_gnb.openers.EarlyBF
    elseif (xivopeners.settings[Player.job].currentOpenerIndex == 2) then
        return xivopeners_gnb.openers.Standard
    end
    return {}
end

function xivopeners_gnb.checkOpenerIds()
    for key, action in pairs(xivopeners_gnb.getOpener()) do
        if (action == nil) then
            xivopeners.log("WARNING: Action at index " .. tostring(key) .. " was nil! The id is likely incorrect.")
        end
    end
end

function xivopeners_gnb.openerAvailable()
    -- check cooldowns
    for _, action in pairs(xivopeners_gnb.getOpener()) do
        if (action == xivopeners_gnb.openerAbilities.Tincture) then
            local tincture = xivopeners_gnb.getTincture()
            if (tincture and xivopeners.settings[Player.job].useTincture and tincture:GetAction().cd >= 1.5 and not HasBuff(Player.id, xivopeners_gnb.openerAbilities.MedicineBuffID)) then
                return false
            end
        elseif (action.cd >= 1.5) then
            return false
        end
    end
    return true
end

function xivopeners_gnb.queueOpener()
    -- the only time this gets called is when the main script is toggled, so we can do more than just queue the opener
    -- empty queue first
    xivopeners_gnb.abilityQueue = {}
    for _, action in pairs(xivopeners_gnb.getOpener()) do
        xivopeners_gnb.enqueue(action)
    end

    xivopeners_gnb.lastCastFromQueue = nil
    xivopeners_gnb.openerStarted = false

    if (xivopeners.settings[Player.job].useTincture and not xivopeners_gnb.getTincture()) then
        -- if we don't have a tincture but the toggle is on, turn it off
        xivopeners.settings[Player.job].useTincture = false
    end
end

function xivopeners_gnb.updateLastCast()
    if (xivopeners_gnb.lastCastFromQueue) then
        if (xivopeners_gnb.lastcastid == -1) then
            -- compare the real castid and see if it changed, if it did, update from -1
            if (xivopeners_gnb.lastcastid2 ~= Player.castinginfo.castingid and xivopeners_gnb.lastCastFromQueue.cd > 0) then
                xivopeners_gnb.lastcastid = Player.castinginfo.castingid
                xivopeners_gnb.lastcastid2 = Player.castinginfo.castingid
            end
        elseif (xivopeners_gnb.lastcastid ~= Player.castinginfo.castingid and xivopeners_gnb.lastCastFromQueue.cd > 0) then
            xivopeners_gnb.lastcastid = Player.castinginfo.castingid
            xivopeners_gnb.lastcastid2 = Player.castinginfo.castingid
        end
    end
end

function xivopeners_gnb.drawCall(event, tickcount)
    GUI:AlignFirstTextHeightToWidgets()
    GUI:BeginGroup()
    GUI:Text("Use Tincture")
    GUI:NextColumn()
    xivopeners.settings[Player.job].useTincture = GUI:Checkbox("##xivopeners_gnb_tincturecheck", xivopeners.settings[Player.job].useTincture)
    GUI:EndGroup()
    GUI:NextColumn()
end

function xivopeners_gnb.main(event, tickcount)
    if (Player.level >= xivopeners_gnb.supportedLevel) then
        local target = Player:GetTarget()

        if (not target or not target.attackable) then return end

        -- don't start opener if it's not available
        if (not xivopeners_gnb.openerAvailable() and not xivopeners_gnb.openerStarted) then
            return
        end -- don't start opener if it's not available, if it's already started then yolo

        if (xivopeners_gnb.openerStarted and next(xivopeners_gnb.abilityQueue) == nil) then
            -- opener is finished, pass control to ACR
            xivopeners.log("Finished openers, handing control to ACR")
            xivopeners_gnb.openerStarted = false
            if (xivopeners.running) then
                xivopeners.ToggleRun()
            end
            if (not FFXIV_Common_BotRunning) then
                ml_global_information.ToggleRun()
            end
            return
        end

        xivopeners_gnb.updateLastCast()

        if (not xivopeners_gnb.openerStarted) then
            -- technically, even if you use an ability from prepull, it should still work, since the next time this loop runs it'll jump to the elseif
            xivopeners.log("Starting opener")
            xivopeners_gnb.openerStarted = true
            xivopeners_gnb.useNextAction(target)
        elseif (xivopeners_gnb.lastCastFromQueue and xivopeners_gnb.lastcastid == xivopeners_gnb.lastCastFromQueue.id) then
            xivopeners_gnb.lastcastid = -1
            xivopeners_gnb.dequeue()
            xivopeners_gnb.useNextAction(target)
        else
            xivopeners_gnb.useNextAction(target)
        end
    end
end

function xivopeners_gnb.enqueue(action)
    -- implementation of the queue can be changed later
    table.insert(xivopeners_gnb.abilityQueue, action)
end

function xivopeners_gnb.dequeue()
    xivopeners.log("Dequeing " .. xivopeners_gnb.abilityQueue[1].name)
    table.remove(xivopeners_gnb.abilityQueue, 1)
end

function xivopeners_gnb.useNextAction(target)
    -- do the actual opener
    -- the current implementation uses a queue system
    if (target and target.attackable and xivopeners_gnb.abilityQueue[1] and (xivopeners_gnb.abilityQueue[1].range <= 0 or target.distance2d <= xivopeners_gnb.abilityQueue[1].range)) then
        if (xivopeners_gnb.abilityQueue[1] == xivopeners_gnb.openerAbilities.Tincture) then
            local tincture = xivopeners_gnb.getTincture()
            if (HasBuff(Player.id, xivopeners_gnb.openerAbilities.MedicineBuffID) or not xivopeners.settings[Player.job].useTincture or not tincture) then
                xivopeners.log("Tincture already used during opener, not enabled, or not available, dequeueing")
                xivopeners_gnb.dequeue()
                return
            end

            if (tincture) then
                xivopeners.log("Casting tincture")
                tincture:Cast()
                xivopeners_gnb.lastCastFromQueue = tincture:GetAction()
            end
            -- don't want to continue past this point or we risk breaking shit
            return
        end

        -- delay buff until end of gcd so we can get the highest amount of gcds inside the buff window
        if (xivopeners_gnb.abilityQueue[1] == xivopeners_gnb.openerAbilities.NoMercy) then
            -- wait until there's 0.9s on the gcd
            if (xivopeners_gnb.openerAbilities.KeenEdge.cdmax - xivopeners_gnb.openerAbilities.KeenEdge.cd < 0.9) then
                xivopeners_gnb.abilityQueue[1]:Cast(target.id)
                xivopeners_gnb.lastCastFromQueue = xivopeners_gnb.abilityQueue[1]
            end
            return
        end

        xivopeners_gnb.abilityQueue[1]:Cast(target.id)
        xivopeners_gnb.lastCastFromQueue = xivopeners_gnb.abilityQueue[1]
    end
end