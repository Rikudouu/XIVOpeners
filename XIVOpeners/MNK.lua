-- mnk http://owo.sh/AgEymx7.png (normal) {added back laster}
-- https://docs.google.com/document/d/1BinBE0blUjt3z96MW5bbTA2_Pwgl9ET4UYJTaR6nMv8/edit# (optimal)
-- http://ffxivrotations.com/26pj (six sided start)
-- todo: need to figure out how to dequeue Anatman without it breaking

xivopeners_mnk = {}

xivopeners_mnk.supportedLevel = 80
xivopeners_mnk.openerAbilities = {
    Anatman = ActionList:Get(1, 16475),
    Bootshine = ActionList:Get(1, 53),
    Brotherhood = ActionList:Get(1, 7396),
    Demolish = ActionList:Get(1, 66),
    DragonKick = ActionList:Get(1, 74),
    ElixirField = ActionList:Get(1, 3545),
    FistsOfFire = ActionList:Get(1, 63),
    FistsOfWind = ActionList:Get(1, 73),
    FormShift = ActionList:Get(1, 4262),
    ForbiddenChakra = ActionList:Get(1, 3547),
    PerfectBalance = ActionList:Get(1, 69),
    Meditation = ActionList:Get(1, 3546),
    RiddleofFire = ActionList:Get(1, 7395),
    ShoulderTackle = ActionList:Get(1, 71),
    SixSidedStar = ActionList:Get(1, 16476),
    SnapPunch = ActionList:Get(1, 56),
    TrueNorth = ActionList:Get(1, 7546),
    TrueStrike = ActionList:Get(1, 54),
    TornadoKick = ActionList:Get(1, 3543),
    TwinSnakes = ActionList:Get(1, 61),
    Sprint = ActionList:Get(1, 3),
    Tincture = {name = "Tincture", id = 27786},
    MedicineBuffID = 49,
    AnatmanBuffID = 1862,
    FistsOfFireBuffID = 103,
    CoerlFormID = 109
}

xivopeners_mnk.rearPos = {
    xivopeners_mnk.openerAbilities.Bootshine,
    xivopeners_mnk.openerAbilities.TrueStrike,
    xivopeners_mnk.openerAbilities.Demolish
}

xivopeners_mnk.flankPos = {
    xivopeners_mnk.openerAbilities.SnapPunch,
    xivopeners_mnk.openerAbilities.TwinSnakes,
    xivopeners_mnk.openerAbilities.DragonKick
}

xivopeners_mnk.openerInfo = {
    listOpeners = {"optimal", "six sided star"},
    currentOpenerIndex = 1
}

xivopeners_mnk.openers = {
    optimal = {
        xivopeners_mnk.openerAbilities.ShoulderTackle,
        xivopeners_mnk.openerAbilities.Demolish, -- back
       -- xivopeners_mnk.openerAbilities.Anatman,
        xivopeners_mnk.openerAbilities.TrueNorth,
        xivopeners_mnk.openerAbilities.DragonKick, -- flank
        --   xivopeners_mnk.openerAbilities.Tincture,
        xivopeners_mnk.openerAbilities.TwinSnakes, -- flank
        xivopeners_mnk.openerAbilities.RiddleofFire,
        xivopeners_mnk.openerAbilities.SnapPunch, -- flank
        xivopeners_mnk.openerAbilities.Brotherhood,
        xivopeners_mnk.openerAbilities.ForbiddenChakra,
        xivopeners_mnk.openerAbilities.Bootshine, -- back
        xivopeners_mnk.openerAbilities.ElixirField,
        xivopeners_mnk.openerAbilities.PerfectBalance,
        xivopeners_mnk.openerAbilities.DragonKick, -- flank
        xivopeners_mnk.openerAbilities.ShoulderTackle,
        xivopeners_mnk.openerAbilities.Bootshine, -- back
        xivopeners_mnk.openerAbilities.FistsOfWind,
        xivopeners_mnk.openerAbilities.Demolish, -- back
        xivopeners_mnk.openerAbilities.TwinSnakes, -- flank
        xivopeners_mnk.openerAbilities.DragonKick, -- flank
        xivopeners_mnk.openerAbilities.Bootshine, -- back
        xivopeners_mnk.openerAbilities.TrueStrike, -- back
        xivopeners_mnk.openerAbilities.SnapPunch, -- flank
        xivopeners_mnk.openerAbilities.ShoulderTackle,
        xivopeners_mnk.openerAbilities.DragonKick, -- flank
        xivopeners_mnk.openerAbilities.TwinSnakes, -- flank
        xivopeners_mnk.openerAbilities.Demolish -- back
    },
    -- http://ffxivrotations.com/26pj
    sixSidedStar = {
        xivopeners_mnk.openerAbilities.TrueNorth,
        xivopeners_mnk.openerAbilities.ShoulderTackle,
        xivopeners_mnk.openerAbilities.Demolish,
        xivopeners_mnk.openerAbilities.ElixirField,
        xivopeners_mnk.openerAbilities.SixSidedStar,
       -- xivopeners_mnk.openerAbilities.Anatman,
        xivopeners_mnk.openerAbilities.DragonKick,
        xivopeners_mnk.openerAbilities.TwinSnakes,
        xivopeners_mnk.openerAbilities.SnapPunch,
        xivopeners_mnk.openerAbilities.Tincture,
        xivopeners_mnk.openerAbilities.SixSidedStar,
        xivopeners_mnk.openerAbilities.RiddleofFire,
        xivopeners_mnk.openerAbilities.Brotherhood,
        xivopeners_mnk.openerAbilities.ForbiddenChakra,
        xivopeners_mnk.openerAbilities.Bootshine,
        xivopeners_mnk.openerAbilities.ShoulderTackle,
        xivopeners_mnk.openerAbilities.TrueStrike,
        xivopeners_mnk.openerAbilities.Demolish,
        xivopeners_mnk.openerAbilities.DragonKick,
        xivopeners_mnk.openerAbilities.TwinSnakes,
        xivopeners_mnk.openerAbilities.ShoulderTackle,
        xivopeners_mnk.openerAbilities.SixSidedStar,
        xivopeners_mnk.openerAbilities.ElixirField,
        xivopeners_mnk.openerAbilities.TornadoKick,
        xivopeners_mnk.openerAbilities.SnapPunch,
        xivopeners_mnk.openerAbilities.PerfectBalance,
        xivopeners_mnk.openerAbilities.SnapPunch,
        xivopeners_mnk.openerAbilities.SnapPunch,
        xivopeners_mnk.openerAbilities.TrueStrike,
        xivopeners_mnk.openerAbilities.TwinSnakes,
        xivopeners_mnk.openerAbilities.FistsOfWind,
        xivopeners_mnk.openerAbilities.Demolish,
        xivopeners_mnk.openerAbilities.Bootshine
    }
}

