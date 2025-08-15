@echo off
setlocal

REM Find latest Visual Studio installation path
for /f "usebackq tokens=*" %%i in (`"%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe" -latest -products * -requires Microsoft.Component.MSBuild -property installationPath`) do (
    set "VS_PATH=%%i"
)

if not defined VS_PATH (
    echo Visual Studio not found.
    exit /b 1
)

REM Call its Developer Command Prompt
call "%VS_PATH%\Common7\Tools\VsDevCmd.bat"

REM Keep terminal open
cmd
