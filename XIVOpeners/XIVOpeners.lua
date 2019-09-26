xivopeners = {}

xivopeners.version = semver(1,3,1)

xivopeners.GUI = {
    open = false,
    visible = true,
    drawMode = 1,
}

xivopeners.running = false

-- credit to Kayla D'orden#2527 on discord for this idea and providing the list
xivopeners.jobs = {
    Paladin = 19,
    Monk = 20,
    Warrior = 21,
    Dragoon = 22,
    Bard = 23,
    WhiteMage = 24,
    BlackMage = 25,
    Arcanist = 26,
    Summoner = 27,
    Scholar = 28,
    Rogue = 29,
    Ninja = 30,
    Machinist = 31,
    DarkKnight = 32,
    Astrologian = 33,
    Samurai = 34,
    RedMage = 35,
    BlueMage = 36,
    Gunbreaker = 37,
    Dancer = 38
}

function xivopeners.log(string)
    d("[XIVOpeners] " .. string)
end

-- load autoupdate script
-- code isn't really finished yet, ignore for now
--loadfile(ml_global_information.path .. "\\LuaMods\\XIVOpeners\\AutoUpdate.lua")()
--xivopeners_AutoUpdate.checkUpdate()

-- load all the jobs
if (FolderExists(ml_global_information.path .. "\\LuaMods\\XIVOpeners\\Jobs")) then
    local fileList = FolderList(ml_global_information.path .. "\\LuaMods\\XIVOpeners\\Jobs", [[(.*).lua$]])
    if (table.valid(fileList)) then
        for _, v in pairs(fileList) do
            xivopeners.log("Loading " .. v)
            local f = loadfile(ml_global_information.path .. "\\LuaMods\\XIVOpeners\\Jobs\\" .. v)
            f()
        end
    end
end

