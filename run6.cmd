reg import a:\run7.reg
timeout 15
call PowerShell.exe -ExecutionPolicy UnRestricted -File A:\SP_Software_FixFile.ps1
call PowerShell.exe -ExecutionPolicy UnRestricted -File A:\SP_Software_Config.ps1
call PowerShell.exe -ExecutionPolicy UnRestricted -File A:\SP_Software_Test.ps1
shutdown /r /t 10