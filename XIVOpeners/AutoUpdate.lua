xivopeners_AutoUpdate = {}

function xivopeners_AutoUpdate.checkUpdate()
    local prog = assert(io.popen([[Powershell.exe -executionpolicy remotesigned -command "$R = Invoke-WebRequest -URI http://www.bing.com?q=how+many+feet+in+a+mile; $R.InputFields | Where-Object{ $_.name -like '* Value' } |Select-Object Name, Value"]]))
--    local output = prog:read("*a")
--    prog:close()
    for line in prog:lines() do
        xivopeners.log(line)
    end
end