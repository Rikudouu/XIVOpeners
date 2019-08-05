xivopeners_nin = {}

xivopeners_nin.supportedLevel = 50
xivopeners_nin.openerAbilities = {
    Ten = ActionList:Get(1, 2259),
    Jin = ActionList:Get(1, 2263),
    Chi = ActionList:Get(1, 2261),
    Huton = ActionList:Get(1, 2269), -- the id changes depending on which ninjutsu you use
    FumaShuriken = ActionList:Get(1, 2265),
    Raiton = ActionList:Get(1, 2267),
    Suiton = ActionList:Get(1, 2271),
    Doton = ActionList:Get(1, 2270),
    HyoshoRanryu = ActionList:Get(1, 16492),
    Katon = ActionList:Get(1, 2266),
    SpinningEdge = ActionList:Get(1, 2240),
    GustSlash = ActionList:Get(1, 2242),
    Assassinate = ActionList:Get(1, 2246),
    Mug = ActionList:Get(1, 2248),
    AeolianEdge = ActionList:Get(1, 2255),
    ShadowFang = ActionList:Get(1, 2257),
    TrickAttack = ActionList:Get(1, 2258),
    Kassatsu = ActionList:Get(1, 2264),
    ArmorCrush = ActionList:Get(1, 3563),
    DreamWithinADream = ActionList:Get(1, 3566),
    Bhavacakra = ActionList:Get(1, 7402),
    TenChiJin = ActionList:Get(1, 7403),
    Bunshin = ActionList:Get(1, 16493),
    Hide = ActionList:Get(1, 2245),
    Meisui = ActionList:Get(1, 16489),
    Tincture = {name = "Tincture", id = 27786},
    MedicineBuffID = 49,
}

xivopeners_nin.openerInfo = {
    listOpeners = {"Doton", "Raiton"},
    currentOpenerIndex = 1,
}

xivopeners_nin.openers = {
    doton = {
        xivopeners_nin.openerAbilities.Jin,
        xivopeners_nin.openerAbilities.Chi,
        xivopeners_nin.openerAbilities.Ten,
        xivopeners_nin.openerAbilities.Huton,
        xivopeners_nin.openerAbilities.Hide,
        xivopeners_nin.openerAbilities.Ten,
        xivopeners_nin.openerAbilities.Chi,
        xivopeners_nin.openerAbilities.Jin,
        xivopeners_nin.openerAbilities.Suiton,
        xivopeners_nin.openerAbilities.SpinningEdge,
        xivopeners_nin.openerAbilities.Tincture,
        xivopeners_nin.openerAbilities.ShadowFang,
        xivopeners_nin.openerAbilities.TenChiJin,
        xivopeners_nin.openerAbilities.Jin,
        xivopeners_nin.openerAbilities.FumaShuriken,
        xivopeners_nin.openerAbilities.Ten,
        xivopeners_nin.openerAbilities.Katon,
        xivopeners_nin.openerAbilities.Chi,
        xivopeners_nin.openerAbilities.Doton,
        xivopeners_nin.openerAbilities.SpinningEdge,
        xivopeners_nin.openerAbilities.TrickAttack,
        xivopeners_nin.openerAbilities.Kassatsu,
        xivopeners_nin.openerAbilities.GustSlash,
        xivopeners_nin.openerAbilities.Chi,
        xivopeners_nin.openerAbilities.Jin,
        xivopeners_nin.openerAbilities.HyoshoRanryu,
        xivopeners_nin.openerAbilities.AeolianEdge,
        xivopeners_nin.openerAbilities.DreamWithinADream,
        xivopeners_nin.openerAbilities.Kassatsu,
        xivopeners_nin.openerAbilities.SpinningEdge,
        xivopeners_nin.openerAbilities.Mug,
        xivopeners_nin.openerAbilities.Assassinate,
        xivopeners_nin.openerAbilities.GustSlash,
        xivopeners_nin.openerAbilities.Chi,
        xivopeners_nin.openerAbilities.Jin,
        xivopeners_nin.openerAbilities.HyoshoRanryu,
        xivopeners_nin.openerAbilities.AeolianEdge,
        xivopeners_nin.openerAbilities.Bunshin,
        xivopeners_nin.openerAbilities.SpinningEdge,
        xivopeners_nin.openerAbilities.ShadowFang,
    },

    raiton = {
        xivopeners_nin.openerAbilities.Jin,
        xivopeners_nin.openerAbilities.Chi,
        xivopeners_nin.openerAbilities.Ten,
        xivopeners_nin.openerAbilities.Huton,
        xivopeners_nin.openerAbilities.Hide,
        xivopeners_nin.openerAbilities.Tincture,
        xivopeners_nin.openerAbilities.Ten,
        xivopeners_nin.openerAbilities.Chi,
        xivopeners_nin.openerAbilities.Jin,
        xivopeners_nin.openerAbilities.Suiton,
        xivopeners_nin.openerAbilities.SpinningEdge,
        xivopeners_nin.openerAbilities.Mug,
        xivopeners_nin.openerAbilities.Meisui,
        xivopeners_nin.openerAbilities.ShadowFang,
        xivopeners_nin.openerAbilities.TenChiJin,
        xivopeners_nin.openerAbilities.Ten,
        xivopeners_nin.openerAbilities.FumaShuriken,
        xivopeners_nin.openerAbilities.Chi,
        xivopeners_nin.openerAbilities.Raiton,
        xivopeners_nin.openerAbilities.Jin,
        xivopeners_nin.openerAbilities.Suiton,
        xivopeners_nin.openerAbilities.SpinningEdge,
        xivopeners_nin.openerAbilities.TrickAttack,
        xivopeners_nin.openerAbilities.Bunshin,
        xivopeners_nin.openerAbilities.GustSlash,
        xivopeners_nin.openerAbilities.DreamWithinADream,
        xivopeners_nin.openerAbilities.Kassatsu,
        xivopeners_nin.openerAbilities.AeolianEdge,
        xivopeners_nin.openerAbilities.Chi,
        xivopeners_nin.openerAbilities.Jin,
        xivopeners_nin.openerAbilities.HyoshoRanryu,
        xivopeners_nin.openerAbilities.SpinningEdge,
        xivopeners_nin.openerAbilities.Kassatsu,
        xivopeners_nin.openerAbilities.Assassinate,
        xivopeners_nin.openerAbilities.GustSlash,
        xivopeners_nin.openerAbilities.Chi,
        xivopeners_nin.openerAbilities.Jin,
        xivopeners_nin.openerAbilities.HyoshoRanryu,
        xivopeners_nin.openerAbilities.AeolianEdge,
        xivopeners_nin.openerAbilities.Bhavacakra,
        xivopeners_nin.openerAbilities.SpinningEdge,
        xivopeners_nin.openerAbilities.ShadowFang,
    }
}

