-- basically monk but 10000x easier b/c meditate until next gcd omegalul
-- SAM https://i.imgur.com/8Unt2nH.png
-- Midare 1st opener

xivopeners_sam = {}

xivopeners_sam.supportedLevel = 80
xivopeners_sam.openerAbilities = {
    Hakaze = ActionList:Get(1, 7477),
    Jinpu = ActionList:Get(1, 7478),
    Shifu = ActionList:Get(1, 7479),
    Yukikaze = ActionList:Get(1, 7480),
    Gekko = ActionList:Get(1, 7481),
    Kasha = ActionList:Get(1, 7482),
    MidareSetsugekka = ActionList:Get(1,7487),
    Higanbana = ActionList:Get(1, 7489),
    Shinten = ActionList:Get(1, 7490),
    Kaiten = ActionList:Get(1, 7494),
    Meditate = ActionList:Get(1, 7497),
    Meikyo = ActionList:Get(1, 7499),
    Senei = ActionList:Get(1, 16481),
    Ikishoten = ActionList:Get(1, 16482),
    KaeshiSetsugekka = ActionList:Get(1, 16486),
    Shoha = ActionList:Get(1, 16487),
    Tincture = {name = "Tincture", ids = {31893, 29492, 27995, 27786}, range = 0},
    MedicineBuffID = 49
}

xivopeners_sam.openerInfo = {
    listOpeners = {"Midare 1st", "Midare 1st Alt", "Higanbana 1st", "Higanbana 1st Alt"}
}

xivopeners_sam.openers = {
    midare1st = {
        xivopeners_sam.openerAbilities.Hakaze,
        xivopeners_sam.openerAbilities.Ikishoten,
        xivopeners_sam.openerAbilities.Shifu,
        xivopeners_sam.openerAbilities.Kasha, -- flank
        xivopeners_sam.openerAbilities.Hakaze,
        xivopeners_sam.openerAbilities.Tincture,
        xivopeners_sam.openerAbilities.Jinpu,
        xivopeners_sam.openerAbilities.Gekko, -- back
        xivopeners_sam.openerAbilities.Meikyo,
        xivopeners_sam.openerAbilities.Senei,
        xivopeners_sam.openerAbilities.Yukikaze,
        xivopeners_sam.openerAbilities.Shinten,
        xivopeners_sam.openerAbilities.Kaiten,
        xivopeners_sam.openerAbilities.MidareSetsugekka,
        xivopeners_sam.openerAbilities.KaeshiSetsugekka,
        xivopeners_sam.openerAbilities.Gekko, -- back
        xivopeners_sam.openerAbilities.Kaiten,
        xivopeners_sam.openerAbilities.Higanbana,
        xivopeners_sam.openerAbilities.Shoha,
        xivopeners_sam.openerAbilities.Gekko, -- back
    },

    midare1stAlt = {
        xivopeners_sam.openerAbilities.Hakaze,
        xivopeners_sam.openerAbilities.Ikishoten,
        xivopeners_sam.openerAbilities.Shifu,
        xivopeners_sam.openerAbilities.Kasha, -- flank
        xivopeners_sam.openerAbilities.Hakaze,
        xivopeners_sam.openerAbilities.Tincture,
        xivopeners_sam.openerAbilities.Jinpu,
        xivopeners_sam.openerAbilities.Gekko, -- back
        xivopeners_sam.openerAbilities.Senei,
        xivopeners_sam.openerAbilities.Hakaze,
        xivopeners_sam.openerAbilities.Shinten,
        xivopeners_sam.openerAbilities.Yukikaze,
        xivopeners_sam.openerAbilities.Kaiten,
        xivopeners_sam.openerAbilities.MidareSetsugekka,
        xivopeners_sam.openerAbilities.KaeshiSetsugekka,
        xivopeners_sam.openerAbilities.Meikyo,
        xivopeners_sam.openerAbilities.Gekko, -- back
        xivopeners_sam.openerAbilities.Kaiten,
        xivopeners_sam.openerAbilities.Higanbana,
        xivopeners_sam.openerAbilities.Shoha,
        xivopeners_sam.openerAbilities.Gekko, -- back
        xivopeners_sam.openerAbilities.Kasha, -- flank
    },

    higanbana1st = {
        xivopeners_sam.openerAbilities.Hakaze,
        xivopeners_sam.openerAbilities.Ikishoten,
        xivopeners_sam.openerAbilities.Shifu,
        xivopeners_sam.openerAbilities.Kasha, -- flank
        xivopeners_sam.openerAbilities.Hakaze,
        xivopeners_sam.openerAbilities.Tincture,
        xivopeners_sam.openerAbilities.Jinpu,
        xivopeners_sam.openerAbilities.Kaiten,
        xivopeners_sam.openerAbilities.Higanbana,
        xivopeners_sam.openerAbilities.Senei,
        xivopeners_sam.openerAbilities.Gekko, -- back
        xivopeners_sam.openerAbilities.Meikyo,
        xivopeners_sam.openerAbilities.Kasha, -- flank
        xivopeners_sam.openerAbilities.Shinten,
        xivopeners_sam.openerAbilities.Yukikaze,
        xivopeners_sam.openerAbilities.Kaiten,
        xivopeners_sam.openerAbilities.MidareSetsugekka,
        xivopeners_sam.openerAbilities.KaeshiSetsugekka,
        xivopeners_sam.openerAbilities.Shoha,
        xivopeners_sam.openerAbilities.Gekko, -- back
    },

    higanbana1stAlt = {
        xivopeners_sam.openerAbilities.Hakaze,
        xivopeners_sam.openerAbilities.Ikishoten,
        xivopeners_sam.openerAbilities.Shifu,
        xivopeners_sam.openerAbilities.Kasha, -- flank
        xivopeners_sam.openerAbilities.Hakaze,
        xivopeners_sam.openerAbilities.Tincture,
        xivopeners_sam.openerAbilities.Jinpu,
        xivopeners_sam.openerAbilities.Gekko, -- back
        xivopeners_sam.openerAbilities.Senei,
        xivopeners_sam.openerAbilities.Hakaze,
        xivopeners_sam.openerAbilities.Shinten,
        xivopeners_sam.openerAbilities.Yukikaze,
        xivopeners_sam.openerAbilities.Kaiten,
        xivopeners_sam.openerAbilities.MidareSetsugekka,
        xivopeners_sam.openerAbilities.KaeshiSetsugekka,
        xivopeners_sam.openerAbilities.Meikyo,
        xivopeners_sam.openerAbilities.Gekko, -- back
        xivopeners_sam.openerAbilities.Kaiten,
        xivopeners_sam.openerAbilities.Higanbana,
        xivopeners_sam.openerAbilities.Shoha,
        xivopeners_sam.openerAbilities.Gekko, -- back
        xivopeners_sam.openerAbilities.Kasha, -- flank
    }
}

