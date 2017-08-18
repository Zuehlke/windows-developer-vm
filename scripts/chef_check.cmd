@echo off
echo Checking Chef installation
call chef-client -v > NUL 2>&1
@if errorlevel 1 goto install
cd /D %~dp0
goto done

:install
echo Installing ChefDK
cd /D %~dp0
@if "%CHEFDK_INSTALLER%"=="" call download_chefdk.cmd
@if not exist %CHEFDK_INSTALLER% call download_chefdk.cmd

echo Starting ChefDK installation (this could take several minutes)...
%CHEFDK_INSTALLER% /qb
@if errorlevel 1 goto error
echo ChefDK installed successfully
goto done

:error
echo ChefDK is not installed
echo CHEFDK_INSTALLER was not defined 
echo and we failed to download ChefDK
echo ERROR: cannot proceed without Chef
goto done

:done
