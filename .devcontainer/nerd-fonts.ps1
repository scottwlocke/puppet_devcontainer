##############################################################################################
# Powershell Script to download and install Nerd Fonts
# Fonts are availabe here: https://www.nerdfonts.com/font-downloads
# Assembled by Eugene Valley @ Microsoft Corporation© 2023
#
# This sample script is not supported under any Microsoft standard support program or service.
# This sample script is provided AS IS without warranty of any kind.
# Microsoft further disclaims all implied warranties including, without limitation, any implied
# warranties of merchantability or of fitness for a particular purpose. The entire risk arising
# out of the use or performance of the sample script and documentation remains with you. In no
# event shall Microsoft, its authors, or anyone else involved in the creation, production, or
# delivery of the scripts be liable for any damages whatsoever (including, without limitation,
# damages for loss of business profits, business interruption, loss of business information,
# or other pecuniary loss) arising out of the use of or inability to use the sample script or
# documentation, even if Microsoft has been advised of the possibility of such damages.
##############################################################################################
<#
    .SYNOPSIS
        Download and install patched Nerd Fonts for use with terminal add-ins such as Powerline 
        or Oh My Posh/Oh My ZSH

    .DESCRIPTION
        This script has four phases:
            1. Downloads compressed patched Nerd Fonts from Github to a temp folder
            2. Decompresses the zip files containing the fonts
            3. Copies the fonts to C:\Windows\Fonts and registeres them for the system
            4. Cleanup/housekeeping

    .NOTES
        Version 2.0
        May 25, 2022
#>

# Requires Powershell v3.0

