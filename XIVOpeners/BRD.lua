-- This is an example of a more complicated opener with several conditions and duplicates. There is a function called
-- updateActionused() which is called every update and it is a custom cast detection mechanicsm. However, it's use should be
-- avoided unless absolutely necessary because it relies on changing animations, which means that if you check a GCD, you
-- will be stuck without using any ogcd abilities until the gcd's cast animation finishes. This is circumvented with another
-- elseif statement shown below in the code. Only duplicate abilties should be checked using this function.

xivopeners_brd = {}

xivopeners_brd.supportedLevel = 80
xivopeners_brd.openerAbilities = {
    BurstShot = ActionList:Get(1, 16495),
    RefulgentArrow = ActionList:Get(1, 7409),
    IronJaws = ActionList:Get(1, 3560),
    Sidewinder = ActionList:Get(1, 3562),
    EmpyrealArrow = ActionList:Get(1, 3558),
    Barrage = ActionList:Get(1, 107),
    RagingStrikes = ActionList:Get(1, 101),
    Bloodletter = ActionList:Get(1, 110),
    Stormbite = ActionList:Get(1, 7407),
    CausticBite = ActionList:Get(1, 7406),
    WanderersMinuet = ActionList:Get(1, 3559),
    BattleVoice = ActionList:Get(1, 118),
    PitchPerfect = ActionList:Get(1, 7404),
    StraightShotReadyBuffID = 122,
    RagingStrikesBuffID = 125,
}

xivopeners_brd.openerInfo = {
    listOpeners = {"Recommended", "Compatibility"},
    currentOpenerIndex = 1,
}

xivopeners_brd.openers = {
    recommended = {
        xivopeners_brd.openerAbilities.RagingStrikes,
        xivopeners_brd.openerAbilities.Stormbite,
        xivopeners_brd.openerAbilities.Bloodletter,
        xivopeners_brd.openerAbilities.WanderersMinuet,
        xivopeners_brd.openerAbilities.CausticBite,
        xivopeners_brd.openerAbilities.EmpyrealArrow,
        xivopeners_brd.openerAbilities.BattleVoice, -- after this point it's either 3 burst shots, or RA procs if we get them
        xivopeners_brd.openerAbilities.BurstShot,
        xivopeners_brd.openerAbilities.BurstShot,
        xivopeners_brd.openerAbilities.BurstShot,
        xivopeners_brd.openerAbilities.Barrage, -- need a check here for an RA proc, and use that instead
        xivopeners_brd.openerAbilities.RefulgentArrow,
        xivopeners_brd.openerAbilities.Sidewinder,
        xivopeners_brd.openerAbilities.BurstShot,
        xivopeners_brd.openerAbilities.Bloodletter,
        xivopeners_brd.openerAbilities.IronJaws,
        xivopeners_brd.openerAbilities.EmpyrealArrow
    },

    compatibility = {
        xivopeners_brd.openerAbilities.RagingStrikes,
        xivopeners_brd.openerAbilities.Stormbite,
        xivopeners_brd.openerAbilities.Bloodletter,
        xivopeners_brd.openerAbilities.CausticBite,
        xivopeners_brd.openerAbilities.WanderersMinuet,
        xivopeners_brd.openerAbilities.BattleVoice,
        xivopeners_brd.openerAbilities.BurstShot,
        xivopeners_brd.openerAbilities.EmpyrealArrow,
        xivopeners_brd.openerAbilities.BurstShot,
        xivopeners_brd.openerAbilities.BurstShot,
        xivopeners_brd.openerAbilities.Barrage,
        xivopeners_brd.openerAbilities.EmpyrealArrow,
        xivopeners_brd.openerAbilities.Sidewinder,
        xivopeners_brd.openerAbilities.BurstShot,
        xivopeners_brd.openerAbilities.Bloodletter,
        xivopeners_brd.openerAbilities.IronJaws,
        xivopeners_brd.openerAbilities.EmpyrealArrow
    },
}

xivopeners_brd.abilityQueue = {}
xivopeners_brd.lastCastFromQueue = nil -- might need this for some more complex openers with conditions
xivopeners_brd.openerStarted = false

function xivopeners_brd.getOpener()
    local opener
    if (xivopeners_brd.openerInfo.currentOpenerIndex == 1) then
        opener = xivopeners_brd.openers.recommended
    else
        opener = xivopeners_brd.openers.compatibility
    end
    return opener
end

function xivopeners_brd.checkOpenerIds()
    for key, action in pairs(xivopeners_brd.getOpener()) do
        if (action == nil) then
            xivopeners.log("WARNING: Action at index " .. tostring(key) .. " was nil! The id is likely incorrect.")
        end
    end
end

function xivopeners_brd.openerAvailable()
    -- check cooldowns
    for _, action in pairs(xivopeners_brd.getOpener()) do
        if (action.cd >= 1.5) then return false end
    end
    return true
end

function xivopeners_brd.updateActionUsed()
    -- this function is required for duplicate abilities, i would avoid using it unless absolutely neccessary
    if (xivopeners_brd.lastCastFromQueue) then
        if (xivopeners_brd.lastCastFromQueue.casting and Player.castinginfo.castingid ~= xivopeners_brd.lastCastFromQueue.id) then
            xivopeners.log("Casted")
            xivopeners_brd.lastCastFromQueue.casted = true
        elseif (Player.castinginfo.castingid == xivopeners_brd.lastCastFromQueue.id) then
            xivopeners.log("Currently casting")
            xivopeners_brd.lastCastFromQueue.casting = true
        end
    end
end

