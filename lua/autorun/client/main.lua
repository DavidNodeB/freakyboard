freakboard = freakboard or {}

----Initialize Zenui----
local function Initialize()
    -- print("ZenUI is guaranteed to be initialized here :D")
end

if !_G.ZenUI or !ZenUI.Loaded then
    hook.Add("ZenUI_Loaded", "FreakyBoard_ZenUI_Loaded", Initialize)
else
    Initialize()
end
----Initialize Zenui----

function freakboard:show()
    
end


function freakboard:toggle(toggle)
    if toggle then
        print("Opening")
    else
        print("Closing")
    end
end

hook.Add("ScoreboardShow", "FreakBoardShow", function ()
    freakboard:toggle(true)
    return false 
end)

hook.Add("ScoreboardHide", "FreakBoardHide", function ()
    freakboard:toggle(false)
end)