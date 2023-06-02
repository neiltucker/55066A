echo off
cls
echo *****   Installing SQL Server 2012     *****
echo *****   Please wait while components are configured (20 - 30 minutes)     *****
echo .
echo .
echo .
D:\SQLServer\SQL2012\Setup.exe /INDICATEPROGRESS /IACCEPTSQLSERVERLICENSETERMS /QS /CONFIGURATIONFILE=D:\Labfiles\Install_SQLSERVER.INI
