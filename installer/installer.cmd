@echo off
:@ Author 
:Mohamed Riadh BEN HMIDA
:www.linkedin.com/in/medriadh-benhmida

cd /d %~dp0

if not exist %USERPROFILE%\PauseTimer mkdir %USERPROFILE%\PauseTimer

:Copy the Python Script
copy /Y PTlauncher.py %USERPROFILE%\PauseTimer\PTlauncher.py
attrib +R %USERPROFILE%\PauseTimer\PTlauncher.py

:Copy the shortcut icon
copy /Y PTicon.ico %USERPROFILE%\PauseTimer\PTicon.ico
attrib +H %USERPROFILE%\PauseTimer\PTicon.ico

:Copy the uninstaller
copy /Y Uninstaller.exe %USERPROFILE%\PauseTimer\Uninstaller.exe

:Add a shortcut to Desktop
copy /Y PauseTimer.lnk %USERPROFILE%\Desktop\PauseTimer.lnk

:Add a shortcut to Startmenu
copy /Y PauseTimer.lnk "%USERPROFILE%\start menu\programs\PauseTimer.lnk"

reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run\ /v "PauseTimer" /t REG_SZ /d "%USERPROFILE%\PauseTimer\PTlauncher.py" /f
:reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Run\ /v "PauseTimer" /t REG_SZ /d "%USERPROFILE%\PTlauncher.py /onboot" /f

call cscript msg.vbs

: remove all files from temp !
call del /Q /F *