@echo off
echo Checking Chef installation
set OLD_PATH=%PATH%
REM set PATH=C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0;C:\opscode\chefdk\bin;C:\opscode\chefdk\embedded\bin
REM set PATH=C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0;C:\opscode\chefdk\bin;C:\opscode\chefdk\embedded\bin
call chef-client -v
@if errorlevel 1 goto install
cd /D %~dp0
goto done

:install
echo Installing ChefDK
cd /D %~dp0
@if "%CHEFDK_INSTALLER%"=="" call download_chefdk.cmd
@if not exist %CHEFDK_INSTALLER% call download_chefdk.cmd
%CHEFDK_INSTALLER% /qb
@if errorlevel 1 goto error
goto done

:error
echo ChefDK is not installed
echo CHEFDK_INSTALLER was not defined 
echo and we failed to download ChefDK
echo ERROR: cannot proceed without Chef
goto done

:done
set PATH=%OLD_PATH%