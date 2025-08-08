freakboard = freakboard or {}

----Initialize Zenui----
-- local function Initialize()
--     -- print("ZenUI is guaranteed to be initialized here :D")
-- end

-- if !_G.ZenUI or !ZenUI.Loaded then
--     hook.Add("ZenUI_Loaded", "FreakyBoard_ZenUI_Loaded", Initialize)
-- else
--     Initialize()
-- end
----Initialize Zenui----

surface.CreateFont( "freakylexend", {
	font = "Lexend", -- Use the font-name which is shown to you by your operating system Font Viewer.
	extended = false,
	size = 26,
	weight = 550,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

function freakboard:show()
    if IsValid(self.frame) then return end -- if frame exist exit func

    self.frame = vgui.Create("DFrame")
    self.frame:SetSize(ScrW() / 2, ScrH() / 2 + 100)
    self.frame:Center()
    self.frame:SetTitle("")
    self.frame:ShowCloseButton(false    )
    self.frame:SetDraggable(false)
    self.frame:MakePopup()
    self.frame:SetKeyBoardInputEnabled(false)

    self.scrollPanel = vgui.Create("DScrollPanel", self.frame)
    self.scrollPanel:Dock(FILL)
    self.scrollPanel:SetSize(500, 500)
    self.scrollPanel:DockMargin(10, 0, 10, 10)

    -- makes board clickable without stoping ply
    -- https://gmodwiki.com/Panel:SetMouseInputEnabled

    for i = 0, 40 do
        self.button = vgui.Create("DButton", self.scrollPanel)
        self.button:Dock(TOP)
    end

    self.frame.Paint = function (self, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Color(25, 25, 25, 255))
        draw.DrawText( "OracleRP - Scoreboard", "freakylexend", 15, 0, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT )
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