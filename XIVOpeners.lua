xivopeners = {}

xivopeners.GUI = {
    open = false,
    visible = true,
    drawMode = 1,
}

xivopeners.running = false
xivopeners.supportedJobs = {31} -- only supports mch and brd for now
xivopeners.oocEnable = true

function xivopeners.log(string)
    d("[XIVOpeners] " .. string)
end

function xivopeners.ToggleRun()
    xivopeners.running = not xivopeners.running
end

function xivopeners.ToggleMenu()
    xivopeners.GUI.open = not xivopeners.GUI.open
end

function xivopeners.Init()
    ml_gui.ui_mgr:AddMember({ id = "FFXIVMINION##MENU_XIVOpeners", name = "XIVOpeners", onClick = function() xivopeners.GUI.open = not xivopeners.GUI.open end, tooltip = "Does openers and passes them off to ACR. Currently in BETA, not all jobs are supportec!"},"FFXIVMINION##MENU_HEADER")
end

function xivopeners.DrawCall(event, ticks)
   local gamestate = GetGameState()
    if (gamestate == FFXIV.GAMESTATE.INGAME) then
        if (xivopeners.GUI.open) then
            GUI:SetNextWindowSize(580, 340, GUI.SetCond_FirstUseEver)
            xivopeners.GUI.visible, xivopeners.GUI.open = GUI:Begin("XIVOpeners", xivopeners.GUI.open)
            if (xivopeners.GUI.visible) then
                if (xivopeners.GUI.drawMode == 1) then
                    xivopeners.drawMainFull()
                else
                    xivopeners.drawMainSmall()
                end
            end
            GUI:End()
        end
    end
end

function xivopeners.drawMainFull()
    local x, y = GUI:GetWindowPos()
    local width, height = GUI:GetWindowSize()
    local contentWidth = GUI:GetContentRegionAvailWidth()
    GUI:AlignFirstTextHeightToWidgets()
    GUI:Text("Status: ")
    GUI:Sameline(0, 0)
    if (xivopeners.supportedJobs[Player.job]) then
        if (xivopeners.running) then
            GUI:TextColored(.1, 1, .2, 1, "RUNNING")
        else
            GUI:TextColored(1, .6471, 0, 1,"STOPPED")
        end
    else
        GUI:TextColored(1, .1, .2, 1, "JOB UNSUPPORTED")
    end
    GUI:Sameline(0, 5)
    if (GUI:ImageButton("##xivopeners_drawmode_collapse", ml_global_information.path .. "\\GUI\\UI_Textures\\collapse.png", 14, 14)) then
        xivopeners.GUI.drawMode = 0
    end
    GUI:AlignFirstTextHeightToWidgets()
    GUI:Columns(2, "##xivopeners_cols", true)

    GUI:BeginGroup()
    GUI:Text("Auto enable")
    GUI:NextColumn()
    local oocEnableChanged --unused for now, left it here for future use
    xivopeners.oocEnable, oocEnableChanged = GUI:Checkbox("##xivopeners_oocenablecheck", xivopeners.oocEnable)
--    if (oocEnableChanged) then
--    end
    if (GUI:IsItemHovered()) then
        GUI:SetTooltip("Automatically re-enables opener once you're out of combat")
    end
    GUI:EndGroup()

    GUI:Columns(1)

    if (GUI:Button("Start / Stop", contentWidth, 20)) then
        xivopeners.ToggleRun()
    end
end

function xivopeners.drawMainSmall()
    GUI:SetNextWindowSize(190,50,GUI.SetCond_Always)
    local flags = (GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoResize + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoCollapse)
    GUI:Begin("xivconverter_main_minimized", true, flags)

    local x, y = GUI:GetWindowPos()
    local width, height = GUI:GetWindowSize()
    local contentWidth = GUI:GetContentRegionAvailWidth()
    local childColor
    local botMode

    if (xivopeners.supportedJobs[Player.job]) then
        if (xivopeners.running) then
            childColor = {r = .1, g = 1, b = .2, a = 1 }
            botMode = "RUNNING"
        else
            childColor = {r = 1, g = .6471, b = 0, a = 1 }
            botMode = "STOPPED"
        end
    else
        childColor = {r = 1, g = .1, b = .2, a = 1 }
        botMode = "JOB UNSUPPORTED"
    end
    GUI:PushStyleVar(GUI.StyleVar_ChildWindowRounding,10)
    GUI:PushStyleColor(GUI.Col_ChildWindowBg, childColor.r, childColor.g, childColor.b, childColor.a)

    GUI:BeginChild("##xivopeners_ministatuslabel", 120, 35, true)
    GUI:GUI:AlignFirstTextHeightToWidgets()
    GUI:Text(botMode)
    GUI:EndChild()
    if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            xivopeners.ToggleRun()
        end
    end
    GUI:SameLine(contentwidth-35);

    GUI:PopStyleColor()
    GUI:PopStyleVar()

    if (GUI:ImageButton("##xivopeners_drawmode_expand", ml_global_information.path .. "\\GUI\\UI_Textures\\expand.png", 35, 35)) then
        xivopeners.GUI.drawMode = 1
    end
end

function xivopeners.OnUpdate()
    local gamestate = GetGameState()
    if (gamestate == FFXIV.GAMESTATE.INGAME) then
        xivopeners.running = xivopeners.supportedJobs[Player.job] ~= nil and xivopeners.running
    end
end

RegisterEventHandler("Module.Initalize", xivopeners.Init)
RegisterEventHandler("Gameloop.Draw", xivopeners.DrawCall)
RegisterEventHandler("XIVOpeners.toggle", xivopeners.ToggleMenu)
RegisterEventHandler("Gameloop.Update", xivopeners.OnUpdate)