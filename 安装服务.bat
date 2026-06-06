@echo off
cd /d "%~dp0"

echo Current Directory: %cd%
echo Installing service...

"%~dp0ASuperService.exe" /install /silent
if %errorlevel% neq 0 (
    echo Install failed, error code: %errorlevel%
    pause
    exit /b %errorlevel%
)

echo Install success, configuring dependency...
sc config "SuperService" depend= "Spooler"
if %errorlevel% neq 0 (
    echo Config dependency failed, error code: %errorlevel%
    pause
    exit /b %errorlevel%
)

echo Config success, starting service...
net start SuperService
if %errorlevel% neq 0 (
    echo Start failed, error code: %errorlevel%
    pause
    exit /b %errorlevel%
)

