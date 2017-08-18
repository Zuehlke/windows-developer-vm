@echo off
set CHEFDK_VERSION=1.1.16
set CHEFDK_MSI=chefdk-windows-%CHEFDK_VERSION%.msi
set CHEFDK_URL=http://10.48.29.5/depot/installers/chefdk-windows-%CHEFDK_VERSION%.msi
set CHEFDK_DIR=%TEMP%\chefdk
set CHEFDK_INSTALLER=%CHEFDK_DIR%\%CHEFDK_MSI%

@if exist "%CHEFDK_DIR%" goto download
echo ==^> Creating "%CHEFDK_DIR%"
mkdir "%CHEFDK_DIR%"

:download
echo ==^> Downloading ChefDK to %CHEFDK_INSTALLER%
echo ==^> Downloading "%CHEFDK_URL%" to "%CHEFDK_INSTALLER%"
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%CHEFDK_URL%', '%CHEFDK_INSTALLER%')" <NUL
if not exist "%CHEFDK_INSTALLER%" goto error
echo ==^> ChefDK downloaded successfully
goto done

:error
echo Failed to download ChefDK

:done
