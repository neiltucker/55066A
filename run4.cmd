reg import a:\run5.reg
timeout 15
call powershell.exe -ExecutionPolicy Unrestricted -File a:\SP_Features_Config.ps1
Shutdown /r /t 10