xivopeners_sam.abilityQueue = {}
xivopeners_sam.lastCastFromQueue = nil -- might need this for some more complex openers with conditions
xivopeners_sam.openerStarted = false
xivopeners_sam.lastcastid = 0
xivopeners_sam.lastcastid2 = 0

function xivopeners_sam.getTincture()
    if TensorCore.API[gACRSelectedProfiles[Player.job]] ~= nil then
        local pot = TensorCore.API[gACRSelectedProfiles[Player.job]].getPotion()
        if pot ~= nil and pot:isReady() then
            return pot
        end

        return nil
    end

    for i = 0, 3 do
        for _, id in ipairs(xivopeners_sam.openerAbilities.Tincture.ids) do
            local tincture = Inventory:Get(i):Get(id)
            if (tincture and tincture:GetAction().cdmax - tincture:GetAction().cd < 1.5) then return tincture end
        end
    end
    return nil
end

function xivopeners_sam.getOpener()
    local opener
    if (xivopeners.settings[Player.job].currentOpenerIndex == 1) then
        opener = xivopeners_sam.openers.midare1st
    elseif (xivopeners.settings[Player.job].currentOpenerIndex == 2) then
        opener = xivopeners_sam.openers.midare1stAlt
    elseif (xivopeners.settings[Player.job].currentOpenerIndex == 3) then
        opener = xivopeners_sam.openers.higanbana1st
    elseif (xivopeners.settings[Player.job].currentOpenerIndex == 4) then
        opener = xivopeners_sam.openers.higanbana1stAlt
    else
        opener = {}
    end
    return opener
end

function xivopeners_sam.checkOpenerIds()
    for key, action in pairs(xivopeners_sam.getOpener()) do
        if (action == nil) then
            xivopeners.log("WARNING: Action at index " .. tostring(key) .. " was nil! The id is likely incorrect.")
        end
    end
end

function xivopeners_sam.openerAvailable()
    -- check cooldowns
    for _, action in pairs(xivopeners_sam.getOpener()) do
        if (action == xivopeners_sam.openerAbilities.Tincture) then
            local tincture = xivopeners_sam.getTincture()
            if (tincture and xivopeners.settings[Player.job].useTincture and tincture:GetAction().cd >= 1.5 and not HasBuff(Player.id, xivopeners_sam.openerAbilities.MedicineBuffID)) then
                return false
            end
        elseif (action.cd >= 1.5) then
            return false
        end
    end
    return true
end

function xivopeners_sam.queueOpener()
    -- the only time this gets called is when the main script is toggled, so we can do more than just queue the opener
    -- empty queue first
    xivopeners_sam.abilityQueue = {}
    for _, action in pairs(xivopeners_sam.getOpener()) do
        xivopeners_sam.enqueue(action)
    end
    --    xivopeners.log("queue:")
    --    for _, v in pairs(xivopeners_sam.abilityQueue) do
    --        xivopeners.log(v.name)
    --    end
    xivopeners_sam.lastCastFromQueue = nil
    xivopeners_sam.openerStarted = false

    -- if (xivopeners.settings[Player.job].useTincture and not xivopeners_sam.getTincture()) then
    --     -- if we don't have a tincture but the toggle is on, turn it off
    --     xivopeners.settings[Player.job].useTincture = false
    -- end
