xivopeners_blm = {}

xivopeners_blm.supportedLevel = 80
xivopeners_blm.openerAbilities = {
    BlizzardIII = ActionList:Get(1, 154),
    Enochian = ActionList:Get(1, 3575),
    ThunderIII = ActionList:Get(1, 153),
    BlizzardIV = ActionList:Get(1, 3576),
    TripleCast = ActionList:Get(1,7421),
    FireIII = ActionList:Get(1, 152),
    FireIV = ActionList:Get(1, 3577),
    LeyLines = ActionList:Get(1, 3573),
    SwiftCast = ActionList:Get(1, 7561),
    Despair = ActionList:Get(1, 16505),
    ManaFont = ActionList:Get(1, 158),
    Fire = ActionList:Get(1, 141),
    SharpCast = ActionList:Get(1, 3574),
    SharpCastBuffID = 867,
    Tincture = {name = "Tincture", ids = {27998, 27789}}, -- int
    MedicineBuffID = 49,
}

xivopeners_blm.openerInfo = {
    listOpeners = {"No B4", "Double Sharp", "Sharp Fire"},
    currentOpenerIndex = 1,
}

xivopeners_blm.openers = {
    nob4 = {
        xivopeners_blm.openerAbilities.BlizzardIII,
        xivopeners_blm.openerAbilities.Enochian,
        xivopeners_blm.openerAbilities.ThunderIII,
        xivopeners_blm.openerAbilities.FireIII,
        xivopeners_blm.openerAbilities.TripleCast,
        xivopeners_blm.openerAbilities.FireIV,
        xivopeners_blm.openerAbilities.Tincture,
        xivopeners_blm.openerAbilities.FireIV,
        xivopeners_blm.openerAbilities.LeyLines,
        xivopeners_blm.openerAbilities.FireIV,
        xivopeners_blm.openerAbilities.SwiftCast,
        xivopeners_blm.openerAbilities.FireIV,
        xivopeners_blm.openerAbilities.FireIV,
        xivopeners_blm.openerAbilities.Despair,
        xivopeners_blm.openerAbilities.ThunderIII,
        xivopeners_blm.openerAbilities.ManaFont,
        xivopeners_blm.openerAbilities.FireIV,
        xivopeners_blm.openerAbilities.Despair
    },

    doubleSharp = {
        xivopeners_blm.openerAbilities.BlizzardIII,
        xivopeners_blm.openerAbilities.Enochian,
        xivopeners_blm.openerAbilities.ThunderIII,
        xivopeners_blm.openerAbilities.BlizzardIV,
        xivopeners_blm.openerAbilities.FireIII,
        xivopeners_blm.openerAbilities.TripleCast,
        xivopeners_blm.openerAbilities.FireIV,
        xivopeners_blm.openerAbilities.Tincture,
        xivopeners_blm.openerAbilities.FireIV,
        xivopeners_blm.openerAbilities.LeyLines,
        xivopeners_blm.openerAbilities.FireIV,
        xivopeners_blm.openerAbilities.FireIV,
        xivopeners_blm.openerAbilities.ThunderIII,
        xivopeners_blm.openerAbilities.SharpCast,
        xivopeners_blm.openerAbilities.Fire,
        xivopeners_blm.openerAbilities.FireIV,
        xivopeners_blm.openerAbilities.FireIV,
        xivopeners_blm.openerAbilities.FireIII,
        xivopeners_blm.openerAbilities.SwiftCast,
        xivopeners_blm.openerAbilities.Despair,
        xivopeners_blm.openerAbilities.ManaFont,
        xivopeners_blm.openerAbilities.FireIV,
        xivopeners_blm.openerAbilities.Despair
    },

    sharpFire = {
        xivopeners_blm.openerAbilities.BlizzardIII,
        xivopeners_blm.openerAbilities.Enochian,
        xivopeners_blm.openerAbilities.ThunderIII,
        xivopeners_blm.openerAbilities.BlizzardIV,
        xivopeners_blm.openerAbilities.FireIII,
        xivopeners_blm.openerAbilities.TripleCast,
        xivopeners_blm.openerAbilities.FireIV,
        xivopeners_blm.openerAbilities.Tincture,
        xivopeners_blm.openerAbilities.FireIV,
        xivopeners_blm.openerAbilities.SharpCast,
        xivopeners_blm.openerAbilities.LeyLines,
        xivopeners_blm.openerAbilities.FireIV,
        xivopeners_blm.openerAbilities.Fire,
        xivopeners_blm.openerAbilities.FireIV,
        xivopeners_blm.openerAbilities.FireIV,
        xivopeners_blm.openerAbilities.FireIV,
        xivopeners_blm.openerAbilities.FireIII,
        xivopeners_blm.openerAbilities.SwiftCast,
        xivopeners_blm.openerAbilities.Despair,
        xivopeners_blm.openerAbilities.ManaFont,
        xivopeners_blm.openerAbilities.FireIV,
        xivopeners_blm.openerAbilities.Despair
    },
}

