Add-Type -AssemblyName System.Drawing

$width = 1200
$height = 630
$bmp = New-Object System.Drawing.Bitmap($width, $height)
$gfx = [System.Drawing.Graphics]::FromImage($bmp)
$gfx.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$gfx.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAlias

# Background dark slate
$bgBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(15, 23, 42))
$gfx.FillRectangle($bgBrush, 0, 0, $width, $height)

# Accent border line
$borderPen = New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(51, 65, 85), 4)
$gfx.DrawRectangle($borderPen, 2, 2, $width - 4, $height - 4)

# Top badge
$cyanBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(56, 189, 248))
$subFont = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
$gfx.DrawString("BACKEND & SYSTEMS ENGINEER", $subFont, $cyanBrush, 100, 140)

# Main Title: Samin Yasir
$whiteBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(248, 250, 252))
$titleFont = New-Object System.Drawing.Font("Segoe UI", 56, [System.Drawing.FontStyle]::Bold)
$gfx.DrawString("Samin Yasir", $titleFont, $whiteBrush, 96, 190)

# Focus Statement
$grayBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(148, 163, 184))
$bodyFont = New-Object System.Drawing.Font("Segoe UI", 22, [System.Drawing.FontStyle]::Regular)
$gfx.DrawString("Building resilient concurrent pipelines, adapter seams,", $bodyFont, $grayBrush, 100, 310)
$gfx.DrawString("and distributed event systems.", $bodyFont, $grayBrush, 100, 355)

# Domain Pill
$pillBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(30, 41, 59))
$gfx.FillRectangle($pillBrush, 100, 450, 320, 50)
$pillPen = New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(56, 189, 248), 2)
$gfx.DrawRectangle($pillPen, 100, 450, 320, 50)

$domainFont = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
$gfx.DrawString("saminyasir.dev", $domainFont, $whiteBrush, 170, 460)

$certFont = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Regular)
$gfx.DrawString("Verified Systems Engineering Portfolio", $certFont, $grayBrush, 460, 462)

$bmp.Save("D:\Portfolio\static\images\og-card.png", [System.Drawing.Imaging.ImageFormat]::Png)
$gfx.Dispose()
$bmp.Dispose()
Write-Output "Successfully created og-card.png"

