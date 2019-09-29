xivopeners_pld = {}

xivopeners_pld.supportedLevel = 80
xivopeners_pld.openerAbilities = {
    HolySpirit = ActionList:Get(1, 7384),
    FastBlade = ActionList:Get(1, 9),
    RiotBlade= ActionList:Get(1, 15),
    GoringBlade= ActionList:Get(1, 3538),
    RoyalAuthority= ActionList:Get(1, 3539),
    Atonement= ActionList:Get(1, 16460),
    SpritWithin= ActionList:Get(1, 29),
    FightOrFlight= ActionList:Get(1, 20),
    CircleOfScorn= ActionList:Get(1, 23),
    Requiescat= ActionList:Get(1, 7383),
    HolyCircle= ActionList:Get(1, 16458),
    Intervene= ActionList:Get(1, 16461),
    Confiteor= ActionList:Get(1, 16459),
    Sprint = ActionList:Get(1, 3),
    Tincture = {name = "Tincture", ids = {27995, 27786}, range = 0},
    MedicineBuffID = 49,    
}

xivopeners_pld.openerInfo = {
    listOpeners = {"fof", "req"},
    currentOpenerIndex = 1
}

xivopeners_pld.openers = {
    fof = {
        xivopeners_pld.openerAbilities.HolySpirit,
        xivopeners_pld.openerAbilities.FastBlade,
        xivopeners_pld.openerAbilities.FightOrFlight,
        xivopeners_pld.openerAbilities.RiotBlade,        
        xivopeners_pld.openerAbilities.GoringBlade,
        xivopeners_pld.openerAbilities.FastBlade,
        xivopeners_pld.openerAbilities.Tincture,
        xivopeners_pld.openerAbilities.RiotBlade,
        xivopeners_pld.openerAbilities.CircleOfScorn,
        xivopeners_pld.openerAbilities.Intervene,
        xivopeners_pld.openerAbilities.RoyalAuthority,
        xivopeners_pld.openerAbilities.SpritWithin,
        xivopeners_pld.openerAbilities.Intervene,
        xivopeners_pld.openerAbilities.Atonement,
        xivopeners_pld.openerAbilities.Atonement,
        xivopeners_pld.openerAbilities.Atonement,
        xivopeners_pld.openerAbilities.FastBlade,
        xivopeners_pld.openerAbilities.RiotBlade,        
        xivopeners_pld.openerAbilities.GoringBlade,
        xivopeners_pld.openerAbilities.Requiescat,
        xivopeners_pld.openerAbilities.HolySpirit,
        xivopeners_pld.openerAbilities.HolySpirit,
        xivopeners_pld.openerAbilities.HolySpirit,
        xivopeners_pld.openerAbilities.CircleOfScorn,
        xivopeners_pld.openerAbilities.HolySpirit,
        xivopeners_pld.openerAbilities.Confiteor,
        xivopeners_pld.openerAbilities.FastBlade,
        xivopeners_pld.openerAbilities.SpritWithin,
        xivopeners_pld.openerAbilities.RiotBlade,        
        xivopeners_pld.openerAbilities.GoringBlade
    },
    req = {
        xivopeners_pld.openerAbilities.HolySpirit,
        xivopeners_pld.openerAbilities.FastBlade,
        xivopeners_pld.openerAbilities.RiotBlade, 
        xivopeners_pld.openerAbilities.Tincture,    
        xivopeners_pld.openerAbilities.GoringBlade,
        xivopeners_pld.openerAbilities.CircleOfScorn,
        xivopeners_pld.openerAbilities.Requiescat,
        xivopeners_pld.openerAbilities.HolySpirit,
        xivopeners_pld.openerAbilities.HolySpirit,
        xivopeners_pld.openerAbilities.Intervene,
        xivopeners_pld.openerAbilities.HolySpirit,
        xivopeners_pld.openerAbilities.SpritWithin,
        xivopeners_pld.openerAbilities.HolySpirit,
        xivopeners_pld.openerAbilities.Confiteor,
        xivopeners_pld.openerAbilities.FastBlade,
        xivopeners_pld.openerAbilities.FightOrFlight,
        xivopeners_pld.openerAbilities.RiotBlade,  
        xivopeners_pld.openerAbilities.Intervene,              
        xivopeners_pld.openerAbilities.GoringBlade,
        xivopeners_pld.openerAbilities.FastBlade,
        xivopeners_pld.openerAbilities.RiotBlade,
        xivopeners_pld.openerAbilities.CircleOfScorn,
        xivopeners_pld.openerAbilities.RoyalAuthority,
        xivopeners_pld.openerAbilities.Atonement,
        xivopeners_pld.openerAbilities.Atonement,
        xivopeners_pld.openerAbilities.Atonement,
        xivopeners_pld.openerAbilities.FastBlade,
        xivopeners_pld.openerAbilities.Intervene,
        xivopeners_pld.openerAbilities.RiotBlade,  
        xivopeners_pld.openerAbilities.SpritWithin,              
        xivopeners_pld.openerAbilities.GoringBlade
    }
}

