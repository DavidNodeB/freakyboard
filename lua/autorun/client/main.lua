AddCSLuaFile("autorun/config.lua")
freakboard = {}


--[[
Initialize Zenui
local function Initialize()
    print("ZenUI is guaranteed to be initialized here :D")
end

if !_G.ZenUI or !ZenUI.Loaded then
    hook.Add("ZenUI_Loaded", "FreakyBoard_ZenUI_Loaded", Initialize)
else
    Initialize()
end
Initialize Zenui
]] 

function freakboard:show()
    if IsValid(self.frame) then return end 

    local plyCount = "100 Players" 
    local plyCountX = select(1, surface.GetTextSize(plyCount))


    self.frame = vgui.Create("DFrame")
    self.frame:SetSize(ScrW() / 2, ScrH() / 2 + 100)
    self.frame:Center()
    self.frame:SetTitle("")
    self.frame:ShowCloseButton(false)
    self.frame:SetDraggable(false)
    self.frame:MakePopup()
    self.frame:SetKeyBoardInputEnabled(false)

    self.scrollPanel = vgui.Create("DScrollPanel", self.frame)
    self.scrollPanel:Dock(FILL)
    self.scrollPanel:SetSize(500, 500)
    self.scrollPanel:DockMargin(10, 0, 10, 10)

    
    self.plyCountLabel = vgui.Create("DLabel", self.frame)
    self.plyCountLabel:SetText("")    
    self.plyCountLabel:SetPos(210, 5)
    self.plyCountLabel:SetFont(freaky_config.font)
    self.plyCountLabel:SetSize(plyCountX + 8) -- error
    self.plyCountLabel:SetAutoStretchVertical(true)

    self.frame.Paint = function (self, w, h)
        draw.RoundedBox(4, 0, 0, w, h, freaky_config.primaryColor)
        draw.DrawText( freaky_config.scoreboardTitle, freaky_config.font, 15, 5, white, TEXT_ALIGN_LEFT )
    end
    
    self.plyCountLabel.Paint = function (self, w, h)
        draw.RoundedBox(4, 0, 0, w, h, freaky_config.secondaryColor)
        draw.DrawText( plyCount, freaky_config.font, ((plyCountX + 8) - plyCountX) / 2, 0, freaky_config.cyanColor)
    end


    --[[ 
    this calculation is just
    box width - text width / 2
    example is 88px - 83px is 5px but / 2 gives us the center
    ((plyCountX + 5) - plyCountX) / 2 
    ]]
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