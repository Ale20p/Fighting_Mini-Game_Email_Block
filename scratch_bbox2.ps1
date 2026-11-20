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
    return "$path : $minX,$minY to $maxX,$maxY (width=$($maxX-$minX+1), height=$($maxY-$minY+1))"
}

1..6 | ForEach-Object { Get-BBox "sprites_viking_axe\axe_origin\attack1_$_.png" }
1..6 | ForEach-Object { Get-BBox "sprites_viking_axe\axe_origin\attack2_$_.png" }
1..6 | ForEach-Object { Get-BBox "sword_1\attack1_$_.png" }

