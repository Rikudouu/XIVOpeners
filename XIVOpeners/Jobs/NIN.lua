xivopeners_nin = {}

xivopeners_nin.supportedLevel = 56
xivopeners_nin.openerAbilities = {
    -- first id for mudra has to be the old id, after that it is the new ids
    Ten = ActionList:Get(1, 2259),
    Jin = ActionList:Get(1, 2263),
    Chi = ActionList:Get(1, 2261),
    Ten2 = ActionList:Get(1, 18805),
    Jin2 = ActionList:Get(1, 18807),
    Chi2 = ActionList:Get(1, 18806),
    Huton = ActionList:Get(1, 2269),
    FumaShuriken = ActionList:Get(1, 2265),
    FumaShuriken2 = ActionList:Get(1, 18873),
    Raiton = ActionList:Get(1, 2267), -- mudra
    Raiton2 = ActionList:Get(1, 18877), -- tcj
    Suiton = ActionList:Get(1, 2271), -- mudra
    Suiton2 = ActionList:Get(1, 18881), -- tcj
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
    TrueNorth = ActionList:Get(1, 7546),
    Kassatsu = ActionList:Get(1, 2264),
    ArmorCrush = ActionList:Get(1, 3563),
    DreamWithinADream = ActionList:Get(1, 3566),
    Bhavacakra = ActionList:Get(1, 7402),
    TenChiJin = ActionList:Get(1, 7403),
    Bunshin = ActionList:Get(1, 16493),
    Hide = ActionList:Get(1, 2245),
    Meisui = ActionList:Get(1, 16489),
    Tincture = {name = "Tincture", ids = {27996, 27787}, range = 0},
    MedicineBuffID = 49,
    AssassinateReadyID = 1955,
    
}

xivopeners_nin.openerInfo = {
    listOpeners = {"standard", "no doton"}
}

xivopeners_nin.openers = {
    standard = {
        xivopeners_nin.openerAbilities.Ten,
        xivopeners_nin.openerAbilities.Chi2,
        xivopeners_nin.openerAbilities.Jin2,
        xivopeners_nin.openerAbilities.Suiton,
        xivopeners_nin.openerAbilities.Kassatsu,
        xivopeners_nin.openerAbilities.SpinningEdge,
        xivopeners_nin.openerAbilities.Tincture,
        xivopeners_nin.openerAbilities.GustSlash,
        xivopeners_nin.openerAbilities.Mug,
        xivopeners_nin.openerAbilities.Bunshin,
        xivopeners_nin.openerAbilities.AeolianEdge,
        xivopeners_nin.openerAbilities.SpinningEdge,
        xivopeners_nin.openerAbilities.TrueNorth,
        xivopeners_nin.openerAbilities.TrickAttack,
        xivopeners_nin.openerAbilities.ShadowFang,
        xivopeners_nin.openerAbilities.DreamWithinADream,
        xivopeners_nin.openerAbilities.Ten2,
        xivopeners_nin.openerAbilities.Jin2,
        xivopeners_nin.openerAbilities.HyoshoRanryu,
        xivopeners_nin.openerAbilities.Assassinate,
        xivopeners_nin.openerAbilities.Ten,
        xivopeners_nin.openerAbilities.Chi2,
        xivopeners_nin.openerAbilities.Raiton,
        xivopeners_nin.openerAbilities.TenChiJin,
        xivopeners_nin.openerAbilities.FumaShuriken2,
        xivopeners_nin.openerAbilities.Raiton2,
        xivopeners_nin.openerAbilities.Suiton2,
        xivopeners_nin.openerAbilities.Meisui,
        xivopeners_nin.openerAbilities.GustSlash,
        xivopeners_nin.openerAbilities.Bhavacakra,
        xivopeners_nin.openerAbilities.AeolianEdge,
        xivopeners_nin.openerAbilities.Bhavacakra,
        xivopeners_nin.openerAbilities.Ten,
        xivopeners_nin.openerAbilities.Chi2,
        xivopeners_nin.openerAbilities.Raiton,
    },

    standard_no_doton = {
        xivopeners_nin.openerAbilities.Ten,
        xivopeners_nin.openerAbilities.Chi2,
        xivopeners_nin.openerAbilities.Jin2,
        xivopeners_nin.openerAbilities.Suiton,
        xivopeners_nin.openerAbilities.Kassatsu,
        xivopeners_nin.openerAbilities.SpinningEdge,
        xivopeners_nin.openerAbilities.Tincture,
        xivopeners_nin.openerAbilities.GustSlash,
        xivopeners_nin.openerAbilities.Mug,
        xivopeners_nin.openerAbilities.Bunshin,
        xivopeners_nin.openerAbilities.AeolianEdge,
        xivopeners_nin.openerAbilities.SpinningEdge,
        xivopeners_nin.openerAbilities.TrueNorth,
        xivopeners_nin.openerAbilities.TrickAttack,
        xivopeners_nin.openerAbilities.ShadowFang,
        xivopeners_nin.openerAbilities.DreamWithinADream,
        xivopeners_nin.openerAbilities.Ten2,
        xivopeners_nin.openerAbilities.Jin2,
        xivopeners_nin.openerAbilities.HyoshoRanryu,
        xivopeners_nin.openerAbilities.Assassinate,
        xivopeners_nin.openerAbilities.Ten,
        xivopeners_nin.openerAbilities.Chi2,
        xivopeners_nin.openerAbilities.Raiton,
        xivopeners_nin.openerAbilities.TenChiJin,
        xivopeners_nin.openerAbilities.FumaShuriken2,
        xivopeners_nin.openerAbilities.Raiton2,
        xivopeners_nin.openerAbilities.Suiton2,
        xivopeners_nin.openerAbilities.Meisui,
        xivopeners_nin.openerAbilities.GustSlash,
        xivopeners_nin.openerAbilities.Bhavacakra,
        xivopeners_nin.openerAbilities.AeolianEdge,
        xivopeners_nin.openerAbilities.Bhavacakra,
        xivopeners_nin.openerAbilities.Ten,
        xivopeners_nin.openerAbilities.Chi2,
        xivopeners_nin.openerAbilities.Raiton,
    },

    prepull = {
        xivopeners_nin.openerAbilities.Jin,
        xivopeners_nin.openerAbilities.Chi2,
        xivopeners_nin.openerAbilities.Ten2,
        xivopeners_nin.openerAbilities.Huton,
        xivopeners_nin.openerAbilities.Jin,
        xivopeners_nin.openerAbilities.Ten2,
        xivopeners_nin.openerAbilities.Chi2,
        xivopeners_nin.openerAbilities.Doton,
        xivopeners_nin.openerAbilities.Hide,
    },

    prepull_no_doton = {
        xivopeners_nin.openerAbilities.Jin,
        xivopeners_nin.openerAbilities.Chi2,
        xivopeners_nin.openerAbilities.Ten2,
        xivopeners_nin.openerAbilities.Huton,
        xivopeners_nin.openerAbilities.Hide,
    }
}

