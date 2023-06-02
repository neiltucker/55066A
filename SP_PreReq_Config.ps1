D:
cd \SharePoint\PreReq
cls
echo "*****   Installing SharePoint 2013 Required Components          *****"
echo "*****   Please wait while prerequisite programs are installed   *****"
Start-Sleep 5
Get-childItem D:\SharePoint\PreReq | UnBlock-File
Start-Sleep 5
Start-Process -Wait -NoNewWindow -PassThru -FilePath msiexec.exe -ArgumentList "/i D:\SharePoint\PreReq\sqlncli.msi /qb IACCEPTSQLNCLILICENSETERMS=YES"
Start-Sleep 5
Start-Process -Wait -NoNewWindow -PassThru -FilePath msiexec.exe -ArgumentList "/i D:\SharePoint\PreReq\Microsoftidentityextensions-64.msi /passive"
Start-Sleep 5
Start-Process -Wait -NoNewWindow -PassThru -FilePath msiexec.exe -ArgumentList "/i D:\SharePoint\PreReq\synchronization.msi /passive"
Start-Sleep 5
$AppFabricInstall="HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*AppFabric*" 
$AppFabricTest = Test-Path $AppFabricInstall; 
If ($AppFabricTest -eq $False) 
    {
    Start-Process -Wait -NoNewWindow -PassThru -FilePath D:\SharePoint\PreReq\WindowsServerAppFabricSetup_x64.exe -ArgumentList '/i CacheClient","CachingService","CacheAdmin /gac';
    Start-Sleep 5;
    Start-Process -Wait -NoNewWindow -PassThru -FilePath D:\SharePoint\PreReq\AppFabric1.1-RTM-KB2671763-x64-ENU.exe -ArgumentList '/s /norestart';
    Start-Sleep 5
    }
Start-Process -Wait -NoNewWindow -PassThru -FilePath msiexec.exe -ArgumentList '/i D:\SharePoint\PreReq\setup_msipc_x64.msi /passive'
Start-Sleep 5
Start-Process -Wait -NoNewWindow -PassThru -FilePath D:\SharePoint\PreReq\wcfdataservices.exe -ArgumentList "/q"
Start-Sleep 5
Start-Process -Wait -NoNewWindow -PassThru -FilePath Expand.exe -ArgumentList "D:\SharePoint\PreReq\Windows8-RT-KB2771431-x64.msu D:\SharePoint\PreReq -F:*"
Start-Process -Wait -NoNewWindow -PassThru -FilePath PkgMgr.exe -ArgumentList "/n:D:\SharePoint\PreReq\Windows8-RT-KB2771431-x64.xml /quiet /norestart"
