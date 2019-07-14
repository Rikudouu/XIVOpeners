xivopeners = {}

xivopeners.GUI = {
    open - false,
    visible - true,
}

function xivopeners.Init()
    ml_gui.ui_mgr:AddMember({ id = "FFXIVMINION##MENU_XIVOpeners", name = "XIVOpeners", onClick = function() craftingconverter.GUI.open = not craftingconverter.GUI.open end, tooltip = "Does openers and passes them off to ACR. Currently in BETA, not all jobs are supportec!"},"FFXIVMINION##MENU_HEADER")
end