xivopeners_nin.abilityQueue = {}
xivopeners_nin.lastCastFromQueue = nil -- might need this for some more complex openers with conditions
xivopeners_nin.openerStarted = false
xivopeners_nin.lastcastid = 0
xivopeners_nin.lastcastid2 = 0

xivopeners_nin.prepullSetup = false

function xivopeners_nin.getTincture()
    for i = 0, 3 do
        for _, id in pairs(xivopeners_nin.openerAbilities.Tincture.ids) do
            local tincture = Inventory:Get(i):Get(id)
            if (tincture) then return tincture end
        end
    end
    return nil
end


function xivopeners_nin.getOpener()
    if (xivopeners.settings[Player.job].currentOpenerIndex == 1) then
        return xivopeners_nin.openers.standard
    end

    if (xivopeners.settings[Player.job].currentOpenerIndex == 2) then
        return xivopeners_nin.openers.standard_no_doton
    end

    return xivopeners_nin.openers.standard
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
            if (tincture and xivopeners.settings[Player.job].useTincture and tincture:GetAction().cd >= 1.5 and not HasBuff(Player.id, xivopeners_nin.openerAbilities.MedicineBuffID)) then
                return false
            end
        -- these happen later in the fight, cooldown does not need to be as strict
        elseif (action == xivopeners_nin.openerAbilities.Bunshin and xivopeners_nin.openerAbilities.Bunshin.cd < 10) then
            return true
        elseif (action == xivopeners_nin.openerAbilities.DreamWithinADream and xivopeners_nin.openerAbilities.DreamWithinADream.cd < 10) then
            return true
        elseif (action == xivopeners_nin.openerAbilities.Assassinate and xivopeners_nin.openerAbilities.Assassinate.cd < 10) then
            return true
        elseif (action == xivopeners_nin.openerAbilities.Kassatsu and xivopeners_nin.openerAbilities.Kassatsu.cd < 10) then
            return true
        elseif (action == xivopeners_nin.openerAbilities.Mug and xivopeners_nin.openerAbilities.Mug.cd < 3) then
            return true
        elseif (action == xivopeners_nin.openerAbilities.Ten and xivopeners_nin.openerAbilities.Ten.cd >= 20) then
            return true
        elseif (action == xivopeners_nin.openerAbilities.Chi and xivopeners_nin.openerAbilities.Chi.cd >= 20) then
            return true
        elseif (action == xivopeners_nin.openerAbilities.Jin and xivopeners_nin.openerAbilities.Jin.cd >= 20) then
            return true
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

    if (xivopeners.settings[Player.job].useTincture and not xivopeners_nin.getTincture()) then
        xivopeners.settings[Player.job].useTincture = false
    end

    -- enable this if you want to force opener to set to legacy controls
    -- Player:SetMoveMode(1)
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
    xivopeners.settings[Player.job].useTincture = GUI:Checkbox("##xivopeners_nin_tincturecheck", xivopeners.settings[Player.job].useTincture)
    GUI:EndGroup()
    GUI:NextColumn()
