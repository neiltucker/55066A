ldifde -k -i -f D:\Labfiles\contoso.ldf
dsadd user "CN=SP_Farm,CN=Users,DC=Contoso,DC=com"
dsadd user "CN=SP_Pool,CN=Users,DC=Contoso,DC=com"
dsadd user "CN=SP_Services,CN=Users,DC=Contoso,DC=com"
dsadd user "CN=SP_Crawl,CN=Users,DC=Contoso,DC=com"
dsadd user "CN=SP_UserProfiles,CN=Users,DC=Contoso,DC=com"
dsadd user "CN=SQLService,CN=Users,DC=Contoso,DC=com"
dsadd user "CN=MCTSetup,CN=Users,DC=Contoso,DC=com"
dsadd group "CN=Classroom Administrators,OU=Classroom,DC=Contoso,DC=com"
dsadd user "CN=Admin1,OU=Users,OU=Classroom,DC=Contoso,DC=com"
dsadd user "CN=User1,OU=Users,OU=Classroom,DC=Contoso,DC=com"
dsadd user "CN=Contractor1,OU=Contractors,OU=Classroom,DC=Contoso,DC=com"
net group "Classroom Administrators" Admin1 /Add
net group "Enterprise Admins" SQLService Admin1 /Add
net group "Domain Admins" SQLService Admin1 /Add
dsadd computer "CN=Virtual1,OU=Computers,OU=Classroom,DC=Contoso,DC=com"
dsadd computer "CN=Computer1,OU=Computers,OU=Classroom,DC=Contoso,DC=com"
dsacls "OU=Classroom,DC=Contoso,DC=Com" /G "Classroom Administrators":GA /I:T
dsmod user "CN=SP_Farm,CN=Users,DC=Contoso,DC=com" -upn sp_farm@contoso.com -pwd Pa$$w0rd -mustchpwd no -disabled no
dsmod user "CN=SP_Pool,CN=Users,DC=Contoso,DC=com" -upn sp_pool@contoso.com -pwd Pa$$w0rd -mustchpwd no -disabled no
dsmod user "CN=SP_Services,CN=Users,DC=Contoso,DC=com" -upn sp_services@contoso.com -pwd Pa$$w0rd -mustchpwd no -disabled no
dsmod user "CN=SP_Crawl,CN=Users,DC=Contoso,DC=com" -upn sp_crawl@contoso.com -pwd Pa$$w0rd -mustchpwd no -disabled no
dsmod user "CN=SP_UserProfiles,CN=Users,DC=Contoso,DC=com" -upn sp_UserProfiles@contoso.com -pwd Pa$$w0rd -mustchpwd no -disabled no
dsmod user "CN=SQLService,CN=Users,DC=Contoso,DC=com" -upn sqlservice@contoso.com -pwd Pa$$w0rd -mustchpwd no -disabled no
dsmod user "CN=MCTSetup,CN=Users,DC=Contoso,DC=com" -upn mctsetup@contoso.com -pwd Pa$$w0rd -mustchpwd no -disabled no
dsmod user "CN=Admin1,OU=Users,OU=Classroom,DC=Contoso,DC=com" -upn admin1@contoso.com -pwd Pa$$w0rd -mustchpwd no -disabled no
dsmod user "CN=User1,OU=Users,OU=Classroom,DC=Contoso,DC=com" -upn user1@contoso.com -pwd Pa$$w0rd -mustchpwd no -disabled no
dsmod user "CN=Contractor1,OU=Contractors,OU=Classroom,DC=Contoso,DC=com" -upn contractor1@contoso.com -pwd Pa$$w0rd -mustchpwd no -disabled yes
call powershell.exe -Command "Import-Module ActiveDirectory; Get-AdGroup 'Remote Desktop Users' | Add-AdGroupMember -Members (Get-AdGroup 'Domain Admins')"
