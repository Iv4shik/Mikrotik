## RouterBoard StartupMessage script need to be add in sheduler , <Start Time:> - startup.
## RouterOS 7.x
## VER 1.0
## Tested in RB951

#==========================================================================================
## !!!used TelegramSendMessage!!!

:delay 30; ## script starts in 30 seonds after boot

## VARS: name, model, date, time
:local HostName [/system/identity/get name]
:local Model [/system/routerboard/get model]
:local Date [/system/clock/get date]
:local Time [/system/clock/get time] 

## Resources VARS: uptime, cpu-load, firmware version
:local Uptime [/system/resource/get uptime]
:local CpuLoad [/system/resource/get cpu-load]
:local FWversion [/system/resource/get version]

## CLOUD VARS: dyndns name, public ip address (can be behind a NAT)
:local DNSname [/ip/cloud/get dns-name]
:local PublicAddress [/ip/cloud/get public-address]
:local NATwarning [/ip/cloud/get warning] ## behind NAT check

## message
:local MessageText "$HostName: $HostName ($Model) is ONLINE \
| DATE: $Date \
| TIME: $Time \
| UPTIME: $Uptime \
| CPU Load: $CpuLoad \
| FWversion: $FWversion \
| DNSname: $DNSname \
| PublicAddress: $PublicAddress $NATwarning\
"

##send function !!!used TelegramSendMessage!!! can find it in this repo
:local SendTelegramMessage [:parse [/system script get TelegramSendMessage source]];

$SendTelegramMessage MessageText=$MessageText;
