#!/bin/bash
sudo git config --system --add safe.directory "${containerWorkspaceFolder}"
sudo git config core.ignorecase false
sudo git config core.autocrlf true