@echo off &Pushd %~dp0&Title 绿化卸载
:Menu
Cls
echo.&echo.  1.安装注册OLE版
echo.&echo.  2.安装非OLE版
echo.&echo.  3.创建右键菜单
echo.&echo.  4.创建开始菜单
echo.&echo.  5.卸载
echo.&echo.  若安装过OLE版，请先卸载!
echo.
:Menu
set /p Aaron=请输入：
if "%Aaron%"=="1" Goto Ole
if "%Aaron%"=="2" Goto NoOle
if "%Aaron%"=="3" Goto popup
if "%Aaron%"=="4" Goto Lnk
if "%Aaron%"=="5" Goto Un
echo.&echo 输入无效，请重新输入！
pause >nul
goto menu
:Ole
taskkill /f /im gvim.exe  >NUL 2>NUL
if exist vim74\gvim.exe.ole copy /y vim74\gvim.exe.ole vim74\gvim.exe >NUL 2>NUL
if exist vim74\install.exe vim74\install.exe -register-OLE >NUL 2>NUL
REM if exist vim74\VisVim.dll regsvr32.exe /s vim74\VisVim.dll
SET E=OLE版安装完成!&GOTO MSGBOX
:NoOle
taskkill /f /im gvim.exe  >NUL 2>NUL
if exist vim74\gvim.exe.noole copy /y vim74\gvim.exe.noole vim74\gvim.exe >NUL 2>NUL
SET E=非OLE版安装完成!&GOTO MSGBOX
:popup
if exist vim74\install.exe vim74\install.exe -install-popup -install-openwith >NUL 2>NUL
SET E=右键菜单安装完成!&GOTO MSGBOX
:Lnk
if exist vim74\install.exe vim74\install.exe -add-start-menu >NUL 2>NUL
SET E=开始菜单安装完成!&GOTO MSGBOX
:Un
taskkill /f /im gvim.exe  >NUL 2>NUL
REM if exist vim74\VisVim.dll regsvr32.exe /u /s vim74\VisVim.dll
if exist vim74\uninstal.exe vim74\uninstal.exe -nsis >NUL 2>NUL
if exist vim74\gvim.exe del vim74\gvim.exe >NUL 2>NUL
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.vim /F>NUL 2>NUL
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.vim /F>NUL 2>NUL
reg delete HKEY_CLASSES_ROOT\.vim /F>NUL 2>NUL
SET E=卸载完成!&GOTO MSGBOX
:MsgBox
if "%1"=="" mshta VBScript:MsgBox("%e%",vbSystemModal,"")(close)& Cls&Goto Menu