end

function xivopeners_sam.updateLastCast()
    --    xivopeners.log(tostring(xivopeners_sam.lastcastid) .. ", " .. tostring(xivopeners_sam.lastcastid2) .. ", " .. tostring(Player.castinginfo.lastcastid))
    if (xivopeners_sam.lastCastFromQueue) then
        if (xivopeners_sam.lastcastid == -1) then
            -- compare the real castid and see if it changed, if it did, update from -1
            if (xivopeners_sam.lastcastid2 ~= Player.castinginfo.castingid and xivopeners_sam.lastCastFromQueue.cd > 0) then
                xivopeners.log("cast changed")
                xivopeners_sam.lastcastid = Player.castinginfo.castingid
                xivopeners_sam.lastcastid2 = Player.castinginfo.castingid
            end
        elseif (xivopeners_sam.lastcastid ~= Player.castinginfo.castingid and xivopeners_sam.lastCastFromQueue.cd > 0) then
            xivopeners_sam.lastcastid = Player.castinginfo.castingid
            xivopeners_sam.lastcastid2 = Player.castinginfo.castingid
        end
    end
end

function xivopeners_sam.drawCall(event, tickcount)
    GUI:AlignFirstTextHeightToWidgets()
    GUI:BeginGroup()
    GUI:Text("Use Tincture")
    GUI:NextColumn()
    xivopeners.settings[Player.job].useTincture = GUI:Checkbox("##xivopeners_sam_tincturecheck", xivopeners.settings[Player.job].useTincture)
    GUI:EndGroup()
    GUI:NextColumn()
end

function xivopeners_sam.main(event, tickcount)
    if (Player.level >= xivopeners_sam.supportedLevel) then
        local target = Player:GetTarget()
        if (not target) then
            return
        end

        if ((not xivopeners_sam.openerAvailable() or not target.attackable) and not xivopeners_sam.openerStarted) then
            return
        end -- don't start opener if it's not available, if it's already started then yolo

        if (xivopeners_sam.openerStarted and next(xivopeners_sam.abilityQueue) == nil) then
            -- opener is finished, pass control to ACR
            xivopeners.log("Finished openers, handing control to ACR")
            xivopeners_sam.openerStarted = false
            if (xivopeners.running) then
                xivopeners.ToggleRun()
            end
            if (not FFXIV_Common_BotRunning) then
                ml_global_information.ToggleRun()
            end
            return
        end

        xivopeners_sam.updateLastCast()

        if (ActionList:IsCasting()) then return end

        if (not xivopeners_sam.openerStarted) then
            -- technically, even if you use an ability from prepull, it should still work, since the next time this loop runs it'll jump to the elseif
            xivopeners.log("Starting opener")
            xivopeners_sam.openerStarted = true
            xivopeners_sam.useNextAction(target)
        elseif (xivopeners_sam.lastCastFromQueue and xivopeners_sam.lastcastid == xivopeners_sam.lastCastFromQueue.id) then
            xivopeners_sam.lastcastid = -1
            xivopeners_sam.dequeue()
            xivopeners_sam.useNextAction(target)
        else
            xivopeners_sam.useNextAction(target)
        end
    end
end

function xivopeners_sam.enqueue(action)
    -- implementation of the queue can be changed later
    table.insert(xivopeners_sam.abilityQueue, action)
end

function xivopeners_sam.dequeue()
    xivopeners.log("Dequeing " .. xivopeners_sam.abilityQueue[1].name)
    table.remove(xivopeners_sam.abilityQueue, 1)
end

function xivopeners_sam.useNextAction(target)
    -- do the actual opener
    -- the current implementation uses a queue system
    if (target and target.attackable and xivopeners_sam.abilityQueue[1] and (xivopeners_sam.abilityQueue[1].range <= 0 or target.distance2d <= xivopeners_sam.abilityQueue[1].range)) then
        if (xivopeners_sam.abilityQueue[1] == xivopeners_sam.openerAbilities.Tincture) then
            local tincture = xivopeners_sam.getTincture()
            if (HasBuff(Player.id, xivopeners_sam.openerAbilities.MedicineBuffID) or not xivopeners.settings[Player.job].useTincture or not tincture) then
                xivopeners.log("Tincture already used during opener, not enabled, or not available, dequeueing")
                xivopeners_sam.dequeue()
                return
            end

            if (tincture) then
                xivopeners.log("Casting tincture")
                tincture:Cast()
                xivopeners_sam.lastCastFromQueue = tincture:GetAction()
            end
            -- don't want to continue past this point or we risk breaking shit
            return
        end

        -- idk how to make it not spam console
        --xivopeners.log("Casting " .. xivopeners_sam.abilityQueue[1].name)
        xivopeners_sam.abilityQueue[1]:Cast(target.id)
        xivopeners_sam.lastCastFromQueue = xivopeners_sam.abilityQueue[1]
    end
end
