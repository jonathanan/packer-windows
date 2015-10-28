::http://support.microsoft.com/kb/2570538
::http://robrelyea.wordpress.com/2007/07/13/may-be-helpful-ngen-exe-executequeueditems/

if exist %windir%\microsoft.net\framework\v4.0.30319\ngen.exe (
	set dotnet_version=v4.0.30319
) else (
	set dotnet_version=v2.0.50727
)

if "%PROCESSOR_ARCHITECTURE%"=="AMD64" goto 64BIT

%windir%\microsoft.net\framework\%dotnet_version%\ngen.exe update /force /queue
%windir%\microsoft.net\framework\%dotnet_version%\ngen.exe executequeueditems

exit /b

:64BIT
%windir%\microsoft.net\framework\%dotnet_version%\ngen.exe update /force /queue
%windir%\microsoft.net\framework64\%dotnet_version%\ngen.exe update /force /queue
%windir%\microsoft.net\framework\%dotnet_version%\ngen.exe executequeueditems
%windir%\microsoft.net\framework64\%dotnet_version%\ngen.exe executequeueditems