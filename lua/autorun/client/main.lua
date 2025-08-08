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
    if IsValid(self.frame) then return end -- if frame exist exit func

    self.frame = vgui.Create("ZenUI.Panel")
    self.frame:SetSize(ScrW() / 2, ScrH() / 2 + 100)
    self.frame:Center()
    self.frame:MakePopup()
    self.frame:SetKeyBoardInputEnabled(false)
    -- makes board clickable without stoping ply
    -- https://gmodwiki.com/Panel:SetMouseInputEnabled

    -- need ply to be panel
    -- need panel to have labels
    self.player = vgui.Create("ZenUI.Dropdown", self.frame)
    self.player:Dock(TOP)
    self.player:SetPlaceholder("Name")
    self.player:AddValue(7)

    for i, v in ipairs(player.GetAll()) do 
        -- plys
    end
end

function freakboard:hide()
    self.frame:Remove()
end


function freakboard:toggle(toggle)
    if toggle then
        self:show()
    else
        self:hide()
    end
end

hook.Add("ScoreboardShow", "FreakBoardShow", function ()
    freakboard:toggle(true)
    return false 
end)

hook.Add("ScoreboardHide", "FreakBoardHide", function ()
    freakboard:toggle(false)
end)