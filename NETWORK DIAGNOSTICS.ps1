$randomnumber = Get-Random
$hostname = hostname
Start-Transcript "c:\temp\networktest$randomnumber.txt" -NoClobber
hostname
Get-ItemPropertyValue -Path 'HKCU:\SOFTWARE\Palo Alto Networks\GlobalProtect\Settings' -Name username
Get-ItemPropertyValue -Path 'HKLM:\SOFTWARE\Palo Alto Networks\GlobalProtect\PanSetup\PreLogonState' -Name ConnectedGateway
#Get-NetIPconfiguration -all | Where-Object{$_.InterfaceDescription -eq "PanGP Virtual Ethernet Adapter"}
Get-NetIPconfiguration -all | Where-Object {$_.ipv4defaultgateway -ne $null}
ping -n 20 google.com
ping -n 20 cloudfs
Resolve-DnsName cloudfs
Resolve-DnsName google.com
Invoke-RestMethod -Uri ('http://ipinfo.io/'+(Invoke-WebRequest -uri "http://ifconfig.me/ip").Content)
$hostnamelocation = Invoke-RestMethod -Uri ('http://ipinfo.io/'+(Invoke-WebRequest -uri "http://ifconfig.me/ip").Content) | select -ExpandProperty hostname
ping -n 20 $hostnamelocation
$a = "$env:LOGONSERVER"
$b = $a.Remove(0,2)
ping -n 20 $b
copy-item "C:\temp\networktest$randomnumber.txt" -Destination "\\cloudfs2\data\xTemp Transfer (Cleared regularly)"
Stop-Transcript
pause