xivopeners_mnk.abilityQueue = {}
xivopeners_mnk.lastCastFromQueue = nil -- might need this for some more complex openers with conditions
xivopeners_mnk.openerStarted = false
xivopeners_mnk.prepullSetup = true
xivopeners_mnk.useTincture = false
xivopeners_mnk.lastcastid = 0
xivopeners_mnk.lastcastid2 = 0
xivopeners_mnk.count = 0
xivopeners_mnk.rear = "rear"
xivopeners_mnk.flank = "flank"
xivopeners_mnk.nextPos = "any"
xivopeners_mnk.redColor = {r = 255, g = 0, b = 0, a = .75}
xivopeners_mnk.greenColor = {r = 0, g = .70, b = .70, a = .75}
xivopeners_mnk.anatmanActive = false

function xivopeners_mnk.getTincture()
    for i = 0, 3 do
        local tincture = Inventory:Get(i):Get(xivopeners_mnk.openerAbilities.Tincture.id)
        if (tincture) then
            return tincture
        end
    end
    return nil
end

function xivopeners_mnk.getOpener()
    local opener
    if (xivopeners_mnk.openerInfo.currentOpenerIndex == 1) then
        opener = xivopeners_mnk.openers.optimal
    else
        opener = xivopeners_mnk.openers.sixSidedStar
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

    if (xivopeners_mnk.useTincture and not xivopeners_mnk.getTincture()) then
        -- if we don't have a tincture but the toggle is on, turn it off
        xivopeners_mnk.useTincture = false
    end
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

       -- xivopeners.log("prefull" .. tostring(xivopeners_mnk.openerStarted) .. tostring(xivopeners_mnk.prepullSetup) .. tostring(HasBuff(Player.id, xivopeners_mnk.openerAbilities.FistsOfFireBuffID)))
        -- prepull check before targing the boss
        if (xivopeners.running and not xivopeners_mnk.openerStarted and xivopeners_mnk.prepullSetup) then
            if (not HasBuff(Player.id, xivopeners_mnk.openerAbilities.FistsOfFireBuffID)) then
             --    xivopeners.log("FistsOfFireBuffID")
                xivopeners_mnk.openerAbilities.FistsOfFire:Cast()
           end

            if (Player.gauge[2] < 5) then
             --   xivopeners.log("Meditation")
                xivopeners_mnk.openerAbilities.Meditation:Cast()
            end

           -- xivopeners.log("buff not :: " ..tostring(HasBuff(Player.id, xivopeners_mnk.openerAbilities.CoerlFormID)))
            if (not HasBuff(Player.id, xivopeners_mnk.openerAbilities.CoerlFormID)) then
             --   xivopeners.log("CoerlFormID")
                xivopeners_mnk.openerAbilities.FormShift:Cast()
            end
        end

        local target = Player:GetTarget()
        if (not target) then
            -- hopefully this handles resets correctly
            xivopeners_mnk.prepullSetup = true
            return
        end

        -- once the target has been established turn off prepull
        xivopeners_mnk.prepullSetup = false

        -- don't start opener if it's not available
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

        xivopeners_mnk.updateLastCast()

        if (ActionList:IsCasting()) then
            return
        end

        if (not xivopeners_mnk.openerStarted) then
            -- technically, even if you use an ability from prepull, it should still work, since the next time this loop runs it'll jump to the elseif
            xivopeners.log("Starting opener")
            xivopeners_mnk.openerStarted = true
            xivopeners_mnk.useNextAction(target)
        elseif (xivopeners_mnk.lastCastFromQueue and xivopeners_mnk.lastcastid == xivopeners_mnk.lastCastFromQueue.id) then
            if (xivopeners_mnk.lastCastFromQueue == xivopeners_mnk.openerAbilities.Anatman) then
                if Player.gauge[1] < 2 then
                    xivopeners_mnk.useNextAction(target)
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

