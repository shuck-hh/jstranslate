@echo off
setlocal enabledelayedexpansion

goto :main

:config
echo Configuring jstranslate...
echo Enter language codes (e.g., en, de-DE, fr) separated by commas:
set /p translations=

echo %translations%>translations.txt

(
for %%L in (%translations:,= %) do echo %%L
)>jstranslate_langs.txt

echo Configuration saved.
echo.
echo You still need to create a .json file for each language in the jstranslate folder. The file should be named with the language code (e.g., en.json, de-DE.json) and contain the translations like on the GitHub page of the project shown.
goto :eof

:install
echo Installing...

if not exist jstranslate mkdir jstranslate
cd jstranslate

powershell -Command "Invoke-WebRequest -Uri 'https://github.com/shuck-hh/jstranslate/releases/latest/download/main.js' -OutFile 'main.js'"

if exist main.js (
    echo Download successful.
) else (
    echo Download failed.
    exit /b 1
)

echo Do you want to configure jstranslate now? (y/n)
set /p config_answer=

if /i "%config_answer%"=="y" (
    call :config
)

echo Installation complete.
exit /b 0

:main
cls
echo jstranslate-Installer
echo --------------------------
echo.
echo This will install jstranslate to the current folder.
echo Do you want to continue? (y/n)

set /p answer=

if /i not "%answer%"=="y" (
    echo Installation cancelled.
    exit /b 0
)

echo Starting installation...
call :install