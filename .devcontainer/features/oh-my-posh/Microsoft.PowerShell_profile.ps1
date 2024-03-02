# this file goes to .devcontainer/features/oh-my-posh/

Import-Module posh-git
Import-Module Terminal-Icons

Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

$env:POSH_GIT_ENABLED=$true
$env:POSH_THEME_FILE="%POSHTHEMEFILE%"

oh-my-posh prompt init pwsh --config $env:POSH_THEME_FILE | Invoke-Expression