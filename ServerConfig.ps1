reg import D:\Labfiles\Server.reg
reg import D:\Labfiles\ie.reg

#   Configure Windows Explorer Settings
$VarWindowsExplorer = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
Set-ItemProperty $VarWindowsExplorer AlwaysShowMenus 1 -Force
Set-ItemProperty $VarWindowsExplorer FolderContentsInfoTip 1 -Force
Set-ItemProperty $VarWindowsExplorer Hidden 1 -Force
Set-ItemProperty $VarWindowsExplorer HideDrivesWithNoMedia 0 -Force
Set-ItemProperty $VarWindowsExplorer HideFileExt 0 -Force
Set-ItemProperty $VarWindowsExplorer IconsOnly 0 -Force
Set-ItemProperty $VarWindowsExplorer ShowSuperHidden 0 -Force
Set-ItemProperty $VarWindowsExplorer ShowStatusBar 1 -Force

#   Disable IE ESC
$VarAdministratorKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}"
$VarUserKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}"
Set-ItemProperty -Path $VarAdministratorKey -Name "IsInstalled" -Value 0
Set-ItemProperty -Path $VarUserKey -Name "IsInstalled" -Value 0

#   Configure Desktop Settings
$shell = New-Object -ComObject WScript.Shell
$Location = [System.Environment]::GetFolderPath('Desktop')
$Computer = $shell.CreateShortcut("$Location\ $env:ComputerName.lnk")
$Computer.TargetPath = "Explorer.exe"
$Computer.IconLocation = "imageres.dll,104"
$Computer.HotKey = "CTRL+ALT+E"
$Computer.Save()
$PowerShell = $shell.CreateShortcut("$Location\ PowerShell.lnk")
$PowerShell.TargetPath = "PowerShell.exe"
$PowerShell.IconLocation = "PowerShell.exe"
$PowerShell.HotKey = "CTRL+ALT+P"
$PowerShell.Save()
$PowerShell_ISE = $shell.CreateShortcut("$Location\ PowerShell_ISE.lnk")
$PowerShell_ISE.TargetPath = "PowerShell_ise.exe"
$PowerShell_ISE.IconLocation = "powershell_ise.exe"
$PowerShell_ISE.HotKey = "CTRL+ALT+I"
$PowerShell_ISE.Save()
$CMD = $shell.CreateShortcut("$Location\Command Prompt.lnk")
$CMD.TargetPath = "cmd.exe"
$CMD.IconLocation = "cmd.exe"
$CMD.HotKey = "CTRL+ALT+C"
$CMD.Save()
$CMD = $shell.CreateShortcut("$Location\Internet Explorer.lnk")
$CMD.TargetPath = "C:\Program Files\Internet Explorer\iexplore.exe"
$CMD.IconLocation = "C:\Program Files\Internet Explorer\iexplore.exe"
$CMD.HotKey = "CTRL+ALT+W"
$CMD.Save()
tzutil.exe /s "Eastern Standard Time"

#   Update PowerShell Help Files and PowerShell Remote Setttings
Enable-PSRemoting -Force
(GWMI -Class "Win32_TerminalServiceSetting" -Namespace Root\CimV2\TerminalServices).SetAllowTsConnections(1)
Netsh AdvFirewall Firewall Set Rule Group="Remote Desktop" New Enable=Yes
$PSHelp = Test-Path $PSHome\*helpinfo.xml; If ($PSHelp -eq $False) {Update-Help -SourcePath D:\PSHelp -Force -Verbose}
If (-Not(Get-WindowsFeature Net-Framework-Core).installed) {Install-WindowsFeature NET-Framework-Core –Source D:\Sources\SxS}

#   Disable IPv6
New-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters -Name DisabledComponents -PropertyType DWord -Value 0xffffffff -Force -ErrorAction SilentlyContinue
