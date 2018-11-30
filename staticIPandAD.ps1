New-NetIPAddress -InterfaceAlias "Wired Ethernet Connection" -IPv4Address "192.168.1.1" -PrefixLength 24 -DefaultGateway 192.168.1.254
Set-DnsClientServerAddress -InterfaceAlias "Wired Ethernet Connection" -ServerAddresses 192.168.1.1
Install-windowsfeature -name AD-Domain-Services -IncludeManagementTools
Install-ADDSDomainController -DomainName ritsec.com