function xivopeners_mnk.has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function xivopeners_mnk.useNextAction(target)

xivopeners.log("Player.gauge[1] :: " ..tostring(Player.gauge[1]))

    if(HasBuff(Player.id, xivopeners_mnk.openerAbilities.AnatmanBuffID) and Player.gauge[1] > 1) then


        xivopeners.log("returned Player.gauge[1] :: " ..tostring(Player.gauge[1]))
        xivopeners_mnk.dequeue()
        return
    end

    -- do the actual opener
    -- the current implementation uses a queue system
    if (target and target.attackable and xivopeners_mnk.abilityQueue[1]) then
        if (xivopeners_mnk.abilityQueue[1] == xivopeners_mnk.openerAbilities.Tincture) then
            local tincture = xivopeners_mnk.getTincture()
            if (HasBuff(Player.id, xivopeners_mnk.openerAbilities.MedicineBuffID) or not xivopeners_mnk.useTincture or not tincture) then
                xivopeners.log("Tincture already used during opener, not enabled, or not available, dequeueing")
                xivopeners_mnk.dequeue()
                return
            end

            if (tincture) then
                xivopeners.log("Casting tincture")
                tincture:Cast()
                xivopeners_mnk.lastCastFromQueue = tincture:GetAction()
            end
            -- don't want to continue past this point or we risk breaking shit
            return
        end



        if xivopeners_mnk.has_value(xivopeners_mnk.rearPos, xivopeners_mnk.abilityQueue[1]) then
         --   xivopeners.log("rear")
            xivopeners_mnk.nextPos = xivopeners_mnk.rear
        elseif xivopeners_mnk.has_value(xivopeners_mnk.flankPos, xivopeners_mnk.abilityQueue[1]) then
           -- xivopeners.log("flank")
            xivopeners_mnk.nextPos = xivopeners_mnk.flank
        else
           -- xivopeners.log("any")
           --  xivopeners_mnk.nextPos = "any"
        end

        -- idk how to make it not spam console
        xivopeners.log("Casting " .. xivopeners_mnk.abilityQueue[1].name)
        xivopeners_mnk.abilityQueue[1]:Cast(target.id)

       -- xivopeners.log("lastCastFromQueue set")
        xivopeners_mnk.lastCastFromQueue = xivopeners_mnk.abilityQueue[1]
    end
end

function xivopeners_mnk.drawPosWindow(event, tickcount)
    -- only show the positional window when the opener is actually running.
    if (Player.job == xivopeners.jobs.Monk and xivopeners.running) then

        local target = Player:GetTarget()

        GUI:SetNextWindowSize(85, 30, GUI.SetCond_Always)
        local flags = (GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoResize + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoCollapse)
        GUI:Begin("xivopeners_mnk_poswindow", false, flags)

        local childColor = xivopeners_mnk.redColor
        if xivopeners_mnk.nextPos == xivopeners_mnk.rear and IsBehind(target) then
            -- xivopeners.log("rear-green")
            childColor = xivopeners_mnk.greenColor
        end

        if xivopeners_mnk.nextPos == xivopeners_mnk.flank and IsFlanking(target) then
            -- xivopeners.log("flank--green")
            childColor = xivopeners_mnk.greenColor
        end

        GUI:PushStyleColor(GUI.Col_ChildWindowBg, childColor.r, childColor.g, childColor.b, childColor.a)

        GUI:BeginChild("##xivopeners_mnk_poswindowdisplay", 85, 30, true)
       -- GUI:AlignFirstTextHeightToWidgets()
        GUI:Indent(GUI:Text(xivopeners_mnk.nextPos))
        GUI:EndChild()


        GUI:PopStyleColor()

        GUI:End()
    end
end

RegisterEventHandler("Gameloop.Draw", xivopeners_mnk.drawPosWindow, "xivopeners_mnk.drawPosWindow")
