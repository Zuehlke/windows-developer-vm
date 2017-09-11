@echo off
REM if "%1"=="" goto no_params
echo Updating with configuration %1
echo Setting environment
set OLD_PATH=%PATH%

call %~dp0\env.cmd
call %~dp0\chef_check.cmd

REM subst L: %~dp0.
REM sleep 40
REM cd /D L:\
REM rd /S /Q nodes\

REM if not exist L:\berks-cookbooks (
REM   echo Pulling cookbook dependencies
REM   call berks vendor
REM   @if errorlevel 1 goto error
REM )

echo Running Chef
set START_PATH=%~dp0\..
echo %START_PATH:~0,-1%
echo ---------------------
echo HERE CHEF IS CALLED!!
echo ---------------------
call chef-client -z %START_PATH%/cookbooks/vm/recipes/default.rb

goto done

:no_params
echo ERROR: Missing parameter
goto finish

:error
echo ERROR: Berkshelf failed

:done
echo Resetting environment
cd /D %~dp0
REM subst L: /D
echo %PATH%
set PATH=%OLD_PATH%
echo Done
:finish
