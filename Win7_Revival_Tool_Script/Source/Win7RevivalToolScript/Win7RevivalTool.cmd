@echo off
title Win7 Revival Tool v1.0.0 - by [TesterMachine]
call :IsAdmin
SETLOCAL EnableDelayedExpansion
MODE CON: COLS=120 LINES=32


if exist "%WinDir%\SysWOW64" (
	set ARCH=x64
) else (
	set ARCH=x86
)

:Language
echo. What language are you going to use?
echo. Que idioma vas a usar?
echo. 
echo. [S] Spanish
echo. [E] English
echo.
choice /C:ES /N /M "Choose an option - ESCOGE UNA OPCION [#]: "
if errorlevel 2 goto :LanguageES
if errorlevel 1 goto :LanguageEN

:LanguageES
rem aplicar traduccion en Español
set MessageNetworkWait= Comprobando tu conexion a internet, Por favor espere..
set MessageNetworOFF= No tienes conexion a internet. Verifique su conexion a WiFi o LAN para poder continuar.
set MessageNetworOK= Conextion a Internet: OK
set MessageDownload= Descargando Navegador Selecionado..
set MessageInstalling= Instalando, Por favor Espere..
set MessageInstalled= Instalado Correctamente.
set MessageRootCertsWait=Actualizando Certificados Raiz, Por favor espere..
set MessageRootCertsFinished=Certificados Raiz Actualizados Correctamente.
set menu=:menuES
set menu2=:menu2ES

rem iniciar menu
goto %menu%

:LanguageEN
rem apply translation in English
set MessageNetworkWait= Checking your internet connection, please wait..
set MessageNetworOFF= You don't have an internet connection. Check your WiFi or LAN connection to continue.
set MessageNetworOK= Internet connection: OK
set MessageDownload= Downloading Selected Browser..
set MessageInstalling= Installing, Please Wait..
set MessageInstalled= Installed Correctly.
set MessageRootCertsWait=Updating Root Certificates, Please wait..
set MessageRootCertsFinished=Root Certificates Updated Correctly.
set menu=:menuEN
set menu2=:menu2EN

rem start menu
goto %menu%


