#!/bin/bash
set -e
# this file goes to .devcontainer/features/oh-my-posh/

# makre sure we have fzf installed
apt-get update && apt-get install -y fzf

# Install oh-my-posh:
curl -s https://ohmyposh.dev/install.sh | bash -s

# Copy oh-my-posh cache (and themes) from root to the vscode user:
mkdir -p "${_REMOTE_USER_HOME}/.cache/oh-my-posh"
cp -R "/root/.cache/oh-my-posh/" "${_REMOTE_USER_HOME}/.cache/"
chmod 777 -R ${_REMOTE_USER_HOME}/.cache

# Can be used to override the devcontainer prompt default theme:
POSH_THEME="${_REMOTE_USER_HOME}/.cache/oh-my-posh/themes/${DEFAULTTEMPLATE}.omp.json"

# Copy the pwsh profile file, but replace the selected theme while doing that:
mkdir -p "${_REMOTE_USER_HOME}/.config/powershell"
awk "{gsub(/%POSHTHEMEFILE%/, \"${POSH_THEME}\")}1" < Microsoft.PowerShell_profile.ps1 > "${_REMOTE_USER_HOME}/.config/powershell/Microsoft.PowerShell_profile.ps1"
awk "{gsub(/%POSHTHEMEFILE%/, \"${POSH_THEME}\")}1" < Microsoft.VSCode_profile.ps1 > "${_REMOTE_USER_HOME}/.config/powershell/Microsoft.VSCode_profile.ps1"

# make the .config folder and all files accessible (again)
chmod 777 -R "${_REMOTE_USER_HOME}/.config"