xivopeners_nin.abilityQueue = {}
xivopeners_nin.lastCastFromQueue = nil -- might need this for some more complex openers with conditions
xivopeners_nin.openerStarted = false
xivopeners_nin.useTincture = false
xivopeners_nin.lastcastid = 0
xivopeners_nin.lastcastid2 = 0

function xivopeners_nin.getTincture()
    for i = 0, 3 do
        local tincture = Inventory:Get(i):Get(xivopeners_nin.openerAbilities.Tincture.id)
        if (tincture) then return tincture end
    end
    return nil
end


function xivopeners_nin.getOpener()
    if (xivopeners_nin.openerInfo.currentOpenerIndex == 1) then
        return xivopeners_nin.openers.doton
    elseif (xivopeners_nin.openerInfo.currentOpenerIndex == 2) then
        return xivopeners_nin.openers.raiton
    else
        return {}
    end
end

function xivopeners_nin.checkOpenerIds()
    for key, action in pairs(xivopeners_nin.getOpener()) do
        if (action == nil) then
            xivopeners.log("WARNING: Action at index " .. tostring(key) .. " was nil! The id is likely incorrect.")
        end
    end
end

function xivopeners_nin.openerAvailable()
    -- check cooldowns
    for _, action in pairs(xivopeners_nin.getOpener()) do
        if (action == xivopeners_nin.openerAbilities.Tincture) then
            local tincture = xivopeners_nin.getTincture()
            if (tincture and xivopeners_nin.useTincture and tincture:GetAction().cd >= 1.5 and not HasBuff(Player.id, xivopeners_nin.openerAbilities.MedicineBuffID)) then
                return false
            end
        elseif (action.cd >= 1.5) then
            return false
        end
    end
    return true
end


function xivopeners_nin.queueOpener()
    -- the only time this gets called is when the main script is toggled, so we can do more than just queue the opener
    -- empty queue first
    xivopeners_nin.abilityQueue = {}
    for _, action in pairs(xivopeners_nin.getOpener()) do
        xivopeners_nin.enqueue(action)
    end
    --    xivopeners.log("queue:")
    --    for _, v in pairs(xivopeners_nin.abilityQueue) do
    --        xivopeners.log(v.name)
    --    end
    xivopeners_nin.lastCastFromQueue = nil
    xivopeners_nin.openerStarted = false
    if (xivopeners_nin.useTincture and not xivopeners_nin.getTincture()) then
        xivopeners_nin.useTincture = false
    end
end

