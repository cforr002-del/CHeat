@echo off
setlocal enabledelayedexpansion

:: Hide the command window
if not defined elevated (
    mshta vbscript:execute("CreateObject(""Shell.Application"").ShellExecute ""cmd.exe"", ""/c """"%~f0"""" ::""",,""runas"",1)(window.close)"&&exit
)

:: Now running as admin - proceed with hidden execution
powershell -window hidden -command "Start-Process 'your_target.exe' -WindowStyle Hidden"

:: Alternative method using PowerShell encoded command
set "payload=Start-Process 'your_target.exe' -WindowStyle Hidden -PassThru"
set "encoded="
for /f "delims=" %%i in ('echo %payload% ^| base64') do set encoded=%%i
powershell -window hidden -encodedcommand %encoded%