function xivopeners_brd.main(event, tickcount)
    if (Player.level >= xivopeners_brd.supportedLevel) then
        local target = Player:GetTarget()
        if (not target) then return end

        if (not xivopeners_brd.openerAvailable() and not xivopeners_brd.openerStarted) then return end -- don't start opener if it's not available, if it's already started then yolo

        xivopeners_brd.updateActionUsed()

        if (xivopeners_brd.openerStarted and next(xivopeners_brd.abilityQueue) == nil) then
            -- opener is finished, pass control to ACR
            xivopeners.log("Finished openers, handing control to ACR")
            xivopeners_brd.openerStarted = false
            xivopeners.running = false
            if (not FFXIV_Common_BotRunning) then
                ml_global_information.ToggleRun()
            end
            return
        end

        if (ActionList:IsCasting()) then return end

        if (not xivopeners_brd.openerStarted) then
            -- technically, even if you use an ability from prepull, it should still work, because the next time this loop runs it'll jump to correct elseif since the last ability used should be the right one
            xivopeners.log("Starting opener")
            xivopeners_brd.openerStarted = true
            xivopeners_brd.useNextAction(target)
        -- if the last ability and the next ability are the same, we need some special logic to cover it since our normal check will always succeed
        elseif(xivopeners_brd.abilityQueue[1] == xivopeners_brd.abilityQueue[2] and xivopeners_brd.lastCastFromQueue.id ~= -1) then
            if (xivopeners_brd.lastCastFromQueue.casted) then -- we use casted here, which is updated from the updateActionUsed call above to detect if the cast went off
                xivopeners_brd.dequeue()
            end

            xivopeners_brd.useNextAction(target) -- we still want to call this every pulse to weave in ogcds and use any procs we might get
        elseif (xivopeners_brd.lastCastFromQueue and xivopeners_brd.lastCastFromQueue.id ~= -1 and xivopeners_brd.lastCastFromQueue.id == Player.castinginfo.lastcastid) then -- -1 means the cast was skipped intentionally
            xivopeners_brd.dequeue()
            xivopeners_brd.useNextAction(target)
        else
            xivopeners_brd.useNextAction(target)
        end

    end
end

function xivopeners_brd.queueOpener()
    -- empty queue first
    xivopeners_brd.abilityQueue = {}
    for _, action in pairs(xivopeners_brd.getOpener()) do
        xivopeners_brd.enqueue(action)
    end
    xivopeners.log("queue:")
    for _, v in pairs(xivopeners_brd.abilityQueue) do
        xivopeners.log(v.name)
    end
end

function xivopeners_brd.enqueue(action)
    -- implementation of the queue can be changed later
    table.insert(xivopeners_brd.abilityQueue, action)
end

function xivopeners_brd.dequeue()
    xivopeners.log("Dequeing " .. xivopeners_brd.abilityQueue[1].name)
    xivopeners_brd.abilityQueue[1].casting = false
    xivopeners_brd.abilityQueue[1].casted = false
    table.remove(xivopeners_brd.abilityQueue, 1)
end

function xivopeners_brd.cast(action, target)
    action:Cast(target.id)
end

function xivopeners_brd.useNextAction(target)
    -- do the actual opener
    -- the current implementation uses a queue system
    if (target and target.attackable and xivopeners_brd.abilityQueue[1]) then
        -- prepull RS
        if (xivopeners_brd.abilityQueue[1] == xivopeners_brd.openerAbilities.RagingStrikes and HasBuff(Player.id, xivopeners_brd.openerAbilities.RagingStrikesBuffID)) then
            xivopeners.log("Player already used raging strikes prepull, continue with opener")
            xivopeners_brd.lastCastFromQueue = xivopeners_brd.openerAbilities.RagingStrikes
            return
        end
        -- pp3 gauge 2
        if (Player.gauge[2] >= 3) then
            -- don't want to dequeue here
            xivopeners.log("Using PP3 proc")
            xivopeners_brd.cast(xivopeners_brd.openerAbilities.PitchPerfect, target)
            xivopeners_brd.lastCastFromQueue = {id = -1, name = "skip"}
            return
        end

        --  RA proc during BurstShot
        if (xivopeners_brd.abilityQueue[1] == xivopeners_brd.openerAbilities.BurstShot and HasBuff(Player.id, xivopeners_brd.openerAbilities.StraightShotReadyBuffID)) then
            -- still need to dequeue burst shot
            xivopeners.log("Using RA proc during BurstShot window")
            xivopeners_brd.cast(xivopeners_brd.openerAbilities.RefulgentArrow, target)
            xivopeners_brd.lastCastFromQueue = xivopeners_brd.openerAbilities.RefulgentArrow
            return
        end

        -- RA proc during Barrage
        if (xivopeners_brd.abilityQueue[1] == xivopeners_brd.openerAbilities.Barrage and HasBuff(Player.id, xivopeners_brd.openerAbilities.StraightShotReadyBuffID)) then
            -- don't want to dequeue barrage here
            xivopeners.log("Using RA proc before barrage")
            xivopeners_brd.cast(xivopeners_brd.openerAbilities.RefulgentArrow, target)
            xivopeners_brd.lastCastFromQueue = {id = -1, name = "skip" }
            return
        end

        -- idk how to make it not spam console and still keep performance
        xivopeners.log("Casting " .. xivopeners_brd.abilityQueue[1].name)
        xivopeners_brd.cast(xivopeners_brd.abilityQueue[1], target)
        xivopeners_brd.lastCastFromQueue = xivopeners_brd.abilityQueue[1]
    end
end