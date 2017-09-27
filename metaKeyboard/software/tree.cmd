@echo off

setlocal enabledelayedexpansion

set directory=%~f1
if [%directory%] == [] set directory=%CD%

if exist %directory%\NUL (
    set directory=%directory%
) else (
    set directory=%~dp1
)

pushd %directory%

for /f "delims=" %%i in ('git rev-parse --show-toplevel') do set directory=%%i
git rev-parse --show-toplevel 1> nul 2> nul

if %errorlevel% EQU 0 (
    start "" "C:\Users\jsong12\AppData\Local\SourceTree\app-2.1.2.5\SourceTree.exe" -f %directory:/=\%
)

popd
endlocal