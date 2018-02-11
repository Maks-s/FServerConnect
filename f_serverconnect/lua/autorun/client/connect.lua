
--[[-------------------------
	Blur
----------------------------]]

local blur = Material("pp/blurscreen")
local function DrawBlur( p, a, d )
	local x, y = p:LocalToScreen( 0, 0 )
	
	surface.SetDrawColor( 255, 255, 255 )
	surface.SetMaterial( blur )
	
	for i = 1, d do
		blur:SetFloat( "$blur", (i / d ) * ( a ) )
		blur:Recompute()
		
		render.UpdateScreenEffectTexture()
		
		surface.DrawTexturedRect( x * -1, y * -1, ScrW(), ScrH() )
	end
end

--[[-------------------------
	Open Menu 
-----------------------------]]

net.Receive( "FSC:Ply:OpenMenu", function()
	local Base = vgui.Create("DFrame")
    Base:SetSize( 550, 400 )
    Base:SetPos( ScrW() / 2 - 400, ScrH() / 2 - 225 )
    Base:SetTitle( "" )
    Base:ShowCloseButton( false )
    Base:SetDraggable( false )
    Base:MakePopup()
    Base:Center()
    Base.Paint = function( self, w, h )
		DrawBlur( self, 1, FSCBlurPower )		
		draw.SimpleText( FSC_WelcomeMSG .. LocalPlayer():Nick() .. " !", "FSCPanelFont:20", w / 2, 37, color_white, TEXT_ALIGN_CENTER )
		draw.SimpleText( FSC_Suggestion .. FSC_SecondServerName .. " ?", "FSCPanelFont:20", w / 2, 110, color_white, TEXT_ALIGN_CENTER )
    end
	
    local b1 = vgui.Create( "DButton", Base )
    b1:SetSize( 430, 45 )
	b1:SetPos( 60, 200 )
    b1:SetText( "Me connecter à " .. FSC_ServerName )
    b1:SetFont( "FBButtonsFont:0" )
    b1:SetTextColor( color_white )
	b1.OnCursorEntered = function( self ) self.hover = true surface.PlaySound("UI/buttonrollover.wav") end
	b1.OnCursorExited = function( self ) self.hover = false end
	b1.Slide = 0
  	b1.Paint = function( self, w, h )
		if self.hover then
			self.Slide = Lerp( 0.2, self.Slide, w )

			draw.RoundedBox(2, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
			draw.RoundedBox(1, 0, 0, self.Slide, h, Color( 0, 153, 51, 255 ) )
		else
			self.Slide = Lerp( 0.1, self.Slide, 0 )
			draw.RoundedBox(2, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
			draw.RoundedBox(1, 0, 0, self.Slide, h, Color( 0, 153, 51, 255 ) )
		end
	end	
  	b1.DoClick = function()
		Base:Remove()
		LocalPlayer():ConCommand( "connect ".. FSCServerIP ..":" .. FSCPort )
  	end
	
	local b2 = vgui.Create( "DButton", Base )
    b2:SetSize( 430, 45 )
    b2:SetPos( 60, 300	)
    b2:SetText( "Oupss, je me suis trompé !" )
    b2:SetFont( "FBButtonsFont:0" )
    b2:SetTextColor( color_white )
	b2.OnCursorEntered = function( self ) self.hover = true surface.PlaySound("UI/buttonrollover.wav") end
	b2.OnCursorExited = function( self ) self.hover = false end
	b2.Slide = 0
	b2.Paint = function( self, w, h )
		if self.hover then
			self.Slide = Lerp( 0.2, self.Slide, w )

			draw.RoundedBox(2, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
			draw.RoundedBox(1, 0, 0, self.Slide, h, Color( 255, 50, 50 ) )
		else
			self.Slide = Lerp( 0.1, self.Slide, 0 )
			draw.RoundedBox(2, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
			draw.RoundedBox(1, 0, 0, self.Slide, h, Color( 255, 50, 50 ) )
		end
	end	
  	b2.DoClick = function()
		Base:Remove()
  	end
end)