xivopeners.supportedJobs = {
    [xivopeners.jobs.Machinist] = {
        main = xivopeners_mch.main,
        openerInfo = xivopeners_mch.openerInfo,
        queueOpener = xivopeners_mch.queueOpener,
        openerAvailable = xivopeners_mch.openerAvailable,
        checkOpenerIds = xivopeners_mch.checkOpenerIds,
        drawCall = xivopeners_mch.drawCall,
    },

    [xivopeners.jobs.Bard] = {
        main = xivopeners_brd.main,
        openerInfo = xivopeners_brd.openerInfo,
        queueOpener = xivopeners_brd.queueOpener,
        openerAvailable = xivopeners_brd.openerAvailable,
        checkOpenerIds = xivopeners_brd.checkOpenerIds,
        drawCall = xivopeners_brd.drawCall,
    },

    [xivopeners.jobs.Monk] = {
        main = xivopeners_mnk.main,
        openerInfo = xivopeners_mnk.openerInfo,
        queueOpener = xivopeners_mnk.queueOpener,
        openerAvailable = xivopeners_mnk.openerAvailable,
        checkOpenerIds = xivopeners_mnk.checkOpenerIds,
        drawCall = xivopeners_mnk.drawCall,
    },

    [xivopeners.jobs.Summoner] = {
        main = xivopeners_smn.main,
        openerInfo = xivopeners_smn.openerInfo,
        queueOpener = xivopeners_smn.queueOpener,
        openerAvailable = xivopeners_smn.openerAvailable,
        checkOpenerIds = xivopeners_smn.checkOpenerIds,
        drawCall = xivopeners_smn.drawCall,
    },

    [xivopeners.jobs.Scholar] = {
        main = xivopeners_sch.main,
        openerInfo = xivopeners_sch.openerInfo,
        queueOpener = xivopeners_sch.queueOpener,
        openerAvailable = xivopeners_sch.openerAvailable,
        checkOpenerIds = xivopeners_sch.checkOpenerIds,
        drawCall = xivopeners_sch.drawCall,
    },

    [xivopeners.jobs.Samurai] = {
        main = xivopeners_sam.main,
        openerInfo = xivopeners_sam.openerInfo,
        queueOpener = xivopeners_sam.queueOpener,
        openerAvailable = xivopeners_sam.openerAvailable,
        checkOpenerIds = xivopeners_sam.checkOpenerIds,
        drawCall = xivopeners_sam.drawCall,
    },

    [xivopeners.jobs.Ninja] = {
        main = xivopeners_nin.main,
        openerInfo = xivopeners_nin.openerInfo,
        queueOpener = xivopeners_nin.queueOpener,
        openerAvailable = xivopeners_nin.openerAvailable,
        checkOpenerIds = xivopeners_nin.checkOpenerIds,
        drawCall = xivopeners_nin.drawCall,
    },

    [xivopeners.jobs.BlackMage] = {
        main = xivopeners_blm.main,
        openerInfo = xivopeners_blm.openerInfo,
        queueOpener = xivopeners_blm.queueOpener,
        openerAvailable = xivopeners_blm.openerAvailable,
        checkOpenerIds = xivopeners_blm.checkOpenerIds,
        drawCall = xivopeners_blm.drawCall,
    },

    [xivopeners.jobs.Dragoon] = {
        main = xivopeners_drg.main,
        openerInfo = xivopeners_drg.openerInfo,
        queueOpener = xivopeners_drg.queueOpener,
        openerAvailable = xivopeners_drg.openerAvailable,
        checkOpenerIds = xivopeners_drg.checkOpenerIds,
        drawCall = xivopeners_drg.drawCall,
    },
    
    [xivopeners.jobs.Paladin] = {
        main = xivopeners_pld.main,
        openerInfo = xivopeners_pld.openerInfo,
        queueOpener = xivopeners_pld.queueOpener,
        openerAvailable = xivopeners_pld.openerAvailable,
        checkOpenerIds = xivopeners_pld.checkOpenerIds,
        drawCall = xivopeners_pld.drawCall,
    },

    [xivopeners.jobs.Gunbreaker] = {
        main = xivopeners_gnb.main,
        openerInfo = xivopeners_gnb.openerInfo,
        queueOpener = xivopeners_gnb.queueOpener,
        openerAvailable = xivopeners_gnb.openerAvailable,
        checkOpenerIds = xivopeners_gnb.checkOpenerIds,
        drawCall = xivopeners_gnb.drawCall,
    },

    [xivopeners.jobs.Dancer] = {
        main = xivopeners_dnc.main,
        openerInfo = xivopeners_dnc.openerInfo,
        queueOpener = xivopeners_dnc.queueOpener,
        openerAvailable = xivopeners_dnc.openerAvailable,
        checkOpenerIds = xivopeners_dnc.checkOpenerIds,
        drawCall = xivopeners_dnc.drawCall,
    },

    [xivopeners.jobs.Warrior] = {
        main = xivopeners_war.main,
        openerInfo = xivopeners_war.openerInfo,
        queueOpener = xivopeners_war.queueOpener,
        openerAvailable = xivopeners_war.openerAvailable,
        checkOpenerIds = xivopeners_war.checkOpenerIds,
        drawCall = xivopeners_war.drawCall,
    },

    [xivopeners.jobs.DarkKnight] = {
        main = xivopeners_drk.main,
        openerInfo = xivopeners_drk.openerInfo,
        queueOpener = xivopeners_drk.queueOpener,
        openerAvailable = xivopeners_drk.openerAvailable,
        checkOpenerIds = xivopeners_drk.checkOpenerIds,
        drawCall = xivopeners_drk.drawCall,
    },
}
xivopeners.oocEnable = false
xivopeners.advancedMode = false

function xivopeners.version:getNumber()
    return self.major + self.minor * 10^(-1) + self.patch * 10^(-2)
end

function xivopeners.version:getString()
    return tostring(self.major) .. "." .. tostring(self.minor) .. "." .. tostring(self.patch)
end

function xivopeners.log(string)
    d("[XIVOpeners] " .. string)
end

function xivopeners.ToggleRun()
    xivopeners.running = not xivopeners.running
    if (xivopeners.supportedJobs[Player.job] ~= nil) then
        xivopeners.supportedJobs[Player.job].checkOpenerIds()
        xivopeners.supportedJobs[Player.job].queueOpener()
    end
end

