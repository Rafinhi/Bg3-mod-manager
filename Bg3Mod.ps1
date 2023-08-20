Write-Host "1: mod, 2: unmod" -ForegroundColor Green
$installfolder = Get-ItemPropertyValue -Path 'HKLM:\SOFTWARE\WOW6432Node\GOG.com\Games\1456460669\' -Name workingDir
$installfolder = $installfolder.replace('\Launcher', '\Data')

$choice = Read-Host -Prompt "Choice:"
if ($choice -eq 1) {
Push-Location
Write-Host "You have chosen to Mod" -ForegroundColor Green
Set-Location "$env:LOCALAPPDATA\Larian Studios\Baldur's Gate 3\"
Rename-Item .\Mods\ Mods_Disabled
Rename-Item .\Mods_Enabled\ Mods
Set-Location "$env:LOCALAPPDATA\Larian Studios\Baldur's Gate 3\PlayerProfiles\Public\"
Rename-Item .\modsettings.lsx modsettings_disabled.lsx
Rename-Item .\modsettings_enabled.lsx modsettings.lsx
Set-Location $installfolder
Rename-Item .\Mods\ Mods_Disabled
Rename-Item .\Mods_Enabled\ Mods
Pop-Location
}
else {
Push-Location
Write-Host "You have chosen to DeMod" -ForegroundColor Green
Set-Location "$env:LOCALAPPDATA\Larian Studios\Baldur's Gate 3\"
Rename-Item .\Mods\ Mods_Enabled
Rename-Item .\Mods_Disabled\ Mods
Set-Location "$env:LOCALAPPDATA\Larian Studios\Baldur's Gate 3\PlayerProfiles\Public\"
Rename-Item .\modsettings.lsx modsettings_enabled.lsx
Rename-Item .\modsettings_disabled.lsx modsettings.lsx
Set-Location $installfolder
Rename-Item .\Mods\ Mods_Enabled
Rename-Item .\Mods_Disabled\ Mods
Pop-Location
}
