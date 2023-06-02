$VMName=Get-ItemProperty "HKLM:\Software\Microsoft\Virtual Machine\guest\Parameters" | Select VirtualMachineName | ConvertTo-csv;
$VMFile = $VMName[2].substring(1,13) + ".txt"
$Val1 = (Get-Content D:\$VMFile).substring(1,2)
$Val2 = (Get-Content D:\$VMFile).substring(3,2)
$Val3 = (Get-Content D:\$VMFile).substring(5,2)
$Val4 = (Get-Content D:\$VMFile).substring(7,2)
$Val5 = (Get-Content D:\$VMFile).substring(9,2)
$Val6 = (Get-Content D:\$VMFile).substring(11,2)
$MACAddress = $Val1 + ":" + $Val2 + ":" + $Val3 + ":" + $Val4 + ":" + $Val5 + ":" + $Val6 
$NICS=GWMI Win32_NetworkAdapterConfiguration 
$NIC1=GWMI Win32_NetworkAdapterConfiguration | Where {$_.MACAddress -eq $MACADDress}
$NIC1.EnableStatic("192.168.10.100","255.255.255.0")
$NICS.SetDNSServerSearchOrder("192.168.10.100")
$NIC1.SetDNSDomain("contoso.com")
