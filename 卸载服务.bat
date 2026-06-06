@echo off
cd /d "%~dp0"

echo Stopping service...
net stop SuperService

echo Waiting for service to stop...
timeout /t 3 /nobreak >nul

echo Killing residual process...
taskkill /f /im ASuperService.exe 2>nul

echo Uninstalling service...
"%~dp0ASuperService.exe" /uninstall /silent

if %errorlevel% equ 0 (
    echo Uninstall successful.
) else (
    echo Uninstall failed, error code: %errorlevel%
)

