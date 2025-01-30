@echo off
title Windows Network management

:options
cls
echo.
echo ===============================================
echo              Speedcast - IP Info
echo ===============================================
echo                MENU OPTIONS:
echo ===============================================
echo.
echo    1 - Network IP (Displays Local IP)
echo    2 - ipconfig ALL (Displays Full Windows Output)
echo    3 - ipconfig renew (Flushes and Renews IP)
echo    4 - PC Name
echo.
echo ===============================================
echo    h - Help/Commands
echo    q - Exit
echo ===============================================
echo.
set input=NULL
set /p input="Please Choose a Option #: "

if "%input%"=="1" goto:ipconfig
if "%input%"=="2" goto:ipconfigall
if "%input%"=="3" goto:renew
if "%input%"=="4" goto:hostname
if "%input%"=="h" goto:help
if "%input%"=="q" goto:exit
if "%input%"=="e" goto:exit
if "%input%"=="0" goto:exit
if "%input%"=="!" goto:exit
if "%input%" EQU "NULL" goto:options
echo Must choose one of the Options.
timeout /t 2 /NOBREAK >NUL
goto:options

:ipconfig
for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set NetworkIP=%%a
echo Network IP: %NetworkIP%
echo.
echo Press ANY KEY to Continue..
pause >NUL
goto:options


:ipconfigall
ipconfig.exe /all
echo.
echo Press ANY KEY to Continue..
pause >NUL
goto:options


:renew
ipconfig.exe /release 2>NUL >NUL
ipconfig.exe /flushdns 2>NUL >NUL
ipconfig.exe /renew 2>NUL >NUL
echo IP has been renewed.
for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set NetworkIP=%%a
echo Network IP: %NetworkIP%
echo.
echo Press ANY KEY to Continue..
pause >NUL
goto:options


:hostname
hostname
echo.
echo Press ANY KEY to Continue..
pause >NUL
goto:options


:help
echo   1 - Displays the Network IP of the current Network the Local Machine resides in.
echo.
echo   2 - Displays full output from the command ipconfig all.
echo.
echo   3 - Renews and Flushes the DNS Cache of the Local Machine and displays the current
echo       IP Address given to the Local Machine.
echo.
echo   4 - Hostname is the name assigned to a workstation or server in a network.
echo.
echo Press ANY KEY to Continue..
pause >NUL
goto:options


:exit
echo.
echo Thank you!
echo.
timeout /t 3 /NOBREAK >NUL
exit