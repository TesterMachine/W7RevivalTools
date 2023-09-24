@Echo off
TITLE Update and Revoked Roots
SETLOCAL EnableDelayedExpansion
MODE CON COLS=85 LINES=20


IF /I "%*"=="/S" (
  CALL:DwnRoots
  CALL:UpdRoots
) ELSE (
  CALL:Menu
  ECHO. & ECHO Press any key to exit...
  PAUSE >nul
)
EXIT


:Menu
 CLS
 ECHO. & ECHO Root certificates:
 ECHO.
 ECHO   1. Download and update
 ECHO   2. Download only
 ECHO   3. Certificate manager
 ECHO   0. EXIT
 ECHO.
 SET CHOICE=
 SET /P CHOICE="Make a choice => "
 IF "%CHOICE%"=="1" CALL:DwnRoots & GOTO:UpdRoots
 IF "%CHOICE%"=="2" GOTO:DwnRoots
 IF "%CHOICE%"=="3" START CertMgr.msc & GOTO:Menu
 IF "%CHOICE%"=="0" EXIT
GOTO:Menu


:DwnRoots
 CLS
 PING >nul -n 1 8.8.8.8 || (
   FOR %%I IN (authroots.sst delroots.sst roots.sst updroots.sst disallowedcert.sst) DO IF NOT EXIST "%SFXDir%\%%I" (
     ECHO. & ECHO No network access, check your internet connection.
     GOTO:EOF
   )
   SET "DwnPath=%SFXDir%"
   GOTO:EOF
 )
 SET "DwnPath=%~dp0"
 IF "%CHOICE%"=="2" (
   ECHO.
   SET DwnPath=
   SET /P DwnPath="Enter the download path => "
   SET "DwnPath=!DwnPath:"=!"
   IF NOT EXIST !DwnPath! (
     ECHO. & ECHO The path entered is not correct. & ECHO.
     PAUSE
     GOTO:Menu
   )
 )
 ECHO. & ECHO Downloading... & ECHO.
 FOR %%I IN (authroots.sst, delroots.sst, roots.sst, updroots.sst, disallowedcert.sst) DO (
   CSCRIPT //NoLogo wget.vbs "http://download.windowsupdate.com/msdownload/update/v3/static/trustedr/en/%%I" "%DwnPath%"
 )
GOTO:EOF


:UpdRoots
 IF NOT EXIST "%DwnPath%\*.sst" GOTO:EOF
 ECHO. & ECHO Applying...
 updroots.exe "%DwnPath%\authroots.sst"
 updroots.exe "%DwnPath%\updroots.sst"
 updroots.exe -l "%DwnPath%\roots.sst"
 updroots.exe -d "%DwnPath%\delroots.sst"
 updroots.exe -l -u "%DwnPath%\disallowedcert.sst"
 ECHO. & ECHO Done^^!
GOTO:EOF
