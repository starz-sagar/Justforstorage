@echo off
:: Check for administrative privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Administrative privileges confirmed. Proceeding with block...
) else (
    echo ERR: You MUST right-click and "Run as Administrator" for this to work!
    pause
    exit /b
)

echo.
echo =======================================================
echo BLOCKING ALL BROWSER EXTENSIONS
echo =======================================================

:: 1. Block all extensions in Google Chrome
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /f >nul
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /v "1" /t REG_SZ /d "*" /f
if %errorLevel% == 0 (echo [SUCCESS] Google Chrome extensions blocked.) else (echo [FAILED] Chrome block failed.)

:: 2. Block all extensions in Microsoft Edge
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallBlocklist" /v "1" /t REG_SZ /d "*" /f
if %errorLevel% == 0 (echo [SUCCESS] Microsoft Edge extensions blocked.) else (echo [FAILED] Edge block failed.)

echo.
echo Operation complete. Please restart any open browsers to apply changes.
pause