xivopeners_blm.abilityQueue = {}
xivopeners_blm.lastCastFromQueue = nil -- might need this for some more complex openers with conditions
xivopeners_blm.openerStarted = false
xivopeners_blm.useTincture = false
xivopeners_blm.lastcastid = 0
xivopeners_blm.lastcastid2 = 0

function xivopeners_blm.getTincture()
    for i = 0, 3 do
        for _, id in pairs(xivopeners_blm.openerAbilities.Tincture.ids) do
            local tincture = Inventory:Get(i):Get(id)
            if (tincture) then return tincture end
        end
    end
    return nil
end


function xivopeners_blm.getOpener()
    if (xivopeners_blm.openerInfo.currentOpenerIndex == 1) then
        return xivopeners_blm.openers.nob4
    elseif (xivopeners_blm.openerInfo.currentOpenerIndex == 2) then
        return xivopeners_blm.openers.doubleSharp
    elseif (xivopeners_blm.openerInfo.currentOpenerIndex == 3) then
        return xivopeners_blm.openers.sharpFire
    else
        return {}
    end
end

function xivopeners_blm.checkOpenerIds()
    for key, action in pairs(xivopeners_blm.openerAbilities) do
        if (action == nil) then
            xivopeners.log("WARNING: Action at index " .. tostring(key) .. " was nil! The id is likely incorrect.")
        end
    end
    for key, action in pairs(xivopeners_blm.getOpener()) do
        if (action == nil) then
            xivopeners.log("WARNING: Action at index " .. tostring(key) .. " in opener " .. tostring(xivopeners_blm.openerInfo.currentOpenerIndex) .. " is nil. Possible typo?")
        end

    end
end

function xivopeners_blm.openerAvailable()
    -- check cooldowns
    for _, action in pairs(xivopeners_blm.getOpener()) do
        if (action == xivopeners_blm.openerAbilities.Tincture) then
            local tincture = xivopeners_blm.getTincture()
            if (tincture and xivopeners_blm.useTincture and  tincture:GetAction().cd >= 1.5) then
                return false
            end
        elseif (action == xivopeners_blm.openerAbilities.SharpCast) then
            if (action.cd >= 1.5 and not HasBuff(Player.id, xivopeners_blm.openerAbilities.SharpCastBuffID)) then
                return false
            end
        elseif (action.cd >= 1.5) then
            return false
        end
    end
    return true
end


function xivopeners_blm.queueOpener()
    -- the only time this gets called is when the main script is toggled, so we can do more than just queue the opener
    -- empty queue first
    xivopeners_blm.abilityQueue = {}
    for _, action in pairs(xivopeners_blm.getOpener()) do
        xivopeners_blm.enqueue(action)
    end
    --    xivopeners.log("queue:")
    --    for _, v in pairs(xivopeners_blm.abilityQueue) do
    --        xivopeners.log(v.name)
    --    end
    xivopeners_blm.lastCastFromQueue = nil
    xivopeners_blm.openerStarted = false
    if (xivopeners_blm.useTincture and not xivopeners_blm.getTincture()) then
        xivopeners_blm.useTincture = false
    end
end

function xivopeners_blm.updateLastCast()
    if (xivopeners_blm.lastCastFromQueue) then
        xivopeners.log(tostring(xivopeners_blm.lastcastid) .. ", " .. tostring(xivopeners_blm.lastcastid2) .. ", " .. tostring(Player.castinginfo.lastcastid) .. ", " .. tostring(Player.castinginfo.castingid))
        if (xivopeners_blm.lastcastid == -1) then
            -- compare the real castid and see if it changed, if it did, update from -1
            if (xivopeners_blm.lastcastid2 ~= Player.castinginfo.castingid) then
                xivopeners.log("cast changed")
                xivopeners_blm.lastcastid = Player.castinginfo.castingid
                xivopeners_blm.lastcastid2 = Player.castinginfo.castingid
            end
        elseif (xivopeners_blm.lastcastid ~= Player.castinginfo.castingid) then
            xivopeners_blm.lastcastid = Player.castinginfo.castingid
            xivopeners_blm.lastcastid2 = Player.castinginfo.castingid
        end
    end
