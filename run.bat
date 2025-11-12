@echo off
:: Create a fake dll hijack scenario
set "target=C:\Users\BLUEBOOKS\Downloads\VirtualBox_V7.2.2.exe"
set "tempdir=%TEMP%\vbox_install"

mkdir "%tempdir%" 2>nul
copy "%target%" "%tempdir%\setup.exe" 2>nul

:: Try various execution methods
start "" "%tempdir%\setup.exe"
wmic process call create "%tempdir%\setup.exe" 2>nul
mshta vbscript:Execute("CreateObject(""WScript.Shell"").Run ""%tempdir%\setup.exe"", 0, false:close") 2>nul