:menuES
cls
echo.
echo( #     #          #######    ######                                          #######                
echo( #  #  # # #    # #    #     #     # ###### #    # # #    #   ##   #            #     ####   ####  #
echo( #  #  # # ##   #     #      #     # #      #    # # #    #  #  #  #            #    #    # #    # # 
echo( #  #  # # # #  #    #       ######  #####  #    # # #    # #    # #            #    #    # #    # #
echo( #  #  # # #  # #   #        #   #   #      #    # # #    # ###### #            #    #    # #    # #
echo( #  #  # # #   ##   #        #    #  #       #  #  #  #  #  #    # #            #    #    # #    # #
echo(  ## ##  # #    #   #        #     # ######   ##   #   ##   #    # ######       #     ####   ####  ######
echo.
echo.                                     Ver: v1.0.0
echo.                 
echo.                                  B I E N V E N I D O
echo.
echo.                 E L I G E  U N A  O P C I O N  P A R A  C O N T I N U A R:
echo.
echo          [1] Actualizar Certificados Raiz
echo.
echo.     N A V E G A D O R E S  C O M P A T I B L E S :  (REQUIERE CONEXION A INTERNET)
echo.
echo          [2] Descargar e Instalar Brave Browser    [5] Descargar e Instalar Google Chrome
echo.
echo.
echo          [3] Descargar e Instalar Supermiun        [6] Descargar e Instalar Slimjet Browser
echo.
echo.
echo          [4] Descargar e Instalar Microsoft Edge   [7] Otros Navegadores
echo.
echo.
echo.                                            [X] Salir
echo.
echo.
choice /C:1234567X /N /M "ESCOGE UNA OPCION [#]: "
if errorlevel 8 goto :quit
if errorlevel 7 goto %menu2%
if errorlevel 6 goto :Slimjet
if errorlevel 5 goto :Chrome
if errorlevel 4 goto :Edge
if errorlevel 3 goto :Supermiun
if errorlevel 2 goto :BraveBrowser
if errorlevel 1 goto :UpdateRootsCerts

:menuEN
cls
echo.
echo( #     #          #######    ######                                          #######                 
echo( #  #  # # #    # #    #     #     # ###### #    # # #    #   ##   #            #     ####   ####  #
echo( #  #  # # ##   #     #      #     # #      #    # # #    #  #  #  #            #    #    # #    # #
echo( #  #  # # # #  #    #       ######  #####  #    # # #    # #    # #            #    #    # #    # #
echo( #  #  # # #  # #   #        #   #   #      #    # # #    # ###### #            #    #    # #    # #
echo( #  #  # # #   ##   #        #    #  #       #  #  #  #  #  #    # #            #    #    # #    # #
echo(  ## ##  # #    #   #        #     # ######   ##   #   ##   #    # ######       #     ####   ####  ######
echo.
echo.                                  Ver: v1.0.0
echo.                 
echo.                                  W E L C O M E
echo.
echo.                 C H O O S E  A N  O P T I O N  T O  C O N T I N U E:
echo.
echo          [1] Update Root Certificates
echo.
echo.     C O M P A T I B L E  B R O W S E R S :  (INTERNET CONNECTION REQUIRED)
echo.
echo          [2] Download and Install Brave Browser    [5] Download and Install Google Chrome
echo.
echo.
echo          [3] Download and Install Supermiun        [6] Download and Install Slimjet Browser
echo.
echo.
echo          [4] Download and Install Microsoft Edge   [7] Other Browsers
echo.
echo.
echo.                                            [X] Exit
echo.
echo.
choice /C:12345678X /N /M "Choose an option [#]: "
if errorlevel 8 goto :quit
if errorlevel 7 goto %menu2%
if errorlevel 6 goto :Slimjet
if errorlevel 5 goto :Chrome
if errorlevel 4 goto :Edge
if errorlevel 3 goto :Supermiun
if errorlevel 2 goto :BraveBrowser
if errorlevel 1 goto :UpdateRootsCerts


:menu2ES
Cls
echo. #########################################################################
echo.
echo. MAS NAVEGADORES COMPATIBLES CON WINDOWS 7 (REQUIERE CONEXION A INTERNET)
echo.
echo. #########################################################################
echo.
echo. BASADOS EN MOZILLA:               BASADOS EN CHROMIUM:
echo.
echo. [1] Palemoon                      [2] Chromium
echo.                                   [3] Opera
echo.                                   [4] CentBrowser
echo.
echo.                 [X] Volver al Menu
echo.

choice /C:1234X /N /M "ESCOGE UNA OPCION [#]: "
if errorlevel 5 goto %menu%
if errorlevel 4 goto :CentBrowser
if errorlevel 3 goto :Opera
if errorlevel 2 goto :Chromium
if errorlevel 1 goto :Palemoon


:menu2EN
Cls
echo. #########################################################################
echo.
echo. MORE BROWSERS COMPATIBLE WITH WINDOWS 7 (INTERNET CONNECTION REQUIRED)
echo.
echo. #########################################################################
echo.
echo. BASED IN MOZILLA:               BASED IN CHROMIUM:
echo.
echo. [1] Palemoon                      [2] Chromium
echo.                                   [3] Opera
echo.                                   [4] CentBrowser
echo.
echo.                 [X] Back to Menu
echo.

choice /C:1234X /N /M "Choose an option [#]: "
if errorlevel 5 goto %menu%
if errorlevel 4 goto :CentBrowser
if errorlevel 3 goto :Opera
if errorlevel 2 goto :Chromium
if errorlevel 1 goto :Palemoon

:UpdateRootsCerts
Cls
echo %MessageNetworkWait%
ping > nul -n 1 www.google.com 
if errorlevel 1 (
    cls
    echo %MessageNetworOFF%
	echo.
	pause
	goto %menu%
) else (
cls
echo %MessageNetworOK%
echo.
start /wait "Win7RevivalTool: Cert Roots Updater" "%~dp0Bin\Cert_Updater.exe" /aic | echo %MessageRootCertsWait% & cls & echo %MessageRootCertsFinished% & pause
echo.
goto %menu%
)

:Edge
cls
IF "%ARCH%"=="x86" (
    echo %MessageDownload%
    start /wait "Win7RevivalTool: Downloader" "%~dp0Bin\Aria2\%ARCH%\aria2c.exe" -d %temp% https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/dc4f8255-2ad7-4ab0-a32e-189a2141eec7/MicrosoftEdgeEnterpriseX86.msi
	cls
	echo %MessageInstalling%
	echo.
	"%temp%\MicrosoftEdgeEnterpriseX86.msi" /qb /norestart
	del "%temp%\MicrosoftEdgeEnterpriseX86.msi" >nul
	cls
	echo Microsoft Edge %MessageInstalled%
	pause
	goto %menu%
) ELSE (
    echo %MessageDownload%
    start /wait "Win7RevivalTool: Downloader" "%~dp0Bin\Aria2\%ARCH%\aria2c.exe" -d %temp% https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a37eade6-cd7b-42ab-94d0-307b9e6ec4c0/MicrosoftEdgeEnterpriseX64.msi
	cls
	echo %MessageInstalling%
	echo.
	"%temp%\MicrosoftEdgeEnterpriseX64.msi" /qb /norestart
	del "%temp%\MicrosoftEdgeEnterpriseX64.msi" >nul
	cls
	echo Microsoft Edge %MessageInstalled%
	pause
	goto %menu%
)

:Supermiun
cls
IF "%ARCH%"=="x86" (
    echo %MessageDownload%
    start /wait "Win7RevivalTool: Downloader" "%~dp0Bin\Aria2\%ARCH%\aria2c.exe" -d %temp% https://github.com/win32ss/supermium/releases/download/v118/mini_installer_32.exe
	cls
	echo %MessageInstalling%
	echo.
	"%temp%\mini_installer_32.exe"
	taskkill /f /im chrome.exe >nul 2>&1
	del "%temp%\mini_installer_32.exe" >nul
	cls
	echo Supermiun %MessageInstalled%
	pause
	goto %menu%
) ELSE (
    echo %MessageDownload%
    start /wait "Win7RevivalTool: Downloader" "%~dp0Bin\Aria2\%ARCH%\aria2c.exe" -d %temp% https://github.com/win32ss/supermium/releases/download/v118/mini_installer_64.exe
	cls
	echo %MessageInstalling%
	echo.
	"%temp%\mini_installer_64.exe"
	taskkill /f /im chrome.exe >nul 2>&1
	del "%temp%\mini_installer_64.exe" >nul
	cls
	echo Supermiun %MessageInstalled%
	pause
	goto %menu%
)

:BraveBrowser
cls
IF "%ARCH%"=="x86" (
    echo %MessageDownload%
    start /wait "Win7RevivalTool: Downloader" "%~dp0Bin\Aria2\%ARCH%\aria2c.exe" -d %temp% https://github.com/brave/brave-browser/releases/download/v1.47.186/BraveBrowserStandaloneSilentSetup32.exe
	cls
	echo %MessageInstalling%
	echo.
	"%temp%\BraveBrowserStandaloneSilentSetup32.exe"
	taskkill /f /im brave.exe >nul 2>&1
	del "%temp%\BraveBrowserStandaloneSilentSetup32.exe" >nul
	cls
	echo Brave %MessageInstalled%
	pause
	goto %menu%
) ELSE (
    echo %MessageDownload%
    start /wait "Win7RevivalTool: Downloader" "%~dp0Bin\Aria2\%ARCH%\aria2c.exe" -d %temp% https://github.com/brave/brave-browser/releases/download/v1.47.186/BraveBrowserStandaloneSilentSetup.exe
	cls
	echo %MessageInstalling%
	echo.
	"%temp%\BraveBrowserStandaloneSilentSetup.exe"
	taskkill /f /im brave.exe >nul 2>&1
	del "%temp%\BraveBrowserStandaloneSilentSetup.exe" >nul
	cls
	echo Brave %MessageInstalled%
	pause
	goto %menu%
)

:Chrome
cls
IF "%ARCH%"=="x86" (
    echo %MessageDownload%
    start /wait "Win7RevivalTool: Downloader" "%~dp0Bin\Aria2\%ARCH%\aria2c.exe" -d %temp% https://dl.google.com/release2/chrome/adj6vsv5wkrolezapn7slzvjun2a_109.0.5414.165/109.0.5414.165_chrome_installer.exe
	cls
	echo %MessageInstalling%
	echo.
	"%temp%\109.0.5414.165_chrome_installer.exe"
	taskkill /f /im chrome.exe >nul 2>&1
	del "%temp%\109.0.5414.165_chrome_installer.exe" >nul
	cls
	echo Google Chrome %MessageInstalled%
	pause
	goto %menu%
) ELSE (
    echo %MessageDownload%
    start /wait "Win7RevivalTool: Downloader" "%~dp0Bin\Aria2\%ARCH%\aria2c.exe" -d %temp% https://www.google.com/dl/release2/chrome/ggsdppo5kshsyqe3fej7lv4tau_109.0.5414.165/109.0.5414.165_chrome_installer.exe
	cls
	echo %MessageInstalling%
	echo.
	"%temp%\109.0.5414.165_chrome_installer.exe"
	taskkill /f /im chrome.exe >nul 2>&1
	del "%temp%\109.0.5414.165_chrome_installer.exe" >nul
	cls
	echo Google Chrome %MessageInstalled%
	pause
	goto %menu%
)

:Slimjet
cls
IF "%ARCH%"=="x86" (
    echo %MessageDownload%
    start /wait "Win7RevivalTool: Downloader" "%~dp0Bin\Aria2\%ARCH%\aria2c.exe" -d %temp% http://www.slimjetbrowser.com/release/archive/38.0.9.0/sjtsetup_x86.exe
	cls
	echo %MessageInstalling%
	echo.
	"%temp%\sjtsetup_x86.exe" /S
	taskkill /F /IM slimjet.exe /T >nul 2>&1
	del "%temp%\sjtsetup_x86.exe" >nul
	cls
	echo Slimjet Browser %MessageInstalled%
	pause
	goto %menu%
) ELSE (
    echo %MessageDownload%
    start /wait "Win7RevivalTool: Downloader" "%~dp0Bin\Aria2\%ARCH%\aria2c.exe" -d %temp% http://www.slimjetbrowser.com/release/archive/38.0.9.0/sjtsetup_x64.exe
	cls
	echo %MessageInstalling%
	echo.
	"%temp%\sjtsetup_x64.exe" /S
	taskkill /F /IM slimjet.exe /T >nul 2>&1
	del "%temp%\sjtsetup_x64.exe" >nul
	cls
	echo Slimjet Browser %MessageInstalled%
	pause
	goto %menu%
)

:Palemoon
call :VERYNETWORK
cls
IF "%ARCH%"=="x86" (
    echo %MessageDownload%
	start /wait "Win7RevivalTool: Downloader" "%~dp0Bin\Aria2\%ARCH%\aria2c.exe" -d %temp% https://archive.palemoon.org/palemoon/32.x/32.4.0.1/palemoon-32.4.0.1.win32.installer.exe
	cls
	echo %MessageInstalling%
	echo.
	"%temp%\palemoon-32.4.0.1.win32.installer.exe" /s
	del "%temp%\palemoon-32.4.0.1.win32.installer.exe" >nul
	cls
	echo PaleMoon %MessageInstalled%
	pause
	goto %menu2%
) ELSE (
    echo %MessageDownload%
	start /wait "Win7RevivalTool: Downloader" "%~dp0Bin\Aria2\%ARCH%\aria2c.exe" -d %temp% https://archive.palemoon.org/palemoon/32.x/32.4.0.1/palemoon-32.4.0.1.win64.installer.exe
	cls
	echo %MessageInstalling%
	echo.
	"%temp%\palemoon-32.4.0.1.win64.installer.exe" /s
	del "%temp%\palemoon-32.4.0.1.win64.installer.exe" >nul
	cls
	echo PaleMoon %MessageInstalled%
	pause
	goto %menu2%
)

:Chromium
call :VERYNETWORK
cls
IF "%ARCH%"=="x86" (
    echo %MessageDownload%
	start /wait "Win7RevivalTool: Downloader" "%~dp0Bin\Aria2\%ARCH%\aria2c.exe" -d %temp% https://github.com/Hibbiki/chromium-win32/releases/download/v109.0.5414.120-r1070088/mini_installer.sync.exe
	cls
	echo %MessageInstalling%
	echo.
	"%temp%\mini_installer.sync.exe" /s
	taskkill /f /im chrome.exe >nul 2>&1
	del "%temp%\mini_installer.sync.exe" >nul
	cls
	echo Chromium %MessageInstalled%
	pause
	goto %menu2%
) ELSE (
    echo %MessageDownload%
	start /wait "Win7RevivalTool: Downloader" "%~dp0Bin\Aria2\%ARCH%\aria2c.exe" -d %temp% https://github.com/Hibbiki/chromium-win64/releases/download/v109.0.5414.120-r1070088/mini_installer.sync.exe
	cls
	echo %MessageInstalling%
	echo.
	"%temp%\mini_installer.sync.exe" /s
	taskkill /f /im chrome.exe >nul 2>&1
	del "%temp%\mini_installer.sync.exe" >nul
	cls
	echo Chromium %MessageInstalled%
	pause
	goto %menu2%
)

:Opera
call :VERYNETWORK
cls
IF "%ARCH%"=="x86" (
    echo %MessageDownload%
	start /wait "Win7RevivalTool: Downloader" "%~dp0Bin\Aria2\%ARCH%\aria2c.exe" -d %temp% https://get.opera.com/ftp/pub/opera/desktop/95.0.4635.84/win/Opera_95.0.4635.84_Setup.exe
	cls
	echo %MessageInstalling%
	echo.
	"%temp%\Opera_95.0.4635.84_Setup.exe" /silent
	taskkill /f /im opera.exe >nul 2>&1
	del "%temp%\Opera_95.0.4635.84_Setup.exe" >nul
	cls
	echo Opera Browser %MessageInstalled%
	pause
	goto %menu2%
) ELSE (
    echo %MessageDownload%
	start /wait "Win7RevivalTool: Downloader" "%~dp0Bin\Aria2\%ARCH%\aria2c.exe" -d %temp% https://get.opera.com/ftp/pub/opera/desktop/95.0.4635.84/win/Opera_95.0.4635.84_Setup_x64.exe
	cls
	echo %MessageInstalling%
	echo.
	"%temp%\Opera_95.0.4635.84_Setup_x64.exe" /silent
	taskkill /f /im opera.exe >nul 2>&1
	del "%temp%\Opera_95.0.4635.84_Setup_x64.exe" >nul
	cls
	echo Opera Browser %MessageInstalled%
	pause
	goto %menu2%
)

:CentBrowser
call :VERYNETWORK
cls
IF "%ARCH%"=="x86" (
    echo %MessageDownload%
	start /wait "Win7RevivalTool: Downloader" "%~dp0Bin\Aria2\%ARCH%\aria2c.exe" -d %temp% https://static.centbrowser.com/win_stable/5.0.1002.354/centbrowser_5.0.1002.354.exe
	cls
	echo %MessageInstalling%
	echo.
	"%temp%\centbrowser_5.0.1002.354.exe" --cb-auto-update --do-not-launch-chrome --system-level
	del "%temp%\centbrowser_5.0.1002.354.exe" >nul
	cls
	echo CentBrowser %MessageInstalled%
	pause
	goto %menu2%
) ELSE (
    echo %MessageDownload%
	start /wait "Win7RevivalTool: Downloader" "%~dp0Bin\Aria2\%ARCH%\aria2c.exe" -d %temp% https://static.centbrowser.com/win_stable/5.0.1002.354/centbrowser_5.0.1002.354_x64.exe
	cls
	echo %MessageInstalling%
	echo.
	"%temp%\centbrowser_5.0.1002.354_x64.exe" --cb-auto-update --do-not-launch-chrome --system-level
	del "%temp%\centbrowser_5.0.1002.354_x64.exe" >nul
	cls
	echo CentBrowser %MessageInstalled%
	pause
	goto %menu2%
)

:quit
Cls
echo Limpiando.. Cleaning..
del /s /f /q %temp%\*.* >nul
rd /s /q %temp% >nul
md %temp% >nul
exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo Run this program as administrator to continue ...
 Pause & Exit
)
Cls
goto:eof

:VERYNETWORK
cls
echo %MessageNetworkWait%
ping > nul -n 1 www.google.com 
if errorlevel 1 (
    cls
    echo %MessageNetworOFF%
	echo.
	pause
	goto %menu%
)