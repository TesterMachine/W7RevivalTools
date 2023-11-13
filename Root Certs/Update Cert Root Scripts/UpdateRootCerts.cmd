@echo off
TITLE Root Certificate Store Updater
CLS

fsutil dirty query %systemdrive% >nul 2>&1
if ERRORLEVEL 1 (
 ECHO.
 ECHO =============================================
 ECHO This script needs Administrator permissions!
 ECHO.
 ECHO Please run it as the Administrator.
 ECHO =============================================
 ECHO.
 PAUSE >NUL
 goto end
)

ECHO.
ECHO Clearing AuthRoot store...
ECHO.

for /f "tokens=3 delims= " %%a in ('certutil -store authroot 2^>nul ^| findstr /l /c:"============"') do (
 CertUtil -delstore authroot 0 >nul 2>&1
)

ECHO.
ECHO Updating Root Certificates...
ECHO.

del /q /f "%TEMP%\roots.sst" >nul 2>&1
CertUtil -generateSSTFromWU "%TEMP%\roots.sst" && CertUtil -addstore -f root "%TEMP%\roots.sst" >nul 2>&1
del /q /f "%TEMP%\roots.sst" >nul 2>&1

ECHO.
ECHO Done!
ECHO.
PAUSE

:end
exit
