
include( 'shared.lua' )

function ENT:Draw()
    self:DrawModel()

    local pos = self:GetPos() + Vector( 0, -2, 80 )
    local ang = self:GetAngles()

    ang:RotateAroundAxis( ang:Up(), 90 )
    ang:RotateAroundAxis( ang:Forward(), 90 )
    if LocalPlayer():GetPos():Distance( self:GetPos() ) < 800 then
        cam.Start3D2D( pos, Angle( 0, LocalPlayer():EyeAngles().y - 90, 90 ), 0.1 )
			draw.SimpleTextOutlined( "Se connecter à : " .. FSC_ServerName, "FBNpcPolice", 0, - 50, Color( 255,255,255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0, 255 ) )
        cam.End3D2D()
	if FSCDrawAddonName == true then
			cam.Start3D2D( pos, Angle( 0, LocalPlayer():EyeAngles().y - 90, 90 ), 0.050 )
				draw.SimpleTextOutlined( "FServerConnect", "FBNpcPolice", 0, - 200, Color( 255,255,255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0, 255 ) )
			cam.End3D2D()
		end
    end
end