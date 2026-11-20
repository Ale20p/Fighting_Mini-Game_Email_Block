Add-Type -AssemblyName System.Drawing

function Get-BBox($path) {
    $bmp = New-Object System.Drawing.Bitmap($path)
    $minX = $bmp.Width; $maxX = 0; $minY = $bmp.Height; $maxY = 0
    for ($y = 0; $y -lt $bmp.Height; $y++) {
        for ($x = 0; $x -lt $bmp.Width; $x++) {
            $p = $bmp.GetPixel($x, $y)
            if ($p.A -gt 20) {
                if ($x -lt $minX) { $minX = $x }
                if ($x -gt $maxX) { $maxX = $x }
                if ($y -lt $minY) { $minY = $y }
                if ($y -gt $maxY) { $maxY = $y }
            }
        }
    }
    $bmp.Dispose()
    return "$minX,$minY to $maxX,$maxY (width=$($maxX-$minX+1), height=$($maxY-$minY+1))"
}

Write-Host "P1 ready_1:" (Get-BBox "sprites_viking_axe\axe_origin\ready_1.png")
Write-Host "P1 ready_4:" (Get-BBox "sprites_viking_axe\axe_origin\ready_4.png")
Write-Host "P1 attack1_1:" (Get-BBox "sprites_viking_axe\axe_origin\attack1_1.png")
Write-Host "P1 attack1_4:" (Get-BBox "sprites_viking_axe\axe_origin\attack1_4.png")
Write-Host "P1 jump_3:" (Get-BBox "sprites_viking_axe\axe_origin\jump_3.png")

Write-Host "P2 ready_1:" (Get-BBox "sword_1\ready_1.png")
Write-Host "P2 attack1_1:" (Get-BBox "sword_1\attack1_1.png")
Write-Host "P2 attack1_4:" (Get-BBox "sword_1\attack1_4.png")
Write-Host "P2 hit_1:" (Get-BBox "sword_1\hit_1.png")
Write-Host "P2 fall_back_5:" (Get-BBox "sword_1\fall_back_5.png")