xivopeners_pld.abilityQueue = {}
xivopeners_pld.lastCastFromQueue = nil -- might need this for some more complex openers with conditions
xivopeners_pld.openerStarted = false
xivopeners_pld.useTincture = false
xivopeners_pld.lastcastid = 0
xivopeners_pld.lastcastid2 = 0

function xivopeners_pld.getTincture()
    for i = 0, 3 do
        for _, id in pairs(xivopeners_pld.openerAbilities.Tincture.ids) do
            local tincture = Inventory:Get(i):Get(id)
            if (tincture) then return tincture end
        end
    end
    return nil
end

function xivopeners_pld.getOpener()
     local opener
     if (xivopeners_pld.openerInfo.currentOpenerIndex == 1) then
         opener = xivopeners_pld.openers.fof
     else
         opener = xivopeners_pld.openers.req
     end
     return opener
end

function xivopeners_pld.checkOpenerIds()
    for key, action in pairs(xivopeners_pld.getOpener()) do
        if (action == nil) then
            xivopeners.log("WARNING: Action at index " .. tostring(key) .. " was nil! The id is likely incorrect.")
        end
    end
end

function xivopeners_pld.openerAvailable()
    -- check cooldowns
    for _, action in pairs(xivopeners_pld.getOpener()) do
        if (action == xivopeners_pld.openerAbilities.Tincture) then
            local tincture = xivopeners_pld.getTincture()
            if (tincture and xivopeners_pld.useTincture and tincture:GetAction().cd >= 1.5 and not HasBuff(Player.id, xivopeners_pld.openerAbilities.MedicineBuffID)) then
                return false
            end
        elseif (action.cd >= 1.5) then
            return false
        end
    end
    return true
end

function xivopeners_pld.queueOpener()
    -- the only time this gets called is when the main script is toggled, so we can do more than just queue the opener
    -- empty queue first
    xivopeners_pld.abilityQueue = {}
    for _, action in pairs(xivopeners_pld.getOpener()) do
        xivopeners_pld.enqueue(action)
    end

    xivopeners_pld.lastCastFromQueue = nil
    xivopeners_pld.openerStarted = false

    if (xivopeners_pld.useTincture and not xivopeners_pld.getTincture()) then
        -- if we don't have a tincture but the toggle is on, turn it off
        xivopeners_pld.useTincture = false
    end
end

function xivopeners_pld.updateLastCast()
    if (xivopeners_pld.lastCastFromQueue) then
        if (xivopeners_pld.lastcastid == -1) then
            -- compare the real castid and see if it changed, if it did, update from -1
            if (xivopeners_pld.lastcastid2 ~= Player.castinginfo.castingid and xivopeners_pld.lastCastFromQueue.cd > 0) then
                xivopeners_pld.lastcastid = Player.castinginfo.castingid
                xivopeners_pld.lastcastid2 = Player.castinginfo.castingid
            end
        elseif (xivopeners_pld.lastcastid ~= Player.castinginfo.castingid and xivopeners_pld.lastCastFromQueue.cd > 0) then
            xivopeners_pld.lastcastid = Player.castinginfo.castingid
            xivopeners_pld.lastcastid2 = Player.castinginfo.castingid
        end
    end
end

