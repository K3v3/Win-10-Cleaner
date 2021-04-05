SET version=v1.1
SET title=Win 10 Cleaner powered by Kev
title %title% %version%

REM Rechte abfragen und mit erhoehten Rechten starten
:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )
 
:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
 
setlocal DisableDelayedExpansion
set "batchPath=%~0"
setlocal EnableDelayedExpansion
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"
ECHO args = "ELEV " >> "%temp%\OEgetPrivileges.vbs"
ECHO For Each strArg in WScript.Arguments >> "%temp%\OEgetPrivileges.vbs"
ECHO args = args ^& strArg ^& " "  >> "%temp%\OEgetPrivileges.vbs"
ECHO Next >> "%temp%\OEgetPrivileges.vbs"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs"
"%SystemRoot%\System32\WScript.exe" "%temp%\OEgetPrivileges.vbs" %*
exit /B 

:gotPrivileges

:winCleaner
cls
@echo off
echo ----------------------------------
echo Win 10 Cleaner powered by Kev %version%
echo ----------------------------------
timeout /T 5
REM *********************************************************************************
DEL /F/S/Q "C:\Users\%Username%\AppData\Local\temp\*.*"
DEL /F/S/Q "%windir%\Temp\*.*"
DEL /F/S/Q "C:\Temp\*.*"
REM *********************************************************************************
timeout /T 3

cls
echo -------------------------------------------
echo Win 10 intensiv Cleaner powered by Kev %version%
echo -------------------------------------------
echo.
REM pause>nul
echo ---Um den intensiv Cleaner zu starten y benutzen!---
set /p auswahl=""
if "%auswahl%"=="y" goto intensivCleaner
goto Ende
:intensivCleaner
REM *********************************************************************************
REM Windows Temps
echo.
echo -WindowsTemps-
REM DISM.exe /Online /Cleanup-Image /spsuperseded
DEL /F/S/Q "%windir%\SoftwareDistribution\Download\*.*"
DEL /F/S/Q "%windir%\Logs\*.*"
DEL /F/S/Q "%windir%\msdownld.tmp\*.*"
DEL /F/S/Q "%windir%\tracing\*.*"
DEL /F/S/Q "%windir%\rescache\*.*"
DEL /F/S/Q "%windir%\Offline Web Pages\*.*"
DEL /F/S/Q "%windir%\SchCache\*.*"
DEL /F/S/Q "%windir%\ModemLogs\*.*"
DEL /F/S/Q "%windir%\Performance\*.*"
DEL /F/S/Q "C:\Users\%Username%\AppData\Local\Microsoft\Windows\Explorer\ThumbCacheToDelete\*.tmp"
RD /S/Q "C:\Users\%Username%\AppData\Local\Microsoft\Windows\Burn"

REM Windows Logs
echo.
echo -Windows Logs-
DEL /S/Q "%windir%\comsetup.log"
DEL /S/Q "%windir%\IE11_main.log"
DEL /S/Q "%windir%\iis.log"
DEL /S/Q "%windir%\PFRO.log"
DEL /S/Q "%windir%\setupact.log"
DEL /S/Q "%windir%\setuperr.log"
DEL /S/Q "%windir%\WindowsUpdate.log"
DEL /S/Q "%windir%\wsusofflineupdate.log"
DEL /S/Q "%windir%\DirectX.log"
DEL /S/Q "%windir%\DPINST.LOG"
DEL /S/Q "%windir%\DtcInstall.log"
DEL /S/Q "%windir%\ntbtlog.txt"
DEL /S/Q "%windir%\System32\NetSetupMig.log"
DEL /S/Q "C:\Users\%Username%\AppData\Local\Microsoft\Windows Mail\edb.log"
DEL /S/Q "C:\Users\%Username%\AppData\Local\Microsoft\Windows Mail\edb00001.log"

REM Software Temps
echo.
echo -Software Temps-
DEL /F/S/Q "%programfiles%\NVIDIA Corporation\Installer2\*.*"
RD /S/Q "C:\NVIDIA"
DEL /F/S/Q "C:\Program Files (x86)\Dropbox\Update\Download\*.*"
DEL /F/S/Q "C:\Program Files (x86)\Dropbox\CrashReports\*.*"
DEL /F/S/Q "C:\Program Files (x86)\Google\Temp\*.*"
RD /S/Q "C:\Program Files (x86)\GUM5EB2.tmp"
DEL /F/S/Q "C:\Program Files (x86)\TeamViewer\TeamViewer15_Logfile.log"
DEL /F/S/Q "C:\Users\%Username%\AppData\Roaming\TeamViewer\TeamViewer12_Logfile.log"
DEL /F/S/Q "C:\Users\%Username%\AppData\Roaming\TeamViewer\TeamViewer15_Logfile.log"
DEL /F/S/Q "C:\ProgramData\Dropbox\Update\Log\*.*"
DEL /F/S/Q "C:\Users\%Username%\AppData\Roaming\Mozilla\Firefox\Crash Reports\*.*"
DEL /F/S/Q "C:\ProgramData\Razer\Synapse\ProductUpdates\Downloads\*.*"
DEL /F/S/Q "C:\ProgramData\Razer\Synapse\Logs\*.*"
DEL /F/S/Q "C:\ProgramData\Binary Fortress Software\DisplayFusion\DisplayFusion.log"
DEL /F/S/Q "C:\ProgramData\Binary Fortress Software\DisplayFusion\Setup.log"
DEL /F/S/Q "C:\Users\%Username%\AppData\Local\SquirrelTemp\*.log"
DEL /F/S/Q "C:\Users\%Username%\AppData\Local\TileDataLayer\Database\*.log"
DEL /F/S/Q "C:\Users\%Username%\Documents\Any Video Converter\Temp\*.*"
DEL /F/S/Q "C:\Users\%Username%\.VirtualBox\*.log"

REM Crash Dumps
echo.
echo -Crash Dumps-
DEL /F/S/Q "C:\Users\%Username%\AppData\Local\CrashDumps\*.dmp"
DEL /F/S/Q "C:\Program Files (x86)\Steam\dumps\*.dmp"
DEL /F/S/Q "C:\Program Files (x86)\Steam\dumps\reports\*.dmp"
DEL /F/S/Q "C:\Users\%Username%\AppData\Roaming\Thunderbird\Crash Reports\pending\*.dmp"

REM Unuetze Ordner
echo.
echo -Unuetze Ordner-
RD /S/Q "C:\ProgramData\firebird"
RD /S/Q "C:\Users\%Username%\MicrosoftEdgeBackups"
RD /S/Q "C:\Users\%Username%\Documents\ProfileCache"


REM Unuetze Favoriten
echo.
echo -Unuetze Favoriten-
DEL /F/S/Q "C:\Users\%Username%\Favorites\Microsoft-Websites\*.*"
DEL /F/S/Q "C:\Users\%Username%\Favorites\MSN-Websites\*.*"
DEL /F/S/Q "C:\Users\%Username%\Favorites\Windows Live\*.*"

REM *********************************************************************************
goto Ende

:ipCleaner
ipconfig /flushdns

:Ende
cls
echo ---------------------------------
echo Win 10 Cleaner powered by Kev %version%
echo ---------------------------------
echo.
echo ------ Erfolgreich ausgefuehrt ------
echo.
echo --Programm wird automatisch beendet--
timeout /T 15
exit

:Fehler
cls
echo ---------------------------------
echo Win 10 Cleaner powered by Kev %version%
echo ---------------------------------
echo.
echo ------------ FEHLER ------------
echo.
echo --Programm wird automatisch beendet--
timeout /T 15
exit