function xivopeners.Init()
    xivopeners.log("Initializing XIVOpeners v" .. tostring(xivopeners.version))
    if (xivopeners.supportedJobs[Player.job] ~= nil) then
        xivopeners.supportedJobs[Player.job].checkOpenerIds()
        xivopeners.supportedJobs[Player.job].queueOpener()
    end

    ml_gui.ui_mgr:AddMember({ id = "FFXIVMINION##MENU_XIVOpeners", name = "XIVOpeners", onClick = function() xivopeners.GUI.open = not xivopeners.GUI.open end, tooltip = "Does openers and passes them off to ACR. Currently in BETA, not all jobs are supported!"},"FFXIVMINION##MENU_HEADER")
end

function xivopeners.DrawCall(event, ticks)
   local gamestate = GetGameState()
    if (gamestate == FFXIV.GAMESTATE.INGAME) then
        if (xivopeners.GUI.open) then
            if (xivopeners.GUI.drawMode == 1) then
                xivopeners.drawMainFull(event, ticks)
            else
                xivopeners.drawMainSmall()
            end
        end
    end
end

function xivopeners.drawMainFull(event, ticks)
    GUI:SetNextWindowSize(400, 150, GUI.SetCond_FirstUseEver)
    xivopeners.GUI.visible, xivopeners.GUI.open = GUI:Begin("XIVOpeners v" .. tostring(xivopeners.version), xivopeners.GUI.open)
    if (xivopeners.GUI.visible) then
        local x, y = GUI:GetWindowPos()
        local width, height = GUI:GetWindowSize()
        local contentWidth = GUI:GetContentRegionAvailWidth()
        GUI:AlignFirstTextHeightToWidgets()
        GUI:Text("Status: ")
        GUI:SameLine(0, 0)

        -- going to rework this shitshow of a status display soon
        if (xivopeners.supportedJobs[Player.job] ~= nil) then
            if (xivopeners.running) then
                if (xivopeners.supportedJobs[Player.job].openerAvailable()) then
                    GUI:TextColored(.1, 1, .2, 1, "RUNNING")
                else
                    GUI:TextColored(.1, 1, .2, 1, "RUNNING (NR)")
                end
            else
                GUI:TextColored(1, .1, .2, 1, "STOPPED")
            end
        else
            GUI:TextColored(1, .6471, 0, 1, "JOB UNSUPPORTED")
        end
        GUI:SameLine(0, 5)
        if (GUI:ImageButton("##xivopeners_drawmode_collapse", ml_global_information.path .. "\\GUI\\UI_Textures\\collapse.png", 14, 14)) then
            xivopeners.GUI.drawMode = 0
        end

        GUI:AlignFirstTextHeightToWidgets()
        GUI:Columns(2, "##xivopeners_cols", true)
        GUI:BeginGroup()
        GUI:Text("Advanced Mode")
        GUI:NextColumn()
        xivopeners.advancedMode = GUI:Checkbox("##xivopeners_advancedcheck", xivopeners.advancedMode)
        GUI:EndGroup()
        if (GUI:IsItemHovered()) then
            GUI:SetTooltip("ONLY ENABLE THIS IF YOU KNOW WHAT YOU'RE DOING!! Shows some useful options such as auto enable when out of combat")
        end

        GUI:NextColumn()

        if (xivopeners.advancedMode) then
            GUI:AlignFirstTextHeightToWidgets()
            GUI:BeginGroup()
            GUI:Text("Professional Static Mode")
            GUI:NextColumn()
            local oocEnableChanged --unused for now, left it here for future use
            xivopeners.oocEnable, oocEnableChanged = GUI:Checkbox("##xivopeners_oocenablecheck", xivopeners.oocEnable)
    --        if (oocEnableChanged) then
    --        end
            GUI:EndGroup()
            if (GUI:IsItemHovered()) then
                GUI:SetTooltip("Automatically re-enables opener out of combat, useful for a wipe party / progging")
            end
            GUI:NextColumn()
        end

        if (xivopeners.supportedJobs[Player.job]) then
            -- TODO: move this to a drawcall that's opener specific so they can have custom options, can also get rid of openerInfo that way
            GUI:AlignFirstTextHeightToWidgets()
            GUI:Text("Opener")
            GUI:NextColumn()
            GUI:PushItemWidth(-1)
            local openerIndexChanged
            xivopeners.supportedJobs[Player.job].openerInfo.currentOpenerIndex, openerIndexChanged = GUI:Combo("##xivopeners_opener_select", xivopeners.supportedJobs[Player.job].openerInfo.currentOpenerIndex, xivopeners.supportedJobs[Player.job].openerInfo.listOpeners)
            if (openerIndexChanged) then
                xivopeners.supportedJobs[Player.job].queueOpener()
            end
            GUI:PopItemWidth()
            GUI:NextColumn()
            xivopeners.supportedJobs[Player.job].drawCall(event, ticks)
        end
        GUI:Columns(1)

        if (GUI:Button("Start / Stop", contentWidth, 20)) then
            xivopeners.ToggleRun()
        end
    end
    GUI:End()
