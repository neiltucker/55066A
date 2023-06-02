#   Configure SharePoint Databases
$Key=(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24)
$FarmPassword = ConvertTo-SecureString -String "P@ssw0rd" -AsPlainText -Force
$SecureUser = "Contoso\SP_Farm"
$SecurePassword = Cat D:\Labfiles\password.txt | ConvertTo-SecureString -Key $Key
$FarmCredentials = New-Object –TypeName System.Management.Automation.PSCredential –ArgumentList $SecureUser, $SecurePassword

echo "Please wait while the SharePoint Databases are configured ..."
Add-PSSnapin Microsoft.SharePoint.PowerShell
New-SPConfigurationDatabase -DatabaseServer NYC-DC1 -DatabaseName "Contoso_SharePoint_Config" -AdministrationContentDatabaseName “Contoso_Admin_Content” -Passphrase $FarmPassword -FarmCredentials $FarmCredentials -Verbose

#   Enable SharePoint Features, Services, Applications and Help resources.
Install-SPFeature -AllExistingFeatures -Force -Verbose
Initialize-SPResourceSecurity
Install-SPService 
Install-SPApplicationContent
Install-SPHelpCollection –All

#Configure Web Application
Stop-Service SPTimerV4 -Force -Verbose
Start-Sleep 5
Get-ChildItem C:\ProgramData\Microsoft\SharePoint\Config -Force -Recurse -Include *.ini | Remove-Item -Force
Start-Service SPTimerV4 -Verbose
Start-Sleep 5
New-SPCentralAdministration -Port 8000 -WindowsAuthProvider "NTLM" -Verbose
New-SPWebApplication -Name "Contoso Intranet 800" -ApplicationPool "Contoso Intranet 800" -ApplicationPoolAccount "Contoso\SP_Farm" -Port 800 -Verbose
New-SPSite http://nyc-dc1:800/ -OwnerAlias Contoso\Administrator -Name "Contoso Intranet Team Site" -Template "STS#0"
New-SPWeb http://nyc-dc1:800/Search -Template "STS#1"
