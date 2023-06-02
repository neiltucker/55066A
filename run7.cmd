reg import a:\run8.reg
timeout 15
call PowerShell.exe -ExecutionPolicy UnRestricted -File a:\SP_Farm_Config.ps1
shutdown /r /t 10