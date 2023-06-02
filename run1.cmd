reg import a:\run2.reg
diskpart /s a:\dvddrive.txt
MD C:\Temp
MD D:\Temp
MD D:\Labfiles
MD D:\SharePoint\BadMail 
MD D:\SharePoint\Pickup
Xcopy A:\dcunattend.old a:\dcunattend.txt /v/y
Xcopy A:\*.* D:\Labfiles\ /s/v/y
Net Share Labfiles=D:\ /Grant:Everyone,Full
call powershell.exe -ExecutionPolicy Unrestricted -File a:\ServerConfig.ps1
call powershell.exe -ExecutionPolicy Unrestricted -File a:\ip.ps1
call powershell.exe -ExecutionPolicy Unrestricted -File a:\installdomain.ps1
Xcopy A:\profile.ps1 C:\Windows\System32\WindowsPowerShell\v1.0\ /v/y
shutdown /r /t 10
