reg import a:\run6.reg
timeout 15
call PowerShell.exe -ExecutionPolicy UnRestricted -File A:\SP_PreReq_Config.ps1
Shutdown /r /t 10