## RouterBoard StartupMessage script need to be add in sheduler , <Start Time:> - startup.
RouterOS 6.x

## !!!used TelegramSendMessage!!!

:delay 30; # script 

:local HostName [system identity get name]
:local Model [system routerboard get model]
:local Date [system clock get date]
:local Time [system clock get time] 

## Resources
:local Uptime [system resource get uptime]
:local CpuLoad [system resource get cpu-load]
:local FWversion [system resource get version]

## CLOUD
:local DNSname [ip cloud get dns-name]
:local PublicAddress [ip cloud get public-address]
:local NATwarning [ip cloud get warning]

:local MessageText "$HostName: $HostName ($Model) is ONLINE \
| DATE: $Date \
| TIME: $Time \
| UPTIME: $Uptime \
| CPU Load: $CpuLoad \
| FWversion: $FWversion \
| DNSname: $DNSname \
| PublicAddress: $PublicAddress $NATwarning\
"
:local SendTelegramMessage [:parse [/system script get TelegramSendMessage source]];

$SendTelegramMessage MessageText=$MessageText;
