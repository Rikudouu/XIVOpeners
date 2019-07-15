xivopeners_mch = {}

xivopeners_mch.supportedLevel = 80
xivopeners_mch.openerAbilities = {
    Drill = ActionList:Get(0),
}

xivopeners_mch.availableOpeners = {"Early WF", "Late WF"}
xivopeners_mch.currentOpenerIndex = 1
xivopeners_mch.openerIndexChanged = false

xivopeners_mch.openerAbilityCount = 1

function xivopeners_mch.openerAvailable()
    -- check cooldowns
end

function xivopeners_mch.incrementOpenerCount()
    xivopeners_mch.openerAbilityCount = xivopeners_mch.openerAbilityCount + 1
end

function xivopeners_mch.main()
    if (Player.level >= xivopeners_mch.supportedLevel) then
        local target = Player:GetTarget()
        if (not target) then return end

        if (not xivopeners_mch.openerAvailable()) then return end

        if (ActionList:IsCasting()) then return end

        if (xivopeners_mch.currentOpenerIndex == 1) then
            xivopeners_mch.opener_early()
        elseif (xivopeners_mch.currentOpenerIndex == 2) then
            xivopeners_mch.opener_late()
        end

    end
end



function xivopeners_mch.opener_early(target)
    -- do the actual opener
    -- the current implementation uses an counter to index the ability, as well as checking the last action to see if it went through.
    -- when the opener is done, the script will turn itself off and reset the index
    -- at the moment, this can't really handle interruptions all that well, it'll just continue the opener where it left off and disregard everything else
    if (xivopeners_mch.openerAbilityCount == 1 and ActionList:canCast(xivopeners_mch.openerAbilities.Drill.id, target.id)) then
        xivopeners_mch.openerAbilities.Drill:cast()
        xivopener_mch.incrementOpenerCount()
        return
    end
end

function xivopeners_mch.opener_late()

end