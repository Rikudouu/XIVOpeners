-- this will probably never get implemented to the fullest extent, i'll probably just use checkupdate and prompt the
-- user to manually update, since there can be local changes and handling that can be messy
xivopeners_AutoUpdate = {}

function xivopeners_AutoUpdate.checkUpdate()
    local prog = assert(io.popen([[Powershell.exe -executionpolicy remotesigned -command "$R = Invoke-RestMethod -URI https://api.github.com/repos/Rikudouu/XIVOpeners/releases/latest; $R.tag_name"]]))
    local latestRelease
    for line in prog:lines() do
        local status, latestRelease = pcall(semver, string.sub(line, 2))
        if (status) then
            xivopeners.log("Latest version is: " .. tostring(latestRelease))
            prog:close()
            if (latestRelease > xivopeners.version) then
                xivopeners.log("New version available")
                return true
            end
            return false
        end
    end
    return false
end