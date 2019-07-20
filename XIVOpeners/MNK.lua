-- mnk http://owo.sh/AgEymx7.png

xivopeners_mnk = {}

xivopeners_mnk.supportedLevel = 80
xivopeners_mnk.openerAbilities = {
    Sprint = ActionList:Get(1, 3),
    Demolish = ActionList:Get(1, 66),
    Anatman = ActionList:Get(1, 16475), -- for on tick
    DragonKick = ActionList:Get(1, 74),
    Bootshine = ActionList:Get(1, 53),
    TrueStrike = ActionList:Get(1, 54),
    SnapPunch = ActionList:Get(1, 56),
    TwinSnakes = ActionList:Get(1, 61),
    RiddleofFire = ActionList:Get(1, 7395),
    Brotherhood = ActionList:Get(1, 7396),
    ForbiddenChakra = ActionList:Get(1, 3547),
    ShoulderTackle = ActionList:Get(1, 71),
    PerfectBalance = ActionList:Get(1, 69),
    ElixirField = ActionList:Get(1, 3545),
    FistsOfWind = ActionList:Get(1, 73),
    TrueNorth = ActionList:Get(1, 7546),
    Tincture = {name = "Tincture", id = 27786},
    MedicineBuffID = 49,
}

xivopeners_mnk.openerInfo = {
    listOpeners = {"anatman", "normal"},
    currentOpenerIndex = 1
}

xivopeners_mnk.openers = {
    anatman = {
        xivopeners_mnk.openerAbilities.Sprint,
        xivopeners_mnk.openerAbilities.Demolish, -- back
        xivopeners_mnk.openerAbilities.Anatman,
        xivopeners_mnk.openerAbilities.Tincture,
        xivopeners_mnk.openerAbilities.TrueNorth,
        xivopeners_mnk.openerAbilities.DragonKick, -- flank
        xivopeners_mnk.openerAbilities.TwinSnakes, -- flank
        xivopeners_mnk.openerAbilities.RiddleofFire,
        xivopeners_mnk.openerAbilities.SnapPunch, -- flank
        xivopeners_mnk.openerAbilities.Brotherhood,
        xivopeners_mnk.openerAbilities.ForbiddenChakra,
        xivopeners_mnk.openerAbilities.Bootshine, -- back
        xivopeners_mnk.openerAbilities.ShoulderTackle,
        xivopeners_mnk.openerAbilities.PerfectBalance,
        xivopeners_mnk.openerAbilities.TrueNorth,
        xivopeners_mnk.openerAbilities.DragonKick, -- flank
        xivopeners_mnk.openerAbilities.ElixirField,
        xivopeners_mnk.openerAbilities.Bootshine, -- back
        xivopeners_mnk.openerAbilities.ShoulderTackle,
        xivopeners_mnk.openerAbilities.FistsOfWind,
        xivopeners_mnk.openerAbilities.Demolish, -- back
        xivopeners_mnk.openerAbilities.TwinSnakes, -- flank
        xivopeners_mnk.openerAbilities.DragonKick, -- flank
        xivopeners_mnk.openerAbilities.Bootshine, -- back
        xivopeners_mnk.openerAbilities.TrueStrike, -- back
        xivopeners_mnk.openerAbilities.SnapPunch -- flank
    },
    normal = {
        xivopeners_mnk.openerAbilities.Demolish,
        xivopeners_mnk.openerAbilities.DragonKick,
        xivopeners_mnk.openerAbilities.TwinSnakes,
        xivopeners_mnk.openerAbilities.RiddleofFire,
        xivopeners_mnk.openerAbilities.SnapPunch,
        xivopeners_mnk.openerAbilities.Brotherhood,
        xivopeners_mnk.openerAbilities.ForbiddenChakra,
        xivopeners_mnk.openerAbilities.Bootshine,
        xivopeners_mnk.openerAbilities.ShoulderTackle,
        xivopeners_mnk.openerAbilities.PerfectBalance,
        xivopeners_mnk.openerAbilities.DragonKick,
        xivopeners_mnk.openerAbilities.ElixirField,
        xivopeners_mnk.openerAbilities.Bootshine,
        xivopeners_mnk.openerAbilities.ShoulderTackle,
        xivopeners_mnk.openerAbilities.FistsOfWind,
        xivopeners_mnk.openerAbilities.Demolish,
        xivopeners_mnk.openerAbilities.TwinSnakes,
        xivopeners_mnk.openerAbilities.DragonKick,
        xivopeners_mnk.openerAbilities.Bootshine,
        xivopeners_mnk.openerAbilities.TrueStrike,
        xivopeners_mnk.openerAbilities.SnapPunch
    }
}

xivopeners_mnk.abilityQueue = {}
xivopeners_mnk.lastCastFromQueue = nil -- might need this for some more complex openers with conditions
xivopeners_mnk.openerStarted = false
xivopeners_mnk.useTincture = false
xivopeners_mnk.lastcastid = 0
xivopeners_mnk.lastcastid2 = 0

function xivopeners_mnk.getTincture()
    local tincture = Inventory:Get(0):Get(xivopeners_mnk.openerAbilities.Tincture.id)
    return tincture
end

function xivopeners_mnk.getOpener()
    local opener
    if (xivopeners_mnk.openerInfo.currentOpenerIndex == 1) then
        opener = xivopeners_mnk.openers.anatman
    else
        opener = xivopeners_mnk.openers.normal
    end
    return opener
end

function xivopeners_mnk.checkOpenerIds()
    for key, action in pairs(xivopeners_mnk.getOpener()) do
        if (action == nil) then
            xivopeners.log("WARNING: Action at index " .. tostring(key) .. " was nil! The id is likely incorrect.")
        end
    end
end

