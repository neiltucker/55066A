Install-WindowsFeature -IncludeManagementTools DHCP
Netsh dhcp add securitygroups
Restart-Service DHCPSERVER
Add-DHCPServerInDC NYC-DC1 192.168.10.100
netsh dhcp server import D:\Labfiles\dhcpdb12 all