end

function xivopeners_nin.main(event, tickcount)
    if (Player.level >= xivopeners_nin.supportedLevel) then
        if (xivopeners.running and not xivopeners_nin.openerStarted and xivopeners_nin.prepullSetup) then
            if (Player.gauge[2] < 30000) then
                xivopeners_nin.abilityQueue = {}
                local prepull
                if (xivopeners.settings[Player.job].currentOpenerIndex == 1) then
                    prepull = xivopeners_nin.openers.prepull
                elseif (xivopeners.settings[Player.job].currentOpenerIndex == 2) then
                    prepull = xivopeners_nin.openers.prepull_no_doton
                end -- can add more prepull openers if needed in the future
                
                for _, action in pairs(prepull) do
                    xivopeners_nin.enqueue(action)
                end
                xivopeners.log("Starting prepull huton")
                xivopeners_nin.openerStarted = true
                xivopeners_nin.useNextAction(Player)
            else
                xivopeners_nin.prepullSetup = false
            end
        end

        local target = Player:GetTarget() or Player

        if ((not Player:GetTarget() or not target.attackable) and not xivopeners_nin.prepullSetup) then
            xivopeners_nin.prepullSetup = true
            return
        end

        if (not xivopeners_nin.openerAvailable() and not xivopeners_nin.openerStarted) then return end -- don't start opener if it's not available, if it's already started then yolo

        if (xivopeners_nin.openerStarted and next(xivopeners_nin.abilityQueue) == nil) then
            -- check for prepull
            if (xivopeners_nin.prepullSetup) then
                xivopeners.log("Casted prepull huton")
                xivopeners_nin.openerStarted = false
                xivopeners_nin.prepullSetup = false
                xivopeners_nin.queueOpener()
                return
            end
            -- opener is finished, pass control to ACR
            SendTextCommand("/e done <se.6>")
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
            -- due to in out mechanics Ninki Gauge Cost might not be 80 yet, if so skip instead of breaking opener
        elseif (xivopeners_nin.lastCastFromQueue == xivopeners_nin.openerAbilities.Bhavacakra and  Player.gauge[1] < 80) then
            xivopeners_nin.lastcastid = -1
            xivopeners_nin.dequeue()
            xivopeners_nin.useNextAction(target)
            -- due to in out mechanics Ninki Gauge Cost might not be 80 yet, if so skip instead of breaking opener
        elseif (xivopeners_nin.lastCastFromQueue == xivopeners_nin.openerAbilities.Bunshin and  (Player.gauge[1] < 80 or xivopeners_nin.openerAbilities.Bunshin.cd > 0)) then
            xivopeners_nin.lastcastid = -1
            xivopeners_nin.dequeue()
            xivopeners_nin.useNextAction(target)
            -- due to mechanics Assassinate Ready could expire, skip instead of breaking opener
        elseif (xivopeners_nin.lastCastFromQueue == xivopeners_nin.openerAbilities.Assassinate and not HasBuff(Player.id, xivopeners_nin.openerAbilities.AssassinateReadyID)) then
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
    if (xivopeners_nin.abilityQueue[1] and ((xivopeners_nin.abilityQueue[1].range <= 0 or not target) or target.distance2d <= xivopeners_nin.abilityQueue[1].range)) then
        -- tincture check
        if (xivopeners_nin.abilityQueue[1] == xivopeners_nin.openerAbilities.Tincture) then
            local tincture = xivopeners_nin.getTincture()
            if (HasBuff(Player.id, xivopeners_nin.openerAbilities.MedicineBuffID) or not xivopeners.settings[Player.job].useTincture or not tincture) then
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

       -- idk how to make it not spam console
       -- xivopeners.log("Casting " .. xivopeners_nin.abilityQueue[1].name)
        xivopeners_nin.abilityQueue[1]:Cast(target.id)
       -- xivopeners.log("true")
        xivopeners_nin.lastCastFromQueue = xivopeners_nin.abilityQueue[1]
    end
end