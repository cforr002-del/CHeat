@echo off
:: Batch file to run PowerShell as Administrator

:: Check if running as admin
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: If already admin, open PowerShell
echo Running PowerShell as Administrator...
powershell -NoExit -Command "Write-Host 'PowerShell running as Administrator!' -ForegroundColor Green"