function xivopeners_mnk.openerAvailable()
    -- check cooldowns
    for _, action in pairs(xivopeners_mnk.getOpener()) do
        if (action == xivopeners_mnk.openerAbilities.Tincture) then
            local tincture = xivopeners_mnk.getTincture()
            if (tincture and xivopeners_mnk.useTincture and tincture:GetAction().cd >= 1.5) then
                return false
            end
        elseif (action.cd >= 1.5) then
            return false
        end
    end
    return true
end

function xivopeners_mnk.queueOpener()
    -- the only time this gets called is when the main script is toggled, so we can do more than just queue the opener
    -- empty queue first
    xivopeners_mnk.abilityQueue = {}
    for _, action in pairs(xivopeners_mnk.getOpener()) do
        xivopeners_mnk.enqueue(action)
    end
    --    xivopeners.log("queue:")
    --    for _, v in pairs(xivopeners_mnk.abilityQueue) do
    --        xivopeners.log(v.name)
    --    end
    xivopeners_mnk.lastCastFromQueue = nil
    xivopeners_mnk.openerStarted = false
end

function xivopeners_mnk.updateLastCast()
    --    xivopeners.log(tostring(xivopeners_mnk.lastcastid) .. ", " .. tostring(xivopeners_mnk.lastcastid2) .. ", " .. tostring(Player.castinginfo.lastcastid))
    if (xivopeners_mnk.lastCastFromQueue) then
        if (xivopeners_mnk.lastcastid == -1) then
            -- compare the real castid and see if it changed, if it did, update from -1
            if (xivopeners_mnk.lastcastid2 ~= Player.castinginfo.castingid and xivopeners_mnk.lastCastFromQueue.cd > 0) then
                xivopeners.log("cast changed")
                xivopeners_mnk.lastcastid = Player.castinginfo.castingid
                xivopeners_mnk.lastcastid2 = Player.castinginfo.castingid
            end
        elseif (xivopeners_mnk.lastcastid ~= Player.castinginfo.castingid and xivopeners_mnk.lastCastFromQueue.cd > 0) then
            xivopeners_mnk.lastcastid = Player.castinginfo.castingid
            xivopeners_mnk.lastcastid2 = Player.castinginfo.castingid
        end
    end
end

function xivopeners_mnk.drawCall(event, tickcount)
    GUI:BeginGroup()
    GUI:Text("Use Tincture")
    GUI:NextColumn()
    xivopeners_mnk.useTincture = GUI:Checkbox("##xivopeners_mnk_tincturecheck", xivopeners_mnk.useTincture)
    GUI:EndGroup()
    GUI:NextColumn()
end

function xivopeners_mnk.main(event, tickcount)
    if (Player.level >= xivopeners_mnk.supportedLevel) then
        if (xivopeners_mnk.useTincture and not xivopeners_mnk.getTincture()) then
            -- if we don't have a tincture but the toggle is on, turn it off
            xivopeners_mnk.useTincture = false
        end

        local target = Player:GetTarget()
        if (not target) then
            return
        end

        if (not xivopeners_mnk.openerAvailable() and not xivopeners_mnk.openerStarted) then
            return
        end -- don't start opener if it's not available, if it's already started then yolo

        if (xivopeners_mnk.openerStarted and next(xivopeners_mnk.abilityQueue) == nil) then
            -- opener is finished, pass control to ACR
            xivopeners.log("Finished openers, handing control to ACR")
            xivopeners_mnk.openerStarted = false
            if (xivopeners.running) then
                xivopeners.ToggleRun()
            end
            if (not FFXIV_Common_BotRunning) then
                ml_global_information.ToggleRun()
            end
            return
        end

        if (ActionList:IsCasting()) then
            return
        end

        if (not xivopeners_mnk.openerStarted) then
            -- technically, even if you use an ability from prepull, it should still work, since the next time this loop runs it'll jump to the elseif
            xivopeners.log("Starting opener")
            xivopeners_mnk.openerStarted = true
            xivopeners_mnk.useNextAction(target)
        elseif (xivopeners_mnk.lastCastFromQueue and Player.castinginfo.lastcastid == xivopeners_mnk.lastCastFromQueue.id) then
            if (xivopeners_mnk.lastCastFromQueue == xivopeners_mnk.openerAbilities.Anatman) then
                if Player.gauge[1] < 2 then
                    return
                end
            end
            xivopeners_mnk.lastcastid = -1
            xivopeners_mnk.dequeue()
            xivopeners_mnk.useNextAction(target)
        else
            xivopeners_mnk.useNextAction(target)
        end
    end
end

function xivopeners_mnk.enqueue(action)
    -- implementation of the queue can be changed later
    table.insert(xivopeners_mnk.abilityQueue, action)
end

function xivopeners_mnk.dequeue()
    table.remove(xivopeners_mnk.abilityQueue, 1)
end

function xivopeners_mnk.useNextAction(target)
    -- do the actual opener
    -- the current implementation uses a queue system
    if (target and target.attackable and xivopeners_mnk.abilityQueue[1]) then
        local tincture = xivopeners_mnk.getTincture()
        if (HasBuff(Player.id, xivopeners_mnk.openerAbilities.MedicineBuffID) or not xivopeners_mnk.useTincture or not tincture) then
            xivopeners.log("Tincture already used during opener, not enabled, or not available, dequeueing")
            xivopeners_mnk.dequeue()
            return
        end
        -- idk how to make it not spam console
        --xivopeners.log("Casting " .. xivopeners_mnk.abilityQueue[1].name)
        xivopeners_mnk.abilityQueue[1]:Cast(target.id)
        xivopeners_mnk.lastCastFromQueue = xivopeners_mnk.abilityQueue[1]
    end
end