function xivopeners_pld.drawCall(event, tickcount)
    GUI:AlignFirstTextHeightToWidgets()
    GUI:BeginGroup()
    GUI:Text("Use Tincture")
    GUI:NextColumn()
    xivopeners_pld.useTincture = GUI:Checkbox("##xivopeners_pld_tincturecheck", xivopeners_pld.useTincture)
    GUI:EndGroup()
    GUI:NextColumn()
end

function xivopeners_pld.main(event, tickcount)
    if (Player.level >= xivopeners_pld.supportedLevel) then
        local target = Player:GetTarget()
        if (not target or not target.attackable) then return end

        -- don't start opener if it's not available
        if (not xivopeners_pld.openerAvailable() and not xivopeners_pld.openerStarted) then
            return
        end -- don't start opener if it's not available, if it's already started then yolo

        if (xivopeners_pld.openerStarted and next(xivopeners_pld.abilityQueue) == nil) then
            -- opener is finished, pass control to ACR
            xivopeners.log("Finished openers, handing control to ACR")
            xivopeners_pld.openerStarted = false
            if (xivopeners.running) then
                xivopeners.ToggleRun()
            end
            if (not FFXIV_Common_BotRunning) then
                ml_global_information.ToggleRun()
            end
            return
        end

        xivopeners_pld.updateLastCast()


        if (not xivopeners_pld.openerStarted) then
            -- technically, even if you use an ability from prepull, it should still work, since the next time this loop runs it'll jump to the elseif
            xivopeners.log("Starting opener")
            xivopeners_pld.openerStarted = true
            xivopeners_pld.useNextAction(target)
        elseif (xivopeners_pld.lastCastFromQueue and xivopeners_pld.lastcastid == xivopeners_pld.lastCastFromQueue.id) then
            
            xivopeners_pld.lastcastid = -1
            xivopeners_pld.dequeue()
            xivopeners_pld.useNextAction(target)
        else
            xivopeners_pld.useNextAction(target)
        end
    end
end

function xivopeners_pld.enqueue(action)
    -- implementation of the queue can be changed later
    table.insert(xivopeners_pld.abilityQueue, action)
end

function xivopeners_pld.dequeue()
    xivopeners.log("Dequeing " .. xivopeners_pld.abilityQueue[1].name)
    table.remove(xivopeners_pld.abilityQueue, 1)
end

function xivopeners_pld.useNextAction(target)
    -- do the actual opener
    -- the current implementation uses a queue system
    if (target and target.attackable and xivopeners_pld.abilityQueue[1] and (xivopeners_pld.abilityQueue[1].range <= 0 or target.distance2d <= xivopeners_pld.abilityQueue[1].range)) then
        if (xivopeners_pld.abilityQueue[1] == xivopeners_pld.openerAbilities.Tincture) then
            local tincture = xivopeners_pld.getTincture()
            if (HasBuff(Player.id, xivopeners_pld.openerAbilities.MedicineBuffID) or not xivopeners_pld.useTincture or not tincture) then
                xivopeners.log("Tincture already used during opener, not enabled, or not available, dequeueing")
                xivopeners_pld.dequeue()
                return
            end

            if (tincture) then
                xivopeners.log("Casting tincture")
                tincture:Cast()
                xivopeners_pld.lastCastFromQueue = tincture:GetAction()
            end
            -- don't want to continue past this point or we risk breaking shit
            return
        end

        -- delay buff until end of gcd so we can get the highest amount of gcds inside the buff window
        if (xivopeners_pld.abilityQueue[1] == xivopeners_pld.openerAbilities.Requiescat or xivopeners_pld.abilityQueue[1] == xivopeners_pld.openerAbilities.FightOrFlight) then
            -- wait until there's 0.9s on the gcd
            if (xivopeners_pld.openerAbilities.FastBlade.cdmax - xivopeners_pld.openerAbilities.FastBlade.cd < 0.9) then
                xivopeners_pld.abilityQueue[1]:Cast(target.id)
                xivopeners_pld.lastCastFromQueue = xivopeners_pld.abilityQueue[1]
            end

            return
        end

        xivopeners_pld.abilityQueue[1]:Cast(target.id)
        xivopeners_pld.lastCastFromQueue = xivopeners_pld.abilityQueue[1]
    end
end
