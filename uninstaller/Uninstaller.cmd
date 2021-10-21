@echo off
:@ Author 
:Mohamed Riadh BEN HMIDA
:www.linkedin.com/in/medriadh-benhmida

cd /d %~dp0

rmdir /S /Q %USERPROFILE%\PauseTimer

:Remove the shortcut in the Desktop
call del /Q /F %USERPROFILE%\Desktop\PauseTimer.lnk
:Remove the shortcut in the Startmenu

call del /Q /F "%USERPROFILE%\start menu\programs\PauseTimer.lnk"
:Remove app at windows startup

reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Run\ /v "PauseTimer" /f
:reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Run\ /v "PauseTimer" /f

call cscript msg.vbs

: remove all files from temp !
call del /Q /F *