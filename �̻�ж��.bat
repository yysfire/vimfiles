@echo off &Pushd %~dp0&Title �̻�ж��
:Menu
Cls
echo.&echo.  1.��װע��OLE��
echo.&echo.  2.��װ��OLE��
echo.&echo.  3.�����Ҽ��˵�
echo.&echo.  4.������ʼ�˵�
echo.&echo.  5.ж��
echo.&echo.  ����װ��OLE�棬����ж��!
echo.
:Menu
set /p Aaron=�����룺
if "%Aaron%"=="1" Goto Ole
if "%Aaron%"=="2" Goto NoOle
if "%Aaron%"=="3" Goto popup
if "%Aaron%"=="4" Goto Lnk
if "%Aaron%"=="5" Goto Un
echo.&echo ������Ч�����������룡
pause >nul
goto menu
:Ole
taskkill /f /im gvim.exe  >NUL 2>NUL
if exist vim74\gvim.exe.ole copy /y vim74\gvim.exe.ole vim74\gvim.exe >NUL 2>NUL
if exist vim74\install.exe vim74\install.exe -register-OLE >NUL 2>NUL
REM if exist vim74\VisVim.dll regsvr32.exe /s vim74\VisVim.dll
SET E=OLE�氲װ���!&GOTO MSGBOX
:NoOle
taskkill /f /im gvim.exe  >NUL 2>NUL
if exist vim74\gvim.exe.noole copy /y vim74\gvim.exe.noole vim74\gvim.exe >NUL 2>NUL
SET E=��OLE�氲װ���!&GOTO MSGBOX
:popup
if exist vim74\install.exe vim74\install.exe -install-popup -install-openwith >NUL 2>NUL
SET E=�Ҽ��˵���װ���!&GOTO MSGBOX
:Lnk
if exist vim74\install.exe vim74\install.exe -add-start-menu >NUL 2>NUL
SET E=��ʼ�˵���װ���!&GOTO MSGBOX
:Un
taskkill /f /im gvim.exe  >NUL 2>NUL
REM if exist vim74\VisVim.dll regsvr32.exe /u /s vim74\VisVim.dll
if exist vim74\uninstal.exe vim74\uninstal.exe -nsis >NUL 2>NUL
if exist vim74\gvim.exe del vim74\gvim.exe >NUL 2>NUL
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.vim /F>NUL 2>NUL
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.vim /F>NUL 2>NUL
reg delete HKEY_CLASSES_ROOT\.vim /F>NUL 2>NUL
SET E=ж�����!&GOTO MSGBOX
:MsgBox
if "%1"=="" mshta VBScript:MsgBox("%e%",vbSystemModal,"")(close)& Cls&Goto Menu
