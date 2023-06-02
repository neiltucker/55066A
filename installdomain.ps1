#  Install Contoso.com Domain
cls
echo "Install Contoso.com Domain"
$SecurePassword = ConvertTo-SecureString -AsPlainText Pa$$w0rd -Force
Install-WindowsFeature -Name AD-Domain-Services –IncludeManagementTools
Import-Module AddsDeployment
Install-ADDSForest -DomainName "contoso.com" -InstallDNS -DatabasePath "C:\Windows\NTDS" -SysvolPath "C:\Windows\SYSVOL" -LogPath "C:\Windows\LOGS" -SafeModeAdministratorPassword $SecurePassword -Force