# Elevate creds
if (!([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
    Start-Process -FilePath pwsh.exe -Verb Runas -ArgumentList "-File `"$($MyInvocation.MyCommand.Path)`"  `"$($MyInvocation.MyCommand.UnboundArguments)`""
    Exit
}
   

# Remove temp folder from previous install attempts
$ExFolderName = "$($env:USERPROFILE)\fontstemp"
if (Test-Path $ExFolderName) {
    
    Write-Host "An old temp folder exists from a previous attemp and needs to be removed."
    Remove-Item $ExFolderName -Recurse -Force
    Write-Host "Successfully removed temp folders and content from a previous installation attempt."
}
else {
    Write-Host "Temporary font extraction folder doesn't exist, creating."
}

# Check for and create temp folder in user profile
write-host "Preparing Installation"
Set-Location $env:USERPROFILE
$FontTemp = "$($env:USERPROFILE)\fontstemp\"
if (-not (Test-Path -LiteralPath $FontTemp)) {
    try {
        New-Item -Path $FontTemp -ItemType Directory -ErrorAction Stop | Out-Null #-Force
    }
    catch {
        Write-Error -Message "Unable to create directory '$FontTemp'. Error was: $_" -ErrorAction Stop
    }
    "Successfully created directory '$FontTemp'."
}
else {
    "Directory already existed"
}
New-Item -Path $env:USERPROFILE\fontstemp\ -ItemType Directory -Force
Set-Location -Path $env:USERPROFILE\fontstemp\

 
# Disable progress bars for Invoke-WebRequest downloads
#    $ProgressPreference = 'SilentlyContinue' 

# Download Compresed Fonts
write-host "Downloading Compressed Fonts to a temp folder"

write-host "Downloading Compressed Font: 3270"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/3270.zip -Outfile "$($env:USERPROFILE)\fontstemp\3270.zip"
write-host "Successfully Downloaded Compressed Font: 3270"

write-host "Downloading Compressed Font:Agave"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Agave.zip -Outfile "$($env:USERPROFILE)\fontstemp\Agave.zip"
write-host "Successfully Downloaded Compressed Font: Agave"
    
write-host "Downloading Compressed Font: Anonymous Pro"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/AnonymousPro.zip -Outfile "$($env:USERPROFILE)\fontstemp\AnonymousPro.zip"
write-host "Successfully Downloaded Compressed Font: Anonymous Pro"
    
write-host "Downloading Compressed Font: Arimo"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Arimo.zip -Outfile "$($env:USERPROFILE)\fontstemp\Arimo.zip"
write-host "Successfully Downloaded Compressed Font: Arimo"
    
write-host "Downloading Compressed Font: Aurulent Sans Mono"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/AurulentSansMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\AurulentSansMono.zip"
write-host "Successfully Downloaded Compressed Font: Aurulent Sans Mono"
    
write-host "Downloading Compressed Font: Big Blue Terminal"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/BigBlueTerminal.zip -Outfile "$($env:USERPROFILE)\fontstemp\BigBlueTerminal.zip"
write-host "Successfully Downloaded Compressed Font: Big Blue Terminal"
    
write-host "Downloading Compressed Font: Bitstream Vera Sans Mono"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/BitstreamVeraSansMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\BitstreamVeraSansMono.zip"
write-host "Successfully Downloaded Compressed Font: Bitstream Vera Sans Mono"
    
write-host "Downloading Compressed Font: Cascadia Code"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/CascadiaCode.zip -Outfile "$($env:USERPROFILE)\fontstemp\CascadiaCode.zip"
write-host "Successfully Downloaded Compressed Font: Cascadia Code"
    
write-host "Downloading Compressed Font: IBM Plex Mono"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/IBMPlexMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\IBMPlexMono.zip"
write-host "Successfully Downloaded Compressed Font: IBM Plex Mono"
    
write-host "Downloading Compressed Font: Code New Roman"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/CodeNewRoman.zip -Outfile "$($env:USERPROFILE)\fontstemp\CodeNewRoman.zip"
write-host "Successfully Downloaded Compressed Font: Code New Roman"
    
write-host "Downloading Compressed Font: Comic Shanns Mono"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/ComicShannsMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\ComicShannsMono.zip"
write-host "Successfully Downloaded Compressed Font: Comic Shanns Mono"
    
write-host "Downloading Compressed Font: Cousine"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Cousine.zip -Outfile "$($env:USERPROFILE)\fontstemp\Cousine.zip"
write-host "Successfully Downloaded Compressed Font: Cousine"
    
write-host "Downloading Compressed Font: Daddy Time Mono"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/DaddyTimeMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\DaddyTimeMono.zip" 
write-host "Successfully Downloaded Compressed Font: Daddy Time Mono"
    
write-host "Downloading Compressed Font: DejaVu Sans Mono"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/DejaVuSansMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\DejaVuSansMono.zip"
write-host "Successfully Downloaded Compressed Font: DejaVu Sans Mono"
    
write-host "Downloading Compressed Font: Droid Sans Mono"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/DroidSansMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\DroidSansMono.zip"
write-host "Successfully Downloaded Compressed Font: Droid Sans Mono"
    
write-host "Downloading Compressed Font: Fantasque Sans Mono"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/FantasqueSansMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\FantasqueSansMono.zip"
write-host "Successfully Downloaded Compressed Font: Fantasque Sans Mono"
    
write-host "Downloading Compressed Font: Fira Code"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/FiraCode.zip -Outfile "$($env:USERPROFILE)\fontstemp\FiraCode.zip"
write-host "Successfully Downloaded Compressed Font: Fira Code"
    
write-host "Downloading Compressed Font:Fira Mono"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/FiraMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\FiraMono.zip" 
write-host "Successfully Downloaded Compressed Font: Fira Mono"
   
write-host "Downloading Compressed Font: Go Mono"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Go-Mono.zip -Outfile "$($env:USERPROFILE)\fontstemp\Go-Mono.zip"
write-host "Successfully Downloaded Compressed Font: Go Mono"
    
write-host "Downloading Compressed Font: Gohu"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Gohu.zip -Outfile "$($env:USERPROFILE)\fontstemp\Gohu.zip"
write-host "Successfully Downloaded Compressed Font: Gohu"
    
write-host "Downloading Compressed Font: Hack"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Hack.zip -Outfile "$($env:USERPROFILE)\fontstemp\Hack.zip"
write-host "Successfully Downloaded Compressed Font: Hack"
    
write-host "Downloading Compressed Font: Hasklig"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Hasklig.zip -Outfile "$($env:USERPROFILE)\fontstemp\Hasklig.zip" 
write-host "Successfully Downloaded Compressed Font: Hasklig"
    
write-host "Downloading Compressed Font: Heavy Data"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/HeavyData.zip -Outfile "$($env:USERPROFILE)\fontstemp\HeavyData.zip"
write-host "Successfully Downloaded Compressed Font: Heavy Data"
    
write-host "Downloading Compressed Font: Hermit"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Hermit.zip -Outfile "$($env:USERPROFILE)\fontstemp\Hermit.zip"
write-host "Successfully Downloaded Compressed Font: Hermit"
    
write-host "Downloading Compressed Font: Inconsolata"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Inconsolata.zip -Outfile "$($env:USERPROFILE)\fontstemp\Inconsolata.zip"
write-host "Successfully Downloaded Compressed Font: Inconsolata"
    
write-host "Downloading Compressed Font: iA-Writer"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/iA-Writer.zip -Outfile "$($env:USERPROFILE)\fontstemp\iA-Writer.zip"
write-host "Successfully Downloaded Compressed Font: iA-Writer"
    
write-host "Downloading Compressed Font: Inconsolata Go"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/InconsolataGo.zip -Outfile "$($env:USERPROFILE)\fontstemp\InconsolataGo.zip"
write-host "Successfully Downloaded Compressed Font: Inconsolata Go"
    
write-host "Downloading Compressed Font: Inconsolata LGC"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/InconsolataLGC.zip -Outfile "$($env:USERPROFILE)\fontstemp\InconsolataLGC.zip"
write-host "Successfully Downloaded Compressed Font: Inconsolata LGC"
    
write-host "Downloading Compressed Font: Iosevka"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Iosevka.zip -Outfile "$($env:USERPROFILE)\fontstemp\Iosevka.zip"
write-host "Successfully Downloaded Compressed Font: Iosevka"
    
write-host "Downloading Compressed Font: Iosevka Terminal"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/IosevkaTerm.zip -Outfile "$($env:USERPROFILE)\fontstemp\IosevkaTerm.zip"
write-host "Successfully Downloaded Compressed Font: Iosevka Terminal"
    
write-host "Downloading Compressed Font: JetBrains Mono"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/JetBrainsMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\JetBrainsMono.zip"
write-host "Successfully Downloaded Compressed Font: JetBrains Mono"
    
write-host "Downloading Compressed Font: Lekton"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Lekton.zip -Outfile "$($env:USERPROFILE)\fontstemp\Lekton.zip"
write-host "Successfully Downloaded Compressed Font: Lekton"
    
write-host "Downloading Compressed Font: Liberation Mono"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/LiberationMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\LiberationMono.zip"
write-host "Successfully Downloaded Compressed Font: Liberation Mono"
    
write-host "Downloading Compressed Font: Lilex"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Lilex.zip -Outfile "$($env:USERPROFILE)\fontstemp\Lilex.zip"
write-host "Successfully Downloaded Compressed Font: Lilex"
    
write-host "Downloading Compressed Font: Meslo"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Meslo.zip -Outfile "$($env:USERPROFILE)\fontstemp\Meslo.zip"
write-host "Successfully Downloaded Compressed Font: Meslo"
    
write-host "Downloading Compressed Font: Monofur"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Monofur.zip -Outfile "$($env:USERPROFILE)\fontstemp\Monofur.zip"
write-host "Successfully Downloaded Compressed Font: Monofur"
    
write-host "Downloading Compressed Font: Monoid"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Monoid.zip -Outfile "$($env:USERPROFILE)\fontstemp\Monoid.zip"
write-host "Successfully Downloaded Compressed Font: Monoid"
    
write-host "Downloading Compressed Font: Mononoki"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Mononoki.zip -Outfile "$($env:USERPROFILE)\fontstemp\Mononoki.zip"
write-host "Successfully Downloaded Compressed Font: Mononoki"
    
write-host "Downloading Compressed Font: MPlus"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/MPlus.zip -Outfile "$($env:USERPROFILE)\fontstemp\MPlus.zip"
write-host "Successfully Downloaded Compressed Font: MPlus"
    
write-host "Downloading Compressed Font: Noto"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Noto.zip -Outfile "$($env:USERPROFILE)\fontstemp\Noto.zip"
write-host "Successfully Downloaded Compressed Font: Noto"
    
write-host "Downloading Compressed Font: Open Dyslexic"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/OpenDyslexic.zip -Outfile "$($env:USERPROFILE)\fontstemp\OpenDyslexic.zip"
write-host "Successfully Downloaded Compressed Font: Open Dyslexic"
    
write-host "Downloading Compressed Font: Overpass"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Overpass.zip -Outfile "$($env:USERPROFILE)\fontstemp\Overpass.zip"
write-host "Successfully Downloaded Compressed Font: Overpass"
    
write-host "Downloading Compressed Font: Pro Font"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/ProFont.zip -Outfile "$($env:USERPROFILE)\fontstemp\ProFont.zip"
write-host "Successfully Downloaded Compressed Font: Pro Font"
    
write-host "Downloading Compressed Font: Proggy Clean"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/ProggyClean.zip -Outfile "$($env:USERPROFILE)\fontstemp\ProggyClean.zip"
write-host "Successfully Downloaded Compressed Font: Proggy Clean"
    
write-host "Downloading Compressed Font: Roboto Mono"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/RobotoMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\RobotoMono.zip"
write-host "Successfully Downloaded Compressed Font: Roboto Mono"
    
write-host "Downloading Compressed Font: Share Tech Mono"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/ShareTechMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\ShareTechMono.zip"
write-host "Successfully Downloaded Compressed Font: Share Tech Mono"
    
write-host "Downloading Compressed Font: Source Code Pro"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/SourceCodePro.zip -Outfile "$($env:USERPROFILE)\fontstemp\SourceCodePro.zip"
write-host "Successfully Downloaded Compressed Font: Source Code Pro"
    
write-host "Downloading Compressed Font: Space Mono"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/SpaceMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\SpaceMono.zip"
write-host "Successfully Downloaded Compressed Font: Space Mono"
    
write-host "Downloading Compressed Font: Nerd Fonts Symbols Only"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/NerdFontsSymbolsOnly.zip -Outfile "$($env:USERPROFILE)\fontstemp\NerdFontsSymbolsOnly.zip"
write-host "Successfully Downloaded Compressed Font: Nerd Fonts Symbols Only"
    
write-host "Downloading Compressed Font: Terminus"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Terminus.zip -Outfile "$($env:USERPROFILE)\fontstemp\Terminus.zip"
write-host "Successfully Downloaded Compressed Font: Terminus"
    
write-host "Downloading Compressed Font: Tinos"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Tinos.zip -Outfile "$($env:USERPROFILE)\fontstemp\Tinos.zip"
write-host "Successfully Downloaded Compressed Font: Tinos"
    
write-host "Downloading Compressed Font: Ubuntu"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Ubuntu.zip -Outfile "$($env:USERPROFILE)\fontstemp\Ubuntu.zip"
write-host "Successfully Downloaded Compressed Font: Ubuntu"
    
write-host "Downloading Compressed Font: Ubuntu Mono"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/UbuntuMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\UbuntuMono.zip"
write-host "Successfully Downloaded Compressed Font: Ubuntu Mono"
    
write-host "Downloading Compressed Font: Victor Mono"
Invoke-WebRequest -uri https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/VictorMono.zip -Outfile "$($env:USERPROFILE)\fontstemp\VictorMono.zip"
write-host "Successfully Downloaded Compressed Font: Victor Mono"
    
# Enable Progress Bars
#    $ProgressPreference = 'Continue' 
   
# Decompress fonts
write-host "Decompressing Fonts"
New-Item -Path $env:USERPROFILE\fontstemp\decompressed -ItemType Directory -Force
Set-Location -Path $env:USERPROFILE
$FontFolder = "$($env:USERPROFILE)\fontstemp\decompressed"
Get-ChildItem "$($env:USERPROFILE)\fontstemp\" -Filter *.zip | Expand-Archive -DestinationPath $FontFolder -Force
$Font = Get-Item -Path $FontFolder
$FontList = Get-ChildItem -Path "$Font\*" -Include ('*.fon', '*.otf', '*.ttc', '*.ttf')
Set-Location -Path $env:USERPROFILE\fontstemp\decompressed
clear

# Install fonts    
foreach ($Font in $FontList) {
    Write-Host 'Installing font -' $Font.BaseName
    Copy-Item -Force $Font "C:\Windows\Fonts"
    New-ItemProperty -Name $Font.BaseName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $Font.name         
}
clear

# Remove temp folder
write-host "Performing Cleanup"
write-host "Removing temporary folders and files"
Set-Location $env:USERPROFILE
Remove-Item -Path fontstemp -Recurse
write-host "All temporary folders and files have been removed successfully"
write-host "Nerd Font installation has completed successfully"
    