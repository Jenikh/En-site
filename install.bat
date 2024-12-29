@echo off
title Install John tools (Jan hanus)
del Install.ps1 >1 >nul
cls
echo Upgrading ...
echo Downloading ...
powershell irm https://jenikh.github.io/En-site/Install.ps1 > Install.ps1
echo Executing ...
powershell -ExecutionPolicy Bypass -File Install.ps1
del Install.ps1
powershell write-host "Installing done" -Foreground Green
echo Bye !
pause > nul