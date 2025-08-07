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
    if IsValid(self.frame) then return end -- check if frame exist

    self.frame = vgui.Create("ZenUI.Panel")
    self.frame:SetSize(ScrW() / 2, ScrH() / 2)
    self.frame:Center()
end


function freakboard:toggle(toggle)
    if toggle then
        self:show()
        -- open
    else
        if IsValid(self.frame) then
            self.frame:Remove()
            self.frame = nil
        end
    end
end

hook.Add("ScoreboardShow", "FreakBoardShow", function ()
    freakboard:toggle(true)
    return false 
end)

hook.Add("ScoreboardHide", "FreakBoardHide", function ()
    freakboard:toggle(false)
end)