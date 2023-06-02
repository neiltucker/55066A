reg import a:\run3.reg
xcopy a:\profile.ps1 c:\windows\system32\windowspowershell\v1.0\ /v/y
rundll32 printui.dll,PrintUIEntry /if /f %windir%\inf\ntprint.inf /r "LPT1:" /m "HP LaserJet 9000 PCL6 Class Driver" /b "HPLJ9000" /Z "HPLJ9000"
rundll32 printui.dll,PrintUIEntry /if /f %windir%\inf\ntprint.inf /r "LPT2:" /m "HP LaserJet 9000 PCL6 Class Driver" /b "HPLJ9000_HR" /Z "HPLJ9000_HR"
net share Labfiles=D:\ /grant:Everyone,FULL
icacls D:\ /grant Everyone:F
call powershell.exe -ExecutionPolicy UnRestricted -File a:\dns.ps1
REM call powershell.exe -ExecutionPolicy Unrestricted -File a:\dhcp.ps1
call a:\ad.cmd
shutdown /r /t 10