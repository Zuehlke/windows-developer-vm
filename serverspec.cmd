@echo off
cd tests
call rake spec 

IF %ERRORLEVEL% NEQ 0 (
	cd ..
	powershell .\scripts\notification.ps1
)