end

function xivopeners.drawMainSmall()
    GUI:SetNextWindowSize(190,50,GUI.SetCond_FirstUseEver)
    local flags = (GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoResize + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoCollapse)
    GUI:Begin("xivopeners_main_minimized", true, flags)

    local x, y = GUI:GetWindowPos()
    local width, height = GUI:GetWindowSize()
    local contentWidth = GUI:GetContentRegionAvailWidth()
    local childColor
    local botMode

    -- going to rework this shitshow of a status display soon
    if (xivopeners.supportedJobs[Player.job] ~= nil) then
        if (xivopeners.running) then
            childColor = {r = 0, g = .1, b = 0, a = .75}
            if (xivopeners.supportedJobs[Player.job].openerAvailable()) then
                botMode = "Opener"
            else
                botMode = "Opener (NR)"
            end
        else
            childColor = {r = .1, g = 0, b = 0, a = .75 }
            botMode = "Opener"
        end
    else
        childColor = {r = .1, g = .06471, b = 0, a = .75 }
        botMode = "JOB UNSUPPORTED"
    end
    GUI:PushStyleVar(GUI.StyleVar_ChildWindowRounding,10)
    GUI:PushStyleColor(GUI.Col_ChildWindowBg, childColor.r, childColor.g, childColor.b, childColor.a)

    GUI:BeginChild("##xivopeners_ministatuslabel", 120, 35, true)
    GUI:AlignFirstTextHeightToWidgets()
    GUI:Text(botMode)
    GUI:EndChild()
    if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            xivopeners.ToggleRun()
        end
    end
    GUI:SameLine(contentWidth-35);

    GUI:PopStyleColor()
    GUI:PopStyleVar()

    GUI:BeginChild("##xivopeners_drawmode_switch", 35, 35, false)
    GUI:Text("");
    GUI:Image(ml_global_information.path .. "\\GUI\\UI_Textures\\expand.png", 14, 14)
    if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            xivopeners.GUI.drawMode = 1
        end
    end
    GUI:EndChild()

    GUI:End()
end

function xivopeners.OnUpdate(event, tickcount)
    local gamestate = GetGameState()
    if (gamestate == FFXIV.GAMESTATE.INGAME) then
        if (xivopeners.supportedJobs[Player.job] == nil and xivopeners.running) then
            xivopeners.ToggleRun()
        end

        if (xivopeners.running) then
            if (FFXIV_Common_BotRunning) then
                ml_global_information.ToggleRun() -- toggle bot to off if opener is running
            end
            local target = Player:GetTarget()
            if (not gStartCombat and target and not target.incombat) then return end -- combat check
            xivopeners.supportedJobs[Player.job].main(event, tickcount) -- call main for job

        elseif (xivopeners.oocEnable and not Player.incombat and not xivopeners.running) then
            xivopeners.ToggleRun()
        end
    end
end

RegisterEventHandler("Module.Initalize", xivopeners.Init, "xivopeners.Init")
RegisterEventHandler("Gameloop.Draw", xivopeners.DrawCall, "xivopeners.DrawCall")
RegisterEventHandler("Gameloop.Update", xivopeners.OnUpdate, "xivopeners.OnUpdate")