dnscmd /zoneadd 10.168.192.in-addr.arpa /dsprimary
dnscmd /zoneadd 20.168.192.in-addr.arpa /dsprimary
Set-DNSServerPrimaryZone -Name "contoso.com" -DynamicUpdate "NonsecureAndSecure" -PassThru
Set-DNSServerPrimaryZone -Name "10.168.192.in-addr.arpa" -DynamicUpdate "NonsecureAndSecure" -PassThru
Set-DNSServerPrimaryZone -Name "20.168.192.in-addr.arpa" -DynamicUpdate "NonsecureAndSecure" -PassThru
net stop dns
net start dns
Get-DNSServerRootHint | Remove-DNSServerRootHint -Force
net stop netlogon
net start netlogon