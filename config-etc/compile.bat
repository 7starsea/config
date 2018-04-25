@echo off
set "MSBuild=C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe"
set cmake="F:\Program Files (x86)\CMake\bin\cmake.exe"

set git="F:\Program Files (x86)\Git\bin\git.exe"

::cd "git source folder"

:: fetch git_branch
for /F "delims=" %%I in ('%git% rev-parse --abbrev-ref HEAD') do (set git_branch=%%I)
:: fetch git_hash 
for /F "delims=" %%V in ('%git% rev-parse HEAD') do (set git_hash=%%V)

::cd "back to build folder"

if not exist build mkdir build
cd build
if not exist %git_branch% mkdir %git_branch%
cd %git_branch%

::%cmake% "CMakeLists folder"

::%MSBuild% ALL_BUILD.vcxproj /nologo /t:build /p:Configuration=Debug
::%MSBuild% ALL_BUILD.vcxproj /nologo /t:build /p:Configuration=Release




pause