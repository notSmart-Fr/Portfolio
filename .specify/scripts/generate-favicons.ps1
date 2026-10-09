Add-Type -AssemblyName System.Drawing

function Generate-IconPng([int]$size, [string]$path) {
    $bmp = New-Object System.Drawing.Bitmap($size, $size)
    $gfx = [System.Drawing.Graphics]::FromImage($bmp)
    $gfx.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $gfx.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAlias

    $bgBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(15, 23, 42))
    $gfx.FillRectangle($bgBrush, 0, 0, $size, $size)

    $cyanPen = New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(56, 189, 248), [Math]::Max(1, $size / 16))
    $gfx.DrawRectangle($cyanPen, 1, 1, $size - 2, $size - 2)

    $fontSize = [int]($size * 0.45)
    $font = New-Object System.Drawing.Font("Segoe UI", $fontSize, [System.Drawing.FontStyle]::Bold)
    $whiteBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(248, 250, 252))
    $format = New-Object System.Drawing.StringFormat
    $format.Alignment = [System.Drawing.StringAlignment]::Center
    $format.LineAlignment = [System.Drawing.StringAlignment]::Center

    $rect = New-Object System.Drawing.RectangleF(0, 0, $size, $size)
    $gfx.DrawString("S", $font, $whiteBrush, $rect, $format)

    $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
    $gfx.Dispose()
    $bmp.Dispose()
}

Generate-IconPng 180 "D:\Portfolio\static\apple-touch-icon.png"
Generate-IconPng 32 "D:\Portfolio\static\favicon-32x32.png"
Generate-IconPng 16 "D:\Portfolio\static\favicon-16x16.png"

# Copy 32x32 to favicon.ico for standard fallback
Copy-Item "D:\Portfolio\static\favicon-32x32.png" "D:\Portfolio\static\favicon.ico" -Force
Write-Output "Successfully generated favicon suite"