end

function xivopeners_blm.drawCall(event, tickcount)
    GUI:AlignFirstTextHeightToWidgets()
    GUI:BeginGroup()
    GUI:Text("Use Tincture")
    GUI:NextColumn()
    xivopeners_blm.useTincture = GUI:Checkbox("##xivopeners_blm_tincturecheck", xivopeners_blm.useTincture)
    GUI:EndGroup()
    GUI:NextColumn()
end

function xivopeners_blm.main(event, tickcount)
    if (Player.level >= xivopeners_blm.supportedLevel) then
        local target = Player:GetTarget()

        if (not target or not target.attackable) then return end

        if (not xivopeners_blm.openerAvailable() and not xivopeners_blm.openerStarted) then return end -- don't start opener if it's not available, if it's already started then yolo

        if (xivopeners_blm.openerStarted and next(xivopeners_blm.abilityQueue) == nil) then
            -- opener is finished, pass control to ACR
            xivopeners.log("Finished openers, handing control to ACR")
            xivopeners_blm.openerStarted = false
            if (xivopeners.running) then xivopeners.ToggleRun() end
            if (not FFXIV_Common_BotRunning) then
                ml_global_information.ToggleRun()
            end
            return
        end

        xivopeners_blm.updateLastCast()

        if (ActionList:IsCasting()) then return end

        if (not xivopeners_blm.openerStarted) then
            -- technically, even if you use an ability from prepull, it should still work, since the next time this loop runs it'll jump to the elseif
            xivopeners.log("Starting opener")
            xivopeners_blm.openerStarted = true
            xivopeners_blm.useNextAction(target)
        elseif (xivopeners_blm.lastCastFromQueue and xivopeners_blm.lastcastid == xivopeners_blm.lastCastFromQueue.id) then
            xivopeners_blm.lastcastid = -1
            xivopeners_blm.dequeue()
            xivopeners_blm.useNextAction(target)
        else
            xivopeners_blm.useNextAction(target)
        end

    end
end

function xivopeners_blm.enqueue(action)
    -- implementation of the queue can be changed later
    table.insert(xivopeners_blm.abilityQueue, action)
end

function xivopeners_blm.dequeue()
    xivopeners.log("Dequeing " .. xivopeners_blm.abilityQueue[1].name)
    table.remove(xivopeners_blm.abilityQueue, 1)
end

function xivopeners_blm.useNextAction(target)
    -- do the actual opener
    -- the current implementation uses a queue system
    if (target and target.attackable and xivopeners_blm.abilityQueue[1]) then
        -- tincture check
        if (xivopeners_blm.abilityQueue[1] == xivopeners_blm.openerAbilities.Tincture) then
            local tincture = xivopeners_blm.getTincture()
            if (HasBuff(Player.id, xivopeners_blm.openerAbilities.MedicineBuffID) or not xivopeners_blm.useTincture or not tincture) then
                xivopeners.log("Tincture already used during opener, not enabled, or not available, dequeueing")
                xivopeners_blm.dequeue()
                return
            end

            if (tincture) then
                xivopeners.log("Casting tincture")
                tincture:Cast()
                xivopeners_blm.lastCastFromQueue = tincture:GetAction()
            end
            -- don't want to continue past this point or we risk breaking shit
            return
        end

        -- check for prepull sharpcast
        if (xivopeners_blm.abilityQueue[1] == xivopeners_blm.openerAbilities.SharpCast and HasBuff(Player.id, xivopeners_blm.openerAbilities.SharpCastBuffID)) then
            xivopeners.log("Player already used sharpcast prepull, continue with opener")
            xivopeners_blm.dequeue()
            return
        end

        -- leylines can't be casted on the target, so cast on self
        if (xivopeners_blm.abilityQueue[1] == xivopeners_blm.openerAbilities.LeyLines) then
            xivopeners_blm.abilityQueue[1]:Cast(Player.id)
            xivopeners_blm.lastCastFromQueue = xivopeners_blm.abilityQueue[1]
            return
        end

        -- idk how to make it not spam console
        --xivopeners.log("Casting " .. xivopeners_blm.abilityQueue[1].name)
        xivopeners_blm.abilityQueue[1]:Cast(target.id)
        xivopeners_blm.lastCastFromQueue = xivopeners_blm.abilityQueue[1]
    end
end