function xivopeners_nin.updateLastCast()
--    xivopeners.log(tostring(xivopeners_nin.lastcastid) .. ", " .. tostring(xivopeners_nin.lastcastid2) .. ", " .. tostring(Player.castinginfo.lastcastid) .. "," .. tostring(Player.castinginfo.castingid))
    if (xivopeners_nin.lastCastFromQueue) then
        if (xivopeners_nin.lastcastid == -1) then
            -- compare the real castid and see if it changed, if it did, update from -1
            if (xivopeners_nin.lastcastid2 ~= Player.castinginfo.castingid) then
                xivopeners.log("cast changed")
                xivopeners_nin.lastcastid = Player.castinginfo.castingid
                xivopeners_nin.lastcastid2 = Player.castinginfo.castingid
            end
        elseif (xivopeners_nin.lastcastid ~= Player.castinginfo.castingid) then
            xivopeners_nin.lastcastid = Player.castinginfo.castingid
            xivopeners_nin.lastcastid2 = Player.castinginfo.castingid
        end
    end
end

function xivopeners_nin.drawCall(event, tickcount)
    GUI:AlignFirstTextHeightToWidgets()
    GUI:BeginGroup()
    GUI:Text("Use Tincture")
    GUI:NextColumn()
    xivopeners_nin.useTincture = GUI:Checkbox("##xivopeners_nin_tincturecheck", xivopeners_nin.useTincture)
    GUI:EndGroup()
    GUI:NextColumn()
end

function xivopeners_nin.main(event, tickcount)
    if (Player.level >= xivopeners_nin.supportedLevel) then
        local target = Player:GetTarget()

        if (not target) then return end

        if (not xivopeners_nin.openerAvailable() and not xivopeners_nin.openerStarted) then return end -- don't start opener if it's not available, if it's already started then yolo

        if (xivopeners_nin.openerStarted and next(xivopeners_nin.abilityQueue) == nil) then
            -- opener is finished, pass control to ACR
            xivopeners.log("Finished openers, handing control to ACR")
            xivopeners_nin.openerStarted = false
            if (xivopeners.running) then xivopeners.ToggleRun() end
            if (not FFXIV_Common_BotRunning) then
                ml_global_information.ToggleRun()
            end
            return
        end

        xivopeners_nin.updateLastCast()

        if (not xivopeners_nin.openerStarted) then
            -- technically, even if you use an ability from prepull, it should still work, since the next time this loop runs it'll jump to the elseif
            xivopeners.log("Starting opener")
            xivopeners_nin.openerStarted = true
            xivopeners_nin.useNextAction(target)
        elseif (xivopeners_nin.lastCastFromQueue and xivopeners_nin.lastcastid == xivopeners_nin.lastCastFromQueue.id) then
            xivopeners_nin.lastcastid = -1
            xivopeners_nin.dequeue()
            xivopeners_nin.useNextAction(target)
        else
            xivopeners_nin.useNextAction(target)
        end

    end
end

function xivopeners_nin.enqueue(action)
    -- implementation of the queue can be changed later
    table.insert(xivopeners_nin.abilityQueue, action)
end

function xivopeners_nin.dequeue()
    xivopeners.log("Dequeing " .. xivopeners_nin.abilityQueue[1].name)
    table.remove(xivopeners_nin.abilityQueue, 1)
end

function xivopeners_nin.useNextAction(target)
    -- do the actual opener
    -- the current implementation uses a queue system
    if (target and target.attackable and xivopeners_nin.abilityQueue[1]) then
        -- tincture check
        if (xivopeners_nin.abilityQueue[1] == xivopeners_nin.openerAbilities.Tincture) then
            local tincture = xivopeners_nin.getTincture()
            if (HasBuff(Player.id, xivopeners_nin.openerAbilities.MedicineBuffID) or not xivopeners_nin.useTincture or not tincture) then
                xivopeners.log("Tincture already used during opener, not enabled, or not available, dequeueing")
                xivopeners_nin.dequeue()
                return
            end

            if (tincture) then
                xivopeners.log("Casting tincture")
                tincture:Cast()
                xivopeners_nin.lastCastFromQueue = tincture:GetAction()
            end
            -- don't want to continue past this point or we risk breaking shit
            return
        end

        if (IsMudraSkill(xivopeners_nin.abilityQueue[1].id)) then
            if (Player.castinginfo.timesincecast >= 150) then
                xivopeners_nin.abilityQueue[1]:Cast(target.id)
                xivopeners_nin.lastCastFromQueue = xivopeners_nin.abilityQueue[1]
            else
                xivopeners.log("Waiting for mudra delay")
            end
            return
        end


        -- idk how to make it not spam console
--        xivopeners.log("Casting " .. xivopeners_nin.abilityQueue[1].name)
        xivopeners_nin.abilityQueue[1]:Cast(target.id)
        xivopeners_nin.lastCastFromQueue = xivopeners_nin.abilityQueue[